use lazy_static::lazy_static;
use log::{info, debug};
use osm::nsd::NSD;
use oxigraph::sparql::QueryResults;
use oxigraph::store::Store;
use regex::Regex;
use serde_json::{Value, Map};
use sophia::term::Term as STerm;
use swipl::prelude::*;
use sophia::graph::{*, inmem::FastGraph};
use std::error::Error;
use std::time::Instant;
use crate::common::{AppState, PrologTriples, OZError};

use super::common;
use super::common::Triple;

mod ontology;

pub struct DomainExpert {
    engine: Engine,
}

// Maybe write copy trait, then query entire rdf
// graph, copy into new prolog object and create
// new prolog engine?
//impl<'a, T> DomainExpert<'a, T>
//where T: ContextType
//{
impl DomainExpert {
    pub fn new() -> DomainExpert {
    //pub fn new() -> DomainExpert<'a, T> {
        DomainExpert {
            engine: Engine::new(),
        }
    }

    fn activate(&self) -> Context<ActivatedEngine> {
        let activation = self.engine.activate();
        let ctx: Context<_> = activation.into();

        ctx
    } 

    pub fn clear(&mut self) {
        self.engine = Engine::new();
    }


    pub fn load_prolog_all(&self) {
        let ctx = self.activate();
        let _load = ctx.call_once(pred!{consult/1}, [&term!{ctx: "./prolog/oz.pro"}.unwrap()]).unwrap();
        let _on = ctx.call_once(pred!{consult/1}, [&term!{ctx: "./prolog/ont_network.pro"}.unwrap()]).unwrap();
        let _oi = ctx.call_once(pred!{consult/1}, [&term!{ctx: "./prolog/ont_intent.pro"}.unwrap()]).unwrap();
        ctx.call_once(pred!{test/0}, []).unwrap();
    }

    pub fn insert_store(&self, store: Store, graph_name: &str) {
        let ctx = self.activate();

        let query = "SELECT * WHERE { ?s ?p ?o }";
       
        if let Ok(QueryResults::Solutions(mut solutions)) = store.query(query) {
            while let Some(solution) = solutions.next() {
                match solution {
                    Ok(sol) => {
                        let s = ctx.new_term_ref();
                        let p = ctx.new_term_ref();
                        let o = ctx.new_term_ref();
                        let g = ctx.new_term_ref();

                        let st_s = sol.get("s").unwrap().to_string();
                        let st_p = sol.get("p").unwrap().to_string();
                        let st_o = sol.get("o").unwrap().to_string();

                        debug!("Insert Data S: {:?}", st_s);
                        s.unify(Atom::new(&st_s)).unwrap();
                        p.unify(Atom::new(&st_p)).unwrap();
                        o.unify(Atom::new(&st_o)).unwrap();
                        g.unify(Atom::new(&graph_name)).unwrap();

                        let query = rdf_assert(&ctx, &s, &p, &o, &g);
                        let res = query.once();
                        match res {
                            Ok(..) => debug!("Yahoo!"),
                            Err(err) => debug!("Assert Query: {:?}", err.source()),
                        }
                    },
                    Err(_err) => return,
                }
            }
        }
    }

    pub fn insert_data(&self, triples: &Vec<Triple>, graph_name: &str) {
        /* It's working don't question it...
        * When frame is called 'frame' it doesn't work...
        * Seems like 'shadowing' the variable works...
        * No idea why tho...
        * To try:
        * 1. Using the same terms, but clearing and iterating
        * 2. Discard only the references not the frame
        * 3. Use anonymous references
        */ 
        let ctx = self.activate();
        for t in triples.iter() {
            let ctx = ctx.open_frame();
            let s = ctx.new_term_ref();
            let p = ctx.new_term_ref();
            let o = ctx.new_term_ref();
            let g = ctx.new_term_ref();
            debug!("Insert Data S: {:?}", t.s);
            s.unify(Atom::new(&t.s)).unwrap();
            p.unify(Atom::new(&t.p)).unwrap();
            o.unify(Atom::new(&t.o)).unwrap();
            g.unify(Atom::new(&graph_name)).unwrap();
            let query = rdf_assert(&ctx, &s, &p, &o, &g);
            let res = query.once();
            match res {
                Ok(..) => debug!("Yahoo!"),
                Err(err) => debug!("Assert Query: {:?}", err.source()),
            }
            ctx.discard();
        }
    }

