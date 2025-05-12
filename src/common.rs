use std::{fs::File, sync::Arc, path::Path};
use std::io::{BufReader, Read, BufWriter};
use futures::join;
use actix::Message;
use osauth::client::AuthenticatedClient;
use osauth::common::IdOrName;
use regex::Regex;
use reqwest::{Client, ClientBuilder, Proxy};
use osm::common::OSMClient;
use serde_json::Value;
use std::time::Instant;
use serde::{Serialize, Deserialize};
use serde_yaml;
use sophia::{graph::{inmem::FastGraph, MutableGraph, Graph}, ns::*, term::TTerm};
use sophia::parser::{turtle, xml};
use sophia::triple::stream::TripleSource;
use sophia::serializer::{TripleSerializer,xml::RdfXmlSerializer, turtle::TurtleSerializer};
use uuid::Uuid;
use std::collections::HashMap;
use log::{debug, info};// error, Level, log_enabled};

use oxigraph::{store::Store, model::{NamedNode, GraphNameRef}, sparql::QueryResults, io::GraphFormat};
use oxigraph::model::{Quad, GraphName};
//use oxigraph::model::vocab::rdf;

use crate::{stack, api::sessions::SessionManager, monitor};

pub struct AppState {
    pub services: Vec<Service>,
    pub catalog: Catalog,
    pub network: Vec<Triple>,
    pub config: Config,
    pub session_manager: Arc<SessionManager>,
}

pub struct Service {
    pub id: String,
    pub name: String,
    pub intent_clean: TMFIntent,
    pub intent: OzIntent,
    pub service_definitions: Vec<String>,
    pub osm_id: String,
}

#[derive(Debug)]
pub struct OZError {
    pub msg: String,
}

#[derive(Serialize, Deserialize)]
pub struct KGraph {
    pub nodes: Vec<String>,
    pub links: Vec<Triple>,
}

#[derive(Serialize, Deserialize)]
pub struct OzIntent {
    pub status: Vec<(String, String)>, 
    pub intent: Vec<Triple>,
}

#[derive(Serialize, Deserialize, Debug, Message, Clone)]
#[rtype(result = "()")]
pub struct IntentStatus {
    pub name: String,
    pub value: String,
}

pub type PrologTriples = Vec<Triple>;
pub type TMFIntent = Vec<Triple>;
//pub type OzIntent = Vec<Triple>;
pub type Catalog = HashMap<String, Vec<Triple>>;

#[derive(Clone, Serialize, Deserialize, PartialEq)]
pub struct Triple {
    pub s: String,
    pub p: String,
    pub o: String,
}

#[derive(Serialize, Deserialize)]
pub struct Config {
    pub osm: OSMConfig,
    pub openstack: OpenstackConfig,
    pub oz: OzConfig,
    pub prometheus: monitor::PromConfig,
}

#[derive(Serialize, Deserialize)]
pub struct OzConfig {
    pub kind: String,
} 

#[derive(Serialize, Deserialize)]
pub struct OSMConfig {
    pub url: String, 
    pub username: String, 
    pub password: String, 
    pub project_id: String, 
    pub proxy: Option<String>, 
}

#[derive(Serialize, Deserialize)]
pub struct OpenstackConfig {
    pub url: String, 
    pub username: String, 
    pub password: String, 
    pub project_id: String, 
    pub domain: String, 
    pub proxy: Option<String>, 
}

#[derive(Serialize, Deserialize)]
pub struct DBConfig {
    pub address: String,
    pub port: u64,
    pub username: String, 
    pub password: String, 
}

impl OSMConfig {
    pub async fn get_client(&self) -> OSMClient {
        match &self.proxy {
            Some(p) => {
                osm::common::OSMClient::new_with_transport(
                    self.url.as_str(),
                    osm::auth::AuthOptions::new(
                        self.username.as_str(),
                        self.password.as_str(),
                    ),
                    ClientBuilder::new().proxy(Proxy::http(p).unwrap()).build().unwrap()
                )
            }
            None => {
                osm::common::OSMClient::new(
                    self.url.as_str(),
                    osm::auth::AuthOptions::new(
                        self.username.as_str(),
                        self.password.as_str(),
                    )
                )
            }
        }
    }
}

