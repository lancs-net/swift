use std::{fs::File, io::BufWriter, sync::RwLock};
use std::time::Instant;
use actix_web::{App, HttpResponse, HttpServer, Responder, HttpRequest, web};
use actix_web::{get, post, patch, delete};
use actix_web::web::Data;
use actix_cors::Cors;
use log::info;

use crate::common::{AppState, IntentStatus};

use self::webui::webui_start_connection;

use super::prolog;
use super::srims;

pub mod webui;
pub mod sessions;
pub mod messages;
pub mod rasa;

#[get("/validate")]
async fn validate(data: Data<RwLock<AppState>>) -> impl Responder {
    info!("Api: Validate");
    let data = data.read().unwrap();
    let start = Instant::now();
    /*
    let de = prolog::DomainExpert::new();
    de.load_prolog_all();
    */
    let results = prolog::validate_intent(&data);
    let mut real_results: Vec<IntentStatus> = Vec::new();
    for i in results.iter() {
        real_results.push(IntentStatus{
            name: i.0.clone().replace("\"", ""),
            value: i.1.clone().replace("\"", ""),
        });
    }
    info!("Time taken to validate: {}ms", start.elapsed().as_micros());
    HttpResponse::Ok().json(real_results)
}


#[get("/test")]
async fn deploy_network(data: Data<RwLock<AppState>>) -> impl Responder {
    info!("Api: deploy_network");
    let data = data.read().unwrap();
    let mut osm_config = data.config.osm.get_client().await;
    if osm::auth::get_token(&mut osm_config).await == false {
        info!("AUTH FAILED");      
    }
    let deployments = prolog::get_deployments(&data);
    let nsd = prolog::get_nsd(&data).unwrap();
    let json = serde_json::to_value(nsd).unwrap();
    let pretty_json = serde_json::to_string_pretty(&json).unwrap();
    println!("{}", pretty_json);

    let f = File::create("./res/last_osm.yaml").unwrap();
    let _bw = BufWriter::new(f);
    
    //bw.write_all(pretty_json.as_bytes());

    // Deploy to OSM instance
    let result = osm::nsd::create_descriptor(&osm_config, json).await;
    match result {
        Ok(o) => println!("{:?}", o),
        Err(err) => println!("{:?}", err),
    }
    HttpResponse::Ok().json(deployments)
}

#[get("/live_network")]
async fn live_network(data: Data<RwLock<AppState>>) -> impl Responder {
    info!("Api: live_network");
    let data = data.read().unwrap();
    let ngraph = prolog::get_network(&data);
    HttpResponse::Ok().json(ngraph)
}


#[get("/infrastructure/{id}")]
async fn infrastructure(data: Data<RwLock<AppState>>, path: actix_web::web::Path<String>) -> impl Responder {
    info!("Api: infrastructure");
    let id = path.into_inner();
    let data = data.read().unwrap();
    let ngraph = prolog::get_infrastructure(&data, &id);

    HttpResponse::Ok().json(ngraph)
}

#[get("/inferred_network")]
async fn inferred_network(data: Data<RwLock<AppState>>) -> impl Responder {
    info!("Api: inferred_network");
    let data = data.read().unwrap();
    let ingraph = prolog::infer_network(&data);
    HttpResponse::Ok().json(ingraph)
}

#[get("/prospect")]
async fn prospect(data: Data<RwLock<AppState>>) -> impl Responder {
    info!("Api: prospect");
    let data = data.read().unwrap();
    let pgraph = prolog::prospect_network(&data);
    HttpResponse::Ok().json(pgraph)
}

// TMF APIs
#[get("/intent")]
async fn list_intent(data: Data<RwLock<AppState>>) -> impl Responder {
    info!("Api: intent");
    let data = data.read().unwrap();
    // Get Demo Data... 
    let igraph = prolog::get_intent(&data);
    HttpResponse::Ok().json(igraph)
}

#[post("/intent")]
async fn create_intent(_data: Data<RwLock<AppState>>, _req: HttpRequest) -> impl Responder {
    // TODO: Ensure intent validity
        
    HttpResponse::Ok().body("Ok")
}

#[get("/intent/{id}")]
async fn get_intent(_data: Data<RwLock<AppState>>, path: actix_web::web::Path<String>) -> impl Responder {
    let _id = path.into_inner();
    
    HttpResponse::Ok().body("Ok")
}

#[patch("/intent/{id}")]
async fn patch_intent(_data: Data<RwLock<AppState>>, path: actix_web::web::Path<String>) -> impl Responder {
    let _id = path.into_inner();
    
    HttpResponse::Ok().body("Ok")
}

#[delete("/intent/{id}")]
async fn delete_intent(_data: Data<RwLock<AppState>>, path: actix_web::web::Path<String>) -> impl Responder {
    let _id = path.into_inner();
    
    HttpResponse::Ok().body("Ok")
}

#[get("/srims")]
async fn srims_graph() -> impl Responder {
    let srims = srims::get_graph();
    HttpResponse::Ok().json(srims)
}


pub async fn demo_server() -> std::io::Result<()> {
    HttpServer::new(move || {
        let cors = Cors::default()
            .allow_any_origin();
        App::new()
            //.app_data(appstate.clone())
            .wrap(cors)
            .service(rasa::rasa)
            .service(rasa::post_intent)
            /*
            .service(live_network)
            .service(infrastructure)
            .service(deploy_network)
            .service(inferred_network)
            .service(list_intent)
            .service(get_intent)
            .service(patch_intent)
            .service(create_intent)
            .service(prospect)
            .service(srims_graph)
            .service(validate)
            */
            .service(web::resource("/ws").route(web::get().to(webui_start_connection)))
    })
    .bind(("localhost", 8080))?
    .run()
    .await
}

pub async fn start_server(appstate: Data<RwLock<AppState>>) -> std::io::Result<()> {
    HttpServer::new(move || {
        let cors = Cors::default()
            .allow_any_origin();
        App::new()
            .app_data(appstate.clone())
            .wrap(cors)
            .service(rasa::rasa)
            .service(live_network)
            .service(infrastructure)
            .service(deploy_network)
            .service(inferred_network)
            .service(list_intent)
            .service(get_intent)
            .service(patch_intent)
            .service(create_intent)
            .service(prospect)
            .service(srims_graph)
            .service(validate)
            .service(web::resource("/ws").route(web::get().to(webui_start_connection)))
    })
    .bind(("localhost", 8080))?
    .run()
    .await
}