    pub fn get_context(&self) -> Context<ActivatedEngine> {
        self.activate()
    }

    //pub fn query_extract<const N: usize>(&self, pred: CallablePredicate<N>) -> Vec<Vec<Value>> {
    pub fn query_extract<const N: usize>(&self, ctx: &Context<ActivatedEngine>, pred: CallablePredicate<N>) -> Vec<Vec<Value>> {
        //let ctx = self.activate();
        let mut owner_vec: Vec<Term> = Vec::new();
        let borrow_vec: Vec<&Term>;
        let term_list: [&Term; N];
        for _ in 0..N {
            let v = ctx.new_term_ref();
            owner_vec.push(v);
        }
        borrow_vec = owner_vec.iter().collect();    
        term_list = borrow_vec.try_into().unwrap();

        let query = ctx.open(pred, term_list);
        let triples = extract_all_auto(&query, term_list);
        triples
    }

    pub fn query_first<const N: usize>(&self, ctx: &Context<ActivatedEngine>, pred: CallablePredicate<N>) {
        let mut owner_vec: Vec<Term> = Vec::new();
        let borrow_vec: Vec<&Term>;
        let in_terms: [&Term; N];
        for _ in 0..N {
            let v = ctx.new_term_ref();
            owner_vec.push(v);
        }
        borrow_vec = owner_vec.iter().collect();    
        in_terms = borrow_vec.try_into().unwrap();
        let query = ctx.open(pred, in_terms);
        let _res = query.once();
        /*
        match res {
            swipl::result::PrologResult::Err(err) => println!("{}", err),
            _ => ()
        }
        */
    }
}

// Prolog Functions
prolog! {

    #[module("semweb/rdf11")]
    fn rdf_assert(s, p, o, g);

    #[module("semweb/rdf11")]
    fn rdf(s, p, o, g);

    fn clear_network();

    #[module("network")]
    fn dump_network(s, p, o);
    #[module("network")]
    fn dump_inferred_network(s, p, o);
    #[module("network")]
    fn dump_intent(s, p, o);
    #[module("network")]
    fn dump_inferred_intent(s, p, o);
    #[module("network")]
    fn dump_prospect_network(s, p, o);
    #[module("network")]
    fn dump_deployment(s, p, o);
    #[module("network")]
    fn dump_core_switches(s, p, o);
    #[module("network")]
    fn dump_metro_switches(s, p, o);
    #[module("network")]
    fn dump_access_switches(s, p, o);
    #[module("network")]
    fn dump_hosts(s, p, o);

    #[module("network")]
    fn assert_connected(s);
    #[module("network")]
    fn assert_secure();
    #[module("network")]
    fn assert_redundant(s);
    #[module("network")]
    fn assert_most(s, o);
    #[module("network")]
    fn assert_all(s, o);

    #[module("network")]
    fn fix_all();
    #[module("network")]
    fn fix_availability();
    #[module("network")]
    fn fix_security();
    #[module("network")]
    fn fix_connectivity();
    #[module("network")]
    fn fix_load();
    #[module("network")]
    fn try_fix_all();
    #[module("network")]
    fn execute_changes();

    #[module("network")]
    fn dump_nsd(d);
}

//macro_rules! extract_terms {
//    ($ctx:ty, $($arg:tt)+) => {
//                
//    };
//}

/// Activate a prolog engine
pub fn load_prolog<'a>(engine: &'a Engine) -> Context<'a, ActivatedEngine<'a>> {
    let activation = engine.activate();
    let ctx: Context<_> = activation.into();

    ctx
}