impl OpenstackConfig {
    pub async fn get_client(&self) -> AuthenticatedClient {
        let mut c_builder = Client::builder();
        match &self.proxy {
            Some(proxy_val) => {
                let proxy = Proxy::https(proxy_val);
                c_builder = match proxy {
                    Ok(p) => c_builder.proxy(p),
                    Err(e) => panic!("{:?}", e),
                };
            }
            None => ()
        }
        c_builder = c_builder.danger_accept_invalid_certs(true);
        let proxy_client = c_builder.build().unwrap();
     
        let scope = osauth::identity::Scope::Project { 
            project: IdOrName::from_id(&self.project_id), 
            domain: Some(IdOrName::from_id(&self.domain)),
        };
        let ac = osauth::client::AuthenticatedClient::new(
            proxy_client,
            osauth::identity::Password::new(
                &self.url,
                &self.username,
                &self.password,
                &self.domain,
            )
            .expect("Invalid auth_url")
            .with_scope(scope),
        ).await;

        match ac {
            Err(e) => panic!("{:?}", e),
            Ok(o) => {
                o
            }
        }
    }
}

pub fn ontology_from_file(path: &str) -> Result<Store, OZError> {
    let store = Store::new().unwrap();
    
    if let Ok(file) = File::open(path) {
        debug!("File opened!");
        let br = BufReader::new(file);
        if let Ok(_) = store.load_graph(br, GraphFormat::Turtle, GraphNameRef::DefaultGraph, None) {
            return Ok(store)
        }
    }

    return Err(OZError{msg: "Ontology from file".to_string()})
}


pub fn generate_id() -> String {
    Uuid::new_v4().to_string()
}

fn fmt_prefix(pre: &str, val: &str) -> NamedNode {
    //let nn = NamedNode::new(format!("{}{}", pre, val)).unwrap();
    let nn = NamedNode::new_unchecked(format!("{}{}", pre, val));
    nn
}