/// Activate a prolog engine and load ./prolog/oz.pro
pub fn load_prolog_oz<'a>(engine: &'a Engine) -> Context<'a, ActivatedEngine<'a>> {
    let ctx = load_prolog(engine);
    let _load = ctx.call_once(pred!{consult/1}, [&term!{ctx: "./prolog/oz.pro"}.unwrap()]).unwrap();
    let _on = ctx.call_once(pred!{consult/1}, [&term!{ctx: "./prolog/ont_network.pro"}.unwrap()]).unwrap();
    let _oi = ctx.call_once(pred!{consult/1}, [&term!{ctx: "./prolog/ont_intent.pro"}.unwrap()]).unwrap();

    ctx
}

pub fn load_prolog_all<'a>(engine: &'a Engine) -> Context<'a, ActivatedEngine<'a>> {
    let ctx = load_prolog(engine);
    let _load = ctx.call_once(pred!{consult/1}, [&term!{ctx: "./prolog/oz.pro"}.unwrap()]).unwrap();
    let _on = ctx.call_once(pred!{consult/1}, [&term!{ctx: "./prolog/ont_network.pro"}.unwrap()]).unwrap();
    let _oi = ctx.call_once(pred!{consult/1}, [&term!{ctx: "./prolog/ont_intent.pro"}.unwrap()]).unwrap();
    ctx.call_once(pred!{test/0}, []).unwrap();

    ctx
}

/// Insert a Vec<Triple> into an active prolog context
/// TODO: Make graph_name optional
pub fn insert_data<'a>(ctx: &Context<'a, ActivatedEngine<'a>>, triples: &Vec<Triple>, graph_name: &str) {
    /* It's working don't question it...
    * When frame is called 'frame' it doesn't work...
    * Seems like 'shadowing' the variable works...
    * No idea why tho...
    * To try:
    * 1. Using the same terms, but clearing and iterating
    * 2. Discard only the references not the frame
    * 3. Use anonymous references
    */ 
    for t in triples.iter() {
        let ctx = ctx.open_frame();
        let s = ctx.new_term_ref();
        let p = ctx.new_term_ref();
        let o = ctx.new_term_ref();
        let g = ctx.new_term_ref();
        debug!("Insert Data S: {:?}", t.s);
        s.unify(Atom::new(&t.s)).unwrap();
        p.unify(Atom::new(&t.p)).unwrap();
        o.unify(Atom::new(&t.o)).unwrap();
        g.unify(Atom::new(&graph_name)).unwrap();
        let query = rdf_assert(&ctx, &s, &p, &o, &g);
        let res = query.once();
        match res {
            Ok(..) => debug!("Yahoo!"),
            Err(err) => debug!("Assert Query: {:?}", err.source()),
        }
        ctx.discard();
    }
}

fn extract_all_auto<const N: usize>(query: &Context<impl OpenCall>, terms: [&Term; N]) -> Vec<Vec<Value>> {
    let mut result: Vec<Vec<Value>> = Vec::new();
    let mut next = true;
    while next == true {
        match query.next_solution() {
            Ok(ok) => {
                debug!("Next: {}", ok);
                next = ok;
                let mut res: Vec<Value> = Vec::new();
                let ctx = query.open_frame();
                for i in 0..terms.len() {
                    //println!("{:?}", terms[i]);
                    let ttj = term_to_json(&ctx, terms[i]);
                    debug!("{ttj:?}");
                    res.push(ttj);
                }
                result.push(res);
            },
            Err(err) => {
                debug!("Next: {}", err);
                next = false;
                if err.is_exception() {
                    debug!("EXCEPTION");
                } else if err.is_failure() {
                    debug!("FAILURE");
                }
            },
        }
    }

    result
}

fn extract_all<'a>(query: &Context<impl OpenCall>, terms: Vec<&Term>) -> Vec<Vec<Value>> {
    let mut result: Vec<Vec<Value>> = Vec::new();
    let mut next = true;
    while next == true {
        match query.next_solution() {
            Ok(ok) => {
                debug!("Next: {}", ok);
                next = ok;
                let mut res: Vec<Value> = Vec::new();
                let ctx = query.open_frame();
                for i in terms.iter() {
                    let ttj = term_to_json(&ctx, i);
                    debug!("{ttj:?}");
                    res.push(ttj);
                }
                result.push(res);
            },
            Err(err) => {
                debug!("Next: {}", err);
                next = false;
                if err.is_exception() {
                    debug!("EXCEPTION");
                } else if err.is_failure() {
                    debug!("FAILURE");
                }
            },
        }
    }

    result
}

/// Extract a Vec<Triple> from a prolog query
pub fn extract_triples<'a>(query: &Context<impl OpenCall>, s: &Term, p: &Term, o: &Term) -> Vec<Triple> {
    debug!("EXTRACT TRIPLES");
    let mut triples: Vec<Triple> = Vec::new();
    let mut next = true;
    while next == true {
        match query.next_solution() {
            Ok(ok) => {
                debug!("Next: {}", ok);
                next = ok;
                let ctx = query.open_frame();
                let s_r = translate_output(s, &ctx);
                let p_r = translate_output(p, &ctx);
                let o_r = translate_output(o, &ctx);
                debug!("{:?}", s_r);
                debug!("{:?}", p_r);
                debug!("{:?}", o_r);
                triples.push(Triple {
                    s: s_r[0].to_string(),
                    p: p_r[0].to_string(),
                    o: o_r[0].to_string(),
                });
                format_triples(&mut triples);
                ctx.discard();
            },
            Err(err) => {
                debug!("Extract Triples Err: {}", err);
                next = false;
                if err.is_exception() {
                    debug!("EXCEPTION");
                } else if err.is_failure() {
                    debug!("FAILURE");
                }
            },
        }
    }

    triples
}

/// Extract a Sophia::FastGraph from a prolog OpenCall
fn extract_graph<'a>(ctx: &Context<'a, ActivatedEngine<'a>>, s: &Term, p: &Term, o: &Term, query: &Context<impl OpenCall>) -> FastGraph {

    let mut graph: FastGraph = FastGraph::new();

    let mut next = true;
    while next == true {
        match query.next_solution() {
            Ok(ok) => {
                debug!("Next: {}", ok);
                next = ok;
                let s_r = translate_output(s, ctx);
                let p_r = translate_output(p, ctx);
                let o_r = translate_output(o, ctx);

                let s_t: STerm<String> = STerm::new_iri(s_r[0].clone()).unwrap();
                let p_t: STerm<String> = STerm::new_iri(p_r[0].clone()).unwrap();
                let o_t: STerm<String> = STerm::new_iri(o_r[0].clone()).unwrap();
                graph.insert(
                    &s_t,
                    &p_t,
                    &o_t
                ).unwrap();
            },
            Err(err) => {
                debug!("Next: {}", err);
                next = false;
                if err.is_exception() {
                    debug!("EXCEPTION");
                } else if err.is_failure() {
                    debug!("FAILURE");
                }
            },
        }
    }
    graph
}

/// Extract formatted osm::NSD from query
fn extract_nsd<'a>(query: &Context<impl OpenCall>, s: &Term) -> Result<osm::nsd::NSD, OZError> {
    let ns = query.next_solution();
    match ns {
        Ok(o) => {
            if o == true {
                // Open new frame to use term.
                let newctx = query.open_frame();
                debug!("Term Type:\n\t{:?}", s.term_type());
                let json = term_to_json(&newctx, &s);
                let jsonstr = serde_json::to_string(&json).unwrap();
                
                match serde_json::from_str::<osm::nsd::NSD>(&jsonstr) {
                    Ok(o) => {
                        debug!("Extract NSD\n{o:?}");
                        newctx.discard();
                        return Ok(o)
                    },
                    Err(err) => {
                        debug!("Extract NSD\n{err:?}");
                        newctx.discard();
                        return Err(OZError{msg:"Error extracting NSD".to_string()})
                    },
                }
            }
        },
        Err(_err) => return Err(OZError{msg:"Error extracting NSD".to_string()}),
    }
    
    Err(OZError{msg:"Error extracting NSD".to_string()})
}