pub async fn new_osm_to_triples(id: &str, client: &OSMClient) -> Option<Vec<Triple>> {
    use oxigraph::model::vocab::rdf;

    let nsr = osm::nslcm::show_instance(id, client).await.unwrap();

    let mut vim_ids: Vec<(String, String)> = Vec::new();

    let store = Store::new().unwrap();
    let nm = "http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#";
    let ln = "http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/tmf_example/live_network#";
    let _graphname = GraphName::DefaultGraph;

    store.insert(&Quad::new(
        fmt_prefix(ln, &nsr.name),
        rdf::TYPE,
        fmt_prefix(nm, "Service"),
        GraphName::DefaultGraph
    )).unwrap();
    
    let sfc_name = fmt_prefix(nm, "Service"); 

    store.insert(&Quad::new(
        sfc_name.clone(),
        rdf::TYPE,
        fmt_prefix(nm, "ServiceFunctionChain"),
        GraphName::DefaultGraph
    )).unwrap();

    store.insert(&Quad::new(
        fmt_prefix(ln, &nsr.name),
        fmt_prefix(nm, "hasServiceFunctionChain"),
        sfc_name.clone(),
        GraphName::DefaultGraph
    )).unwrap();

    for i in nsr.vnfd_id.iter() {
        let vnfd = osm::vnf::show_vnfd(&i, client).await.unwrap();
        store.insert(&Quad::new(
            fmt_prefix(ln, &vnfd.id),
            rdf::TYPE,
            fmt_prefix(nm, "Package"),
            GraphName::DefaultGraph
        )).unwrap();
        store.insert(&Quad::new(
            sfc_name.clone(),
            fmt_prefix(nm, "hasPackage"),
            fmt_prefix(ln, &vnfd.id),
            GraphName::DefaultGraph
        )).unwrap();

        for r in nsr.vnfr_ref.iter() {
            let vnfr = osm::nslcm::show_vnfr(&r, client).await.unwrap();
            //let vnfr_name = format!("{}_{}", vnfd.id, i);
            let vnfr_name = format!("{}", vnfd.id);
            if vnfd._id == vnfr.vnfd_id {
                store.insert(&Quad::new(
                    fmt_prefix(ln, &vnfr_name),
                    rdf::TYPE,
                    fmt_prefix(nm, &function_type(&vnfd.id)),
                    GraphName::DefaultGraph
                )).unwrap();
                store.insert(&Quad::new(
                    fmt_prefix(ln, &vnfd.id),
                    fmt_prefix(nm, "hasInstance"),
                    fmt_prefix(nm, &vnfr_name),
                    GraphName::DefaultGraph
                )).unwrap();
                for vd in vnfr.vdur.iter() {
                    let vd_name = format!("{}_{}", vd.vdu_name, vd.id);
                    store.insert(&Quad::new(
                        fmt_prefix(ln, &vd_name),
                        rdf::TYPE,
                        fmt_prefix(nm, "DeploymentUnit"),
                        GraphName::DefaultGraph
                    )).unwrap();
                    store.insert(&Quad::new(
                        fmt_prefix(ln, &vd_name),
                        rdf::TYPE,
                        fmt_prefix(nm, "VirtualDevice"),
                        GraphName::DefaultGraph
                    )).unwrap();
                    store.insert(&Quad::new(
                        fmt_prefix(ln, &vnfr_name),
                        fmt_prefix(nm, "hasDeploymentUnit"),
                        fmt_prefix(nm, &vd_name),
                        GraphName::DefaultGraph
                    )).unwrap();
                    info!("VDU Name: {}", &vd.vdu_name);
                    info!("VDU ID: {}", &vd.id);
                    vim_ids.push((vnfr.vim_id.clone(), vd_name.clone()));
                    /*
                    store.insert(&Quad::new(
                        fmt_prefix(ln, &vd.vdu_name),
                        fmt_prefix(nm, "isRunningon"),
                        //fmt_prefix(nm, &vnfr.vim_id),
                        fmt_prefix(nm, format!("{}_hypervisor", &vnfr.vim_id).as_str()),
                    )).unwrap();
                    */
                    for intf in vd.interfaces.iter() {
                        let intf_name = format!("{}_{}", &vd_name, &intf.name);
                        store.insert(&Quad::new(
                            fmt_prefix(ln, &intf_name),
                            rdf::TYPE,
                            fmt_prefix(nm, "Interface"),
                            GraphName::DefaultGraph
                        )).unwrap();
                        store.insert(&Quad::new(
                            fmt_prefix(ln, &vd_name),
                            fmt_prefix(nm, "hasInterface"),
                            fmt_prefix(ln, &intf_name),
                            GraphName::DefaultGraph
                        )).unwrap();
                    }
                }
            }
        }
    }

    // Insert Vims, details and relation to VNFRs
    let mut added_vims: Vec<String> = Vec::new();
    for (k, v) in vim_ids {
        // TODO: Don't fetch every time
        let vim = osm::admin::show_vim(k.as_str(), client).await.unwrap();
        if !added_vims.contains(&k) {
            let res_desc = format!("{}_resdesc", &vim._id);
            store.insert(&Quad::new(
                fmt_prefix(ln, &vim.name),
                rdf::TYPE,
                fmt_prefix(nm, "PhysicalMachine"),
                GraphName::DefaultGraph
            )).unwrap();
            store.insert(&Quad::new(
                fmt_prefix(ln, format!("{}_hypervisor", &vim.name).as_str()),
                rdf::TYPE,
                fmt_prefix(nm, "Hypervisor"),
                GraphName::DefaultGraph
            )).unwrap();
            store.insert(&Quad::new(
                fmt_prefix(ln, format!("{}_hypervisor", &vim.name).as_str()),
                fmt_prefix(nm, "isRunningOn"),
                fmt_prefix(ln, &vim.name),
                GraphName::DefaultGraph
            )).unwrap();
            store.insert(&Quad::new(
                fmt_prefix(ln, &res_desc),
                fmt_prefix(nm, "hasStorageResource"),
                fmt_prefix(ln, format!("{}_storage", &vim._id).as_str()),
                GraphName::DefaultGraph
            )).unwrap();
            store.insert(&Quad::new(
                fmt_prefix(ln, &res_desc),
                fmt_prefix(nm, "hasNetworkResource"),
                fmt_prefix(ln, format!("{}_network", &vim._id).as_str()),
                GraphName::DefaultGraph
            )).unwrap();
            store.insert(&Quad::new(
                fmt_prefix(ln, &res_desc),
                fmt_prefix(nm, "hasMemoryResource"),
                fmt_prefix(ln, format!("{}_memory", &vim._id).as_str()),
                GraphName::DefaultGraph
            )).unwrap();
            store.insert(&Quad::new(
                fmt_prefix(ln, format!("{}_hypervisor", &vim.name).as_str()),
                fmt_prefix(nm, "hasResourceDescription"),
                fmt_prefix(ln, format!("{}_resdesc", &vim._id).as_str()),
                GraphName::DefaultGraph
            )).unwrap();
            added_vims.push(k);
        }
        store.insert(&Quad::new(
            fmt_prefix(ln, &v),
            fmt_prefix(nm, "isRunningOn"),
            fmt_prefix(ln, format!("{}_hypervisor", &vim.name).as_str()),
            GraphName::DefaultGraph
        )).unwrap();
    }

    new_to_rdf(store)
}

pub async fn osm_to_triples(id: &str, cfg: &Config) -> Option<Vec<Triple>> {

    let mut osm = cfg.osm.get_client().await;

    // Get machine stats
    let m_stats = monitor::get_all(&cfg.prometheus).await;

    osm::auth::get_token(&mut osm).await;
    //let prom = cfg.prometheus.get_client();

    let nsr = osm::nslcm::show_instance(id, &osm).await.unwrap();
    let mut vim_ids: Vec<(String, String)> = Vec::new();


    let mut graph = FastGraph::new(); 
    let nm = Namespace::new("http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#").unwrap();
    let ln = Namespace::new("http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/tmf_example/live_network#").unwrap();
    let xsds = Namespace::new(xsd::PREFIX).unwrap();

    graph.insert(
        &ln.get(&nsr.name).unwrap(),
        &rdf::type_,
        &nm.get("Service").unwrap(),
    ).unwrap();

    let sfc_name = format!("{}{}", nsr.name, "_FC");

    graph.insert(
        &ln.get(&sfc_name).unwrap(),
        &rdf::type_,
        &nm.get("ServiceFunctionChain").unwrap(),
    ).unwrap();
    graph.insert(
        &ln.get(&nsr.name).unwrap(),
        &nm.get("hasServiceFunctionChain").unwrap(),
        &ln.get(&sfc_name).unwrap(),
    ).unwrap();

    for i in nsr.vnfd_id.iter() {
        let vnfd = osm::vnf::show_vnfd(&i, &osm).await.unwrap();
        graph.insert(
            &ln.get(&vnfd.id).unwrap(),
            &rdf::type_,
            &nm.get("Package").unwrap(),
        ).unwrap();
        graph.insert(
            &ln.get(&sfc_name).unwrap(),
            &nm.get("hasPackage").unwrap(),
            &ln.get(&vnfd.id).unwrap(),
        ).unwrap();

        for r in nsr.vnfr_ref.iter() {
            let vnfr = osm::nslcm::show_vnfr(&r, &osm).await.unwrap();
            let vnfr_name = format!("{}_{}", vnfr.id, i);
            if vnfd._id == vnfr.vnfd_id {
                graph.insert(
                    &ln.get(&vnfr_name).unwrap(),
                    &rdf::type_,
                    &nm.get(&function_type(&vnfd.id)).unwrap(),
                ).unwrap();
                graph.insert(
                    &ln.get(&vnfd.id).unwrap(),
                    &nm.get("hasInstance").unwrap(),
                    &nm.get(&vnfr_name).unwrap(),
                ).unwrap();
                for vd in vnfr.vdur.iter() {
                    let vd_name = format!("{}_{}", vd.vdu_name, vd.id);
                    graph.insert(
                        &ln.get(&vd_name).unwrap(),
                        &rdf::type_,
                        &nm.get("DeploymentUnit").unwrap(),
                    ).unwrap();
                    graph.insert(
                        &ln.get(&vd_name).unwrap(),
                        &rdf::type_,
                        &nm.get("VirtualDevice").unwrap(),
                    ).unwrap();
                    graph.insert(
                        &ln.get(&vnfr_name).unwrap(),
                        &nm.get("hasDeploymentUnit").unwrap(),
                        &nm.get(&vd_name).unwrap(),
                    ).unwrap();
                    vim_ids.push((vnfr.vim_id.clone(), vd_name.clone()));
                    for intf in vd.interfaces.iter() {
                        let intf_name = format!("{}_{}", intf.name, vd.id);
                        graph.insert(
                            &ln.get(&intf_name).unwrap(),
                            &rdf::type_,
                            &nm.get("Interface").unwrap(),
                        ).unwrap();
                        graph.insert(
                            &ln.get(&vd_name).unwrap(),
                            &nm.get("hasInterface").unwrap(),
                            &ln.get(&intf_name).unwrap(),
                        ).unwrap();
                        if let Some(ip) = &intf.ip_addr {
                            graph.insert(
                                &ln.get(&intf_name).unwrap(),
                                &nm.get("hasIPv4Address").unwrap(),
                                &ln.get(format!("{}", ip).as_str()).unwrap(),
                            ).unwrap();

                            if let Some(i) = m_stats.iter().find(|x| x.address.contains(ip)) {
                                graph.insert(
                                    &ln.get(format!("{}", &vd_name).as_str()).unwrap(),
                                    &nm.get("cpuUtilization").unwrap(),
                                    &xsds.get(&i.cpu_util.to_string()).unwrap(),
                                ).unwrap();
                            }
                        }
                    }
                }
            }
        }
    }

    // Insert Vims, details and relation to VNFRs
    let mut added_vims: Vec<String> = Vec::new();
    for (k, v) in vim_ids {
        // TODO: Don't fetch every time
        let vim = osm::admin::show_vim(k.as_str(), &osm).await.unwrap();
        if !added_vims.contains(&k) {
            let res_desc = format!("{}_resdesc", &vim._id);
            graph.insert(
                &ln.get(&vim.name).unwrap(),
                &rdf::type_,
                &nm.get("PhysicalMachine").unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(format!("{}_hypervisor", &vim.name).as_str()).unwrap(),
                &rdf::type_,
                &nm.get("Hypervisor").unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(format!("{}_hypervisor", &vim.name).as_str()).unwrap(),
                &nm.get("isRunningOn").unwrap(),
                &ln.get(&vim.name).unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(&res_desc).unwrap(),
                &nm.get("hasStorageResource").unwrap(),
                &ln.get(format!("{}_storage", &vim._id).as_str()).unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(&res_desc).unwrap(),
                &nm.get("hasNetworkResource").unwrap(),
                &ln.get(format!("{}_network", &vim._id).as_str()).unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(&res_desc).unwrap(),
                &nm.get("hasMemoryResource").unwrap(),
                &ln.get(format!("{}_memory", &vim._id).as_str()).unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(format!("{}_hypervisor", &vim.name).as_str()).unwrap(),
                &nm.get("hasResourceDescription").unwrap(),
                &ln.get(format!("{}_resdesc", &vim._id).as_str()).unwrap(),
            ).unwrap();
            added_vims.push(k);
        }
        graph.insert(
            &ln.get(&v).unwrap(),
            &nm.get("isRunningOn").unwrap(),
            &ln.get(format!("{}_hypervisor", &vim.name).as_str()).unwrap(),
        ).unwrap();

        if let Some(s) = m_stats.iter().find(|x| &x.hostname == &vim.name) {
            graph.insert(
                &ln.get(format!("{}", &vim.name).as_str()).unwrap(),
                &nm.get("cpuUtilization").unwrap(),
                &xsds.get(&s.cpu_util.to_string()).unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(format!("{}", &vim.name).as_str()).unwrap(),
                &nm.get("storageResource").unwrap(),
                &xsds.get(&s.disk_total).unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(format!("{}", &vim.name).as_str()).unwrap(),
                &nm.get("storageUtilization").unwrap(),
                &xsds.get(&s.disk_free).unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(format!("{}", &vim.name).as_str()).unwrap(),
                &nm.get("memoryResource").unwrap(),
                &xsds.get(&s.mem_total).unwrap(),
            ).unwrap();
            graph.insert(
                &ln.get(format!("{}", &vim.name).as_str()).unwrap(),
                &nm.get("memoryUtilization").unwrap(),
                &xsds.get(&s.mem_free).unwrap(),
            ).unwrap();
        }
    }

    to_rdf(graph)
}    