/// Generic method for extracting a serde_json::Value from any &Term object.
/// Note: This function assumes the term contains a string, integer, dictionary or atom
pub fn term_to_json(ctx: &Context<impl FrameableContextType>, term: &Term) -> Value {
    let frame = ctx.open_frame();
    let t: Value = match term.term_type() {
        TermType::Atom => term.get::<Atom>().unwrap().to_string().into(),
        TermType::Nil => Value::Null,
        TermType::Float => term.get::<f64>().unwrap().into(),
        TermType::Integer => term.get::<i64>().unwrap().into(),
        TermType::String => term.get::<String>().unwrap().into(),
        TermType::Dict => {
            let mut dict: Map<String, Value> = Map::new();
            frame.dict_entries(term).for_each(|f| {
                let key = match f.0 {
                    Key::Int(i) => format!("{}", i),
                    Key::Atom(a) => a.into(),
                };
                let val = term_to_json(&frame, &f.1);
                dict.insert(key, val);
            });
            dict.into()
        },
        TermType::Blob => String::from("Blob").into(),
        TermType::Unknown => String::from("Unknown").into(),
        TermType::CompoundTerm => {
            let ct = frame.string_from_term(term).unwrap();
            info!("\nTerm to json:\nCompound: {ct:?}");
            String::from("CompoundTerm").into()
        },
        TermType::Rational => String::from("Rational").into(),
        TermType::Variable => {
            let ct = frame.string_from_term(term).unwrap();
            info!("\nTerm to json:\nVariable: {ct:?}");

            String::from("Variable").into()
        },
        TermType::ListPair => {
            let lp = frame.term_list_vec(term);
            let mut res: Vec<Value> = Vec::new();
            for i in lp.iter() {
                res.push(term_to_json(&frame, i));
            }
            res.into()
        },
    };
    frame.discard();
    t
}

fn format_triples(triples: &mut Vec<Triple>) {
    for t in triples.iter_mut() {
        squash_iri(&mut t.s);
        squash_iri(&mut t.o);
        squash_iri(&mut t.p);
    }
}

fn squash_iri(s: &mut String) {
    lazy_static!{
        static ref RE: Regex = Regex::new(r"[<a-zA-Z:/.\d]+#([a-zA-Z_.\d\-]+)(>)?$").unwrap();
    }
    let cap_term = RE.captures(&s);
    match cap_term {
        Some(cap) => {
            match cap.get(1) {
                Some(new) => {
                    *s = new.as_str().to_string();
                },
                None => return
            }
        },
        None => return
    }
}

/// Transform a Vec<Triples> into a KGraph
fn create_graph(triples: &mut Vec<Triple>) -> common::KGraph {
    let mut nodes: Vec<String> = Vec::new();  
    let mut links: Vec<Triple> = Vec::new();
    for t in triples.iter() {
        let index = match nodes.iter().position(|e| e == &t.s) {
            Some(i) => i,
            None => {
                let len = nodes.len();
                nodes.push(t.s.clone());
                len
            },
        };
        let index_2 = match nodes.iter().position(|e| e == &t.o) {
            Some(i) => i,
            None => {
                let len = nodes.len();
                nodes.push(t.o.clone());
                len
            },
        };
        links.push(Triple{
            s: index.to_string(),
            p: t.p.to_string(),
            o: index_2.to_string(),
        });
    }

    common::KGraph { 
        nodes,
        links,
    }
}

pub fn translate_output<'a>(param: &Term, ctx: &Context<impl FrameableContextType>) -> Vec<String> {
    let _ctx = ctx.open_frame();
    let mut output: Vec<String> = Vec::new();
    match param.term_type() {
        swipl::term::TermType::Atom => {
            let atom: String = param.get::<Atom>().unwrap().into();
            output.push(atom);            
        },
        swipl::term::TermType::CompoundTerm => {

            let _r = param.record();
            //let mut vec: Vec<String> = param.get::<Vec<String>>().unwrap();
            let mut vec: Vec<String> = Vec::new();
            vec.push(format!("{}", rand::random::<u8>()));
            output.append(&mut vec);            
            /*
            match vec {
                PrologResult::Ok(o) => {
                    for i in o.into_iter() {
                        match i.get::<Atom>() {
                            Ok(st) => output.push(st.to_string()),
                            Err(..) => {
                                println!("Error couldn't cast to atom");
                                continue;
                            },
                        }
                    }
                },
                PrologResult::Err(..) => println!("VEC NOT OKAY"),
            }
            */
        },
        _ => output.push("".to_string()),
    }
    output
}

pub fn prospect_network(data: &AppState) -> common::KGraph {
    let start = Instant::now();
    let engine = Engine::new();
    
    let intent = data.services.get(0).unwrap();
    let ctx = load_prolog(&engine);

    insert_data(&ctx, &data.network, "live_network");
    insert_data(&ctx, &intent.intent_clean, "intent");

    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = dump_prospect_network(&ctx, &s, &p, &o);

    let mut triples = extract_triples(&query, &s, &p, &o);

    info!("Prospect Network: {}ms", start.elapsed().as_millis());

    create_graph(&mut triples)
}

pub fn deploy_network(data: &AppState) -> common::KGraph {
    let start = Instant::now();
    let engine = Engine::new();
    
    let intent = data.services.get(0).unwrap();
    let ctx = load_prolog(&engine);
    insert_data(&ctx, &data.network, "live_network");
    insert_data(&ctx, &intent.intent_clean, "intent");

    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = dump_deployment(&ctx, &s, &p, &o);

    let mut triples = extract_triples(&query, &s, &p, &o);

    info!("Deploy Network: {}ms", start.elapsed().as_millis());

    create_graph(&mut triples)
}

pub fn infer_intent(data: &AppState) -> common::KGraph {
    let start = Instant::now();
    let engine = Engine::new();
    
    let intent_lock = &data.services;
    let intent = intent_lock.get(0).unwrap();
    let _intent_clean = &intent.intent_clean;
    let ctx = load_prolog(&engine);
    insert_data(&ctx, &intent.intent_clean, "intent");

    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = dump_inferred_intent(&ctx, &s, &p, &o);

    let mut triples = extract_triples(&query, &s, &p, &o);

    info!("Infer Intent: {}ms", start.elapsed().as_millis());

    create_graph(&mut triples)
}

/// Return raw intent ontology
pub fn get_intent(data: &AppState) -> common::KGraph {
    let start = Instant::now();
    let engine = Engine::new();
    
    let intent_lock = &data.services;
    let intent = intent_lock.get(0).unwrap();
    let _intent_clean = &intent.intent_clean;
    let ctx = load_prolog(&engine);

    insert_data(&ctx, &intent.intent_clean, "intent");

    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = dump_intent(&ctx, &s, &p, &o);

    let mut triples = extract_triples(&query, &s, &p, &o);

    info!("Get Intent: {}ms", start.elapsed().as_millis());

    create_graph(&mut triples)
}

/// Return an inferred network for a compute context
pub fn infer_network(data: &AppState) -> common::KGraph {
    let start = Instant::now();
    let engine = Engine::new();
    
    let ctx = load_prolog(&engine);

    insert_data(&ctx, &data.network, "live_network");

    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = dump_inferred_network(&ctx, &s, &p, &o);
    let mut triples = extract_triples(&query, &s, &p, &o);

    info!("Infer Network: {}ms", start.elapsed().as_millis());

    create_graph(&mut triples)
}

/// Return a raw network ontology
pub fn get_network(data: &AppState) -> common::KGraph {
    let start = Instant::now();
    let engine = Engine::new();
    
    let ctx = load_prolog_oz(&engine);
    insert_data(&ctx, &data.network, "live_network");

    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = dump_network(&ctx, &s, &p, &o);
    let mut triples = extract_triples(&query, &s, &p, &o);

    println!("Length of triples: {}", triples.len());

    info!("Get Network: {}ms", start.elapsed().as_millis());

    create_graph(&mut triples)
}