pub fn function_type(name: &str) -> String {
    let sbe = Regex::new(r"SBE").unwrap();
    let vlb = Regex::new(r"VLB").unwrap();

    if sbe.is_match(name) {
        return "BackendFunction".to_string()
    } else if vlb.is_match(name) {
        return "LoadBalanceFunction".to_string()
    } else {
        return "Function".to_string()
    }
    
} 

pub fn new_to_rdf(store: Store) -> Option<Vec<Triple>> {
    let mut triples: Vec<Triple> = Vec::new();

    let query = "SELECT * WHERE { ?s ?p ?o }";
   
    if let Ok(QueryResults::Solutions(mut solutions)) = store.query(query) {
        while let Some(solution) = solutions.next() {
            match solution {
                Ok(sol) => {
                    let s = sol.get("s").unwrap().to_string();
                    let p = sol.get("p").unwrap().to_string();
                    let o = sol.get("o").unwrap().to_string();
                    triples.push(Triple { s, p, o });
                },
                Err(_err) => return None,
            }
        }
    }
    Some(triples)
}

// Convert a file object to a Vector of Triples
pub fn to_rdf(graph: FastGraph) -> Option<Vec<Triple>> {
    use sophia::triple::Triple as STriple;
    let mut triples: Vec<Triple> = Vec::new();

    graph.triples().for_each_triple(|t| {
        triples.push(
            Triple {
                s: t.s().value().to_string(),
                p: t.p().value().to_string(),
                o: t.o().value().to_string(),
            }
        );
        // May be useful for slashing prefixes?
        //triples.push(
        //    Triple {
        //        s: format!("{}{}", t.s().value_raw().0, t.s().value_raw().1.unwrap()),
        //        p: format!("{}{}, t.p().value_raw().0, t.p().value_raw().1.unwrap()),
        //        o: format!("{}{}", t.o().value_raw().0, t.o().value_raw().1.unwrap()),
        //    }
        //);
    }).unwrap();
    
    Some(triples)
}