pub fn get_deployments(data: &AppState) -> common::KGraph {
    let start = Instant::now();
    let engine = Engine::new();
    
    let intent = data.services.get(0).unwrap();

    let ctx = load_prolog_oz(&engine);

    insert_data(&ctx, &data.network, "live_network");
    insert_data(&ctx, &intent.intent_clean, "intent");
        
    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = dump_deployment(&ctx, &s, &p, &o);
    let mut triples: PrologTriples = extract_triples(&query, &s, &p, &o);
    
    info!("Get Deployments: {}ms", start.elapsed().as_millis());

    create_graph(&mut triples)
}

/// Return an NSD configuration using an intent and network model
pub fn get_nsd(data: &AppState) -> Result<NSD, OZError> {
    let start = Instant::now();
    let engine = Engine::new();
    
    let intent = data.services.get(0).unwrap();
    let ctx = load_prolog(&engine);

    insert_data(&ctx, &data.network, "live_network");
    insert_data(&ctx, &intent.intent_clean, "intent");
        
    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = dump_deployment(&ctx, &s, &p, &o);
    let _triples: PrologTriples = extract_triples(&query, &s, &p, &o);
    query.cut();

    let d = ctx.new_term_ref();
    let query = dump_nsd(&ctx, &d);
    let nsd = extract_nsd(&query, &d);
    info!("Get NSD: {}ms", start.elapsed().as_millis());
    match nsd {
        Ok(mut o) => {
            for i in o.vnfd_id.iter_mut() {
                squash_iri(i);                                
            }
            return Ok(o)
        },
        Err(_err) => return Err(OZError{msg:"Get_NSD".to_string()})
    }
}

pub fn validate_intent(data: &AppState) -> Vec<(String, String)> {
    let start = Instant::now();
    let engine = Engine::new();
    
    let intent = data.services.get(0).unwrap();
    let _intent_clean = &intent.intent_clean;
    let ctx = load_prolog_oz(&engine);

    insert_data(&ctx, &data.network, "live_network");
    insert_data(&ctx, &intent.intent_clean, "intent");

    let s = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = assert_all(&ctx, &s, &o);

    // Get results and return
    let unform = extract_all(&query, vec![&s, &o]);
    let mut pairs: Vec<(String, String)> = Vec::new();
    for i in unform.iter() {
        pairs.push((i[0].to_string(), i[1].to_string()));
    }

    info!("Validate Intent: {}micros", start.elapsed().as_micros());
    pairs
}

pub fn fix(data: &AppState) -> Vec<Triple> {
    let start = Instant::now();
    let engine = Engine::new();
    
    let _live_data = &data.network;
    let intent_lock = &data.services;
    let intent = intent_lock.get(0).unwrap();
    let _intent_clean = &intent.intent_clean;
    let ctx = load_prolog(&engine);

    //insert_data(&ctx, &data.network, "live_network");
    //insert_data(&ctx, &intent.intent_clean, "intent");
    /*
    let al = ctx.new_term_ref();
    let query = ctx.open(pred!{fix_all/1}, [&al]);
    */
    let query = ctx.open(pred!{try_fix_all/0}, []);
    let _ =query.next_solution();
    info!("Fix: {}micros", start.elapsed().as_micros());
    //let action_list = term_to_json(&ctx, &al);

    let ctx = query.open_frame();
    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let newquery = dump_network(&ctx, &s, &p, &o);
    let triples = extract_triples(&newquery, &s, &p, &o);
    //live_data.clear();
    //live_data.append(&mut triples);
    
    drop(newquery);
    drop(ctx);
    drop(query);

    info!("Update DB: {}micros", start.elapsed().as_micros());
    triples
}

pub fn apply_changes(data: &AppState, _new_network: Vec<Triple>) {
    let start = Instant::now();
    let engine = Engine::new();
    let intent_lock = &data.services;
    let intent = intent_lock.get(0).unwrap();
    let _intent_clean = &intent.intent_clean;
    let ctx = load_prolog(&engine);

    insert_data(&ctx, &data.network, "live_network");
    //insert_data(&ctx, &intent.intent_clean, "intent");
    //insert_data(&ctx, &new_network, "delta_network");

    let _query = execute_changes(&ctx);
    info!("Fix: {}ms", start.elapsed().as_millis());

    info!("Apply Changes: {}ms", start.elapsed().as_millis());
}

pub fn validate_design(data: &AppState, _network: Vec<Triple>) -> Vec<(String, String)> {
    let start = Instant::now();
    let engine = Engine::new();
    let intent_lock = &data.services;
    let intent = intent_lock.get(0).unwrap();
    let _intent_clean = &intent.intent_clean;
    let ctx = load_prolog_oz(&engine);

    let query = clear_network(&ctx);
    while let Ok(_s) = query.next_solution() {}
    drop(query);
    insert_data(&ctx, &data.network, "live_network");
    //insert_data(&ctx, &intent.intent_clean, "intent");

    let s = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let query = assert_all(&ctx, &s, &o);

    // Get results and return
    let unform = extract_all(&query, vec![&s, &o]);
    let mut pairs: Vec<(String, String)> = Vec::new();
    for i in unform.iter() {
        pairs.push((i[0].to_string(), i[1].to_string()));
    }

    info!("Validate Design: {}micros", start.elapsed().as_micros());
    pairs
}

pub fn get_infrastructure(_data: &AppState, layer: &str) -> common::KGraph {
    let engine = Engine::new();
    let ctx = load_prolog_all(&engine);

    //insert_data(&ctx, &data.network, "live_network");
    
    let s = ctx.new_term_ref();
    let p = ctx.new_term_ref();
    let o = ctx.new_term_ref();
    let mut triples = match layer {
        "core" => {
            let query = dump_core_switches(&ctx, &s, &p, &o);
            extract_triples(&query, &s, &p, &o)
        },
        "metro" => {
            let query = dump_metro_switches(&ctx, &s, &p, &o);
            extract_triples(&query, &s, &p, &o)
        },
        "access" => {
            let query = dump_access_switches(&ctx, &s, &p, &o);
            extract_triples(&query, &s, &p, &o)
        },
        "host" => {
            let query = dump_hosts(&ctx, &s, &p, &o);
            extract_triples(&query, &s, &p, &o)
        },
        _ => {
            let query = dump_core_switches(&ctx, &s, &p, &o);
            extract_triples(&query, &s, &p, &o)
        }
    };

    create_graph(&mut triples)
}

pub fn validate(_data: &AppState) {
    let engine = Engine::new();
    let _ctx = load_prolog_all(&engine);
}
pub fn change(_data: &AppState) {
    let engine = Engine::new();
    let _ctx = load_prolog_all(&engine);
}

pub fn invalidate(_data: &AppState) {
    let engine = Engine::new();
    let _ctx = load_prolog_all(&engine);
}

pub fn slice_demo() -> Vec<(String, serde_json::Value)> {
    let de = DomainExpert::new();
    de.load_prolog_all();
    let ctx = de.get_context();
    info!("Run Demo");
    de.query_first(&ctx, pred!{five_demo/0});
    //de.query_first(&ctx, pred!{five_demo/0});
    //de.query_first(&ctx, pred!{five_demo/0});
    //de.query_first(&ctx, pred!{five_demo/0});
    info!("DeploymentUnit");
    let _stuff = de.query_extract(&ctx, pred!{deploymentUnit/1});
    let mut demo_vec: Vec<(String, serde_json::Value)> = Vec::new();
    let stats = de.query_extract(&ctx, pred!{status/4});
    demo_vec.push(("Total Deployments".to_string(), stats.get(0).unwrap().get(0).unwrap().to_owned()));
    demo_vec.push(("Core Deployments".to_string(), stats.get(0).unwrap().get(1).unwrap().to_owned()));
    demo_vec.push(("Free Machines".to_string(), stats.get(0).unwrap().get(2).unwrap().to_owned()));
    demo_vec.push(("Maxed Links".to_string(), stats.get(0).unwrap().get(3).unwrap().to_owned()));

    demo_vec
}