pub fn dummy_data(file: &str) -> Vec<Triple> {
    let file = File::open(file).unwrap();
    let onto: FastGraph = turtle::parse_bufread(BufReader::new(file)).collect_triples().unwrap();
    to_rdf(onto).unwrap()
    /*
    let onto = ontology_from_file(file).unwrap();
    new_to_rdf(onto).unwrap()
    */
}

pub async fn update_data(config: &Config) -> Vec<Triple> {

    let start = Instant::now();
    
    let stack = async {
        let ostack = config.openstack.get_client().await;
        let _hyps: Value = stack::list_hypervisors(ostack).await.json().await.unwrap();
        
        _hyps
    };

    let triples = async {
        let mut osm = config.osm.get_client().await;

        let _done = osm::auth::get_token(&mut osm).await;
       
        let mut triples: Vec<Triple> = Vec::new();
        let nsis = osm::nslcm::list_instances(&osm).await.unwrap();

        for nsi in nsis.iter() {
            let now = Instant::now();
            //let o_triples = new_osm_to_triples(nsi.id.as_str(), &osm).await;
            let o_triples = osm_to_triples(nsi.id.as_str(), &config).await;
            match o_triples {
                Some(mut t) => triples.append(&mut t),
                None => ()
            }
            println!("OSM TRIPLES DIFF: {}", now.elapsed().as_millis());
        }
        info!("Oz: OSM to Ontology - {}ms", start.elapsed().as_millis());
        triples
    };

    let (_stack, triples) = join!(stack, triples);

    triples
}

pub fn read_config() -> Config {
    let config = File::open("config.yaml").unwrap();
    let config_reader = BufReader::new(config);
    let cfg: Config = serde_yaml::from_reader(config_reader).unwrap();

    cfg
}

pub fn triple_subtraction(subject: Vec<Triple>, from: Vec<Triple>) -> Vec<Triple> {
    let mut new = Vec::new();

    for i in subject.iter() {
        if !from.contains(i) {
            new.push(i.clone());
        }        
    }
    new
}

pub fn turtle_to_xml(f: &mut File, out: &'static str) {
    let mut ontology = String::new();
    let _err = f.read_to_string(&mut ontology).unwrap().to_string();

    let graph: FastGraph = turtle::parse_str(&ontology).collect_triples().unwrap();
    let f: File = File::create(out).unwrap();
    let mut serializer = RdfXmlSerializer::new(BufWriter::new(f));
    serializer.serialize_graph::<FastGraph>(&graph).unwrap();

    println!("Success");    
}

pub fn xml_to_turtle(f: &mut File, out: &'static str) {
    let mut ontology = String::new();
    let _err = f.read_to_string(&mut ontology).unwrap().to_string();

    let graph: FastGraph = xml::parse_str(&ontology).collect_triples().unwrap();
    let f: File = File::create(out).unwrap();
    let mut serializer = TurtleSerializer::new(BufWriter::new(f));
    serializer.serialize_graph::<FastGraph>(&graph).unwrap();

    println!("Success");    
}

pub fn parse_turtle(path: &Path) -> Result<FastGraph, OZError> {
    match File::open(path) {
        Ok(f) => {
            let bf = BufReader::new(f);
            Ok(turtle::parse_bufread(bf).collect_triples().unwrap())
        },
        Err(err) => panic!("{}", err),
    }
}

pub fn vec_to_vec(_in: Vec<&str>) -> Vec<String> {
    let out: Vec<String>;
    out = _in.iter().map(|s| s.to_string()).collect();
    out
}
