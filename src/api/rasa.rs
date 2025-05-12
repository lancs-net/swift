use std::sync::RwLock;
use actix_web::{HttpResponse, Responder, HttpRequest, web::Json};
use actix_web::post;
use actix_web::web::Data;
use actix_web::web;
use log::info;
use serde_json::{Value, Map};
use serde::{Serialize,Deserialize};
use actix_web::web::Buf;
use serde_json::json;

use crate::{common::AppState, prolog};

#[derive(Debug, Serialize, Deserialize)]
pub struct RasaTracker {
	pub conversation_id: String,
    pub slots: Map<String, Value>,
    pub latest_message: Map<String, Value>,
    pub latest_event_time: f64,
	pub follup_up_action: String,
    pub paused: bool,
    pub events: Vec<Value>,
	pub latest_input_channel: String,
    pub active_loop: Value,
    pub latest_action: Value,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct RasaDomain {
    config: Value,
    session_config: Value,
    intents: Value,
    entities: Value,
    slots: Value,
    responses: Value,
    forms: Value,
    e2e_actions: Value,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct RasaMsg {
	pub next_action: String,
	pub sender_id: String,
	pub tracker: RasaTracker,
	pub domain: RasaDomain,
	pub version: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct RasaResponse {
    pub events: Vec<Value>,
    pub responses: Vec<Value>,
}

#[derive(Serialize, Deserialize, Debug)]
pub struct Policy {
    pub keyword: String,
    #[serde(rename = "match")]
    pub _match: String,
    pub pass: u64,
}



#[post("/intent")]
pub async fn post_intent(intent: web::Bytes) -> impl Responder {
    let reader = intent.reader();
    let json: serde_json::Value = serde_json::from_reader(reader).unwrap();
    let json_obj = json.as_object().unwrap();
    let pretty_json = serde_json::to_string_pretty(&json_obj);
    println!("{}", pretty_json.unwrap());
    match &json_obj["next_action"] {
        Value::Null => return HttpResponse::NotAcceptable().body("Error: intent data missing"),
        Value::String(i) => {
            match i.as_str() {
                "action_wodan_slice" => {
                    let demo_vec = prolog::slice_demo();                                         
                    let mut message = format!("Intent Accepted!\n\
                        Deployment Location: PM1_metroUK11\n\
                        State: \n");
                    for i in demo_vec {
                        message.push_str(format!("\t{}: {}\n", i.0, i.1).as_str());
                    }
                    let res = json!({
                        "events": [],
                        "responses": [{
                            "template":"utter_message",
                            "text": message
                        }]
                    });
                    return HttpResponse::Ok().json(res)
                },
                "action_wodan_confirm" => {
                    /*
                    let demo_vec = prolog::slice_demo();                                         
                    let mut message = format!("Intent Accepted: New Slice\
                        State: \n");
                    for i in demo_vec {
                        message.push_str(format!("{}: {}\n", i.0, i.1).as_str());
                    }
                    */
                    let message = format!("Intent accepted");
                    let res = json!({
                        "events": [],
                        "responses": [{
                            "template":"utter_message",
                            "text": message
                        }]
                    });
                    return HttpResponse::Ok().json(res)
                },
                o => info!("API hit: {}", o),
            }
        },
        _ => return HttpResponse::NotAcceptable().body("Error: intent format incorrect"),
    }
    return HttpResponse::NotAcceptable().body("Error: intent format incorrect")
    /*
    match &json_obj["next_action"] {
        Value::Null => return HttpResponse::NotAcceptable().body("Error: intent data missing"),
        Value::String(i) => {
            let i_key = match i.as_str() {
                "action_wodan_connect" => "Hey",
                "action_wodan_redundancy" => "Hey",
                "action_wodan_security" => "Hey",
                "action_wodan_redundancytwo" => "Hey",
                "action_wodan_slice" => "Hey",
                _ => return HttpResponse::NotAcceptable().body("Error: intent invalid"),
            };
            println!("New Intent Accepted: {}", i_key);
            let res = json!({
                "events": [],
                "responses": [{
                    "template":"utter_message",
                    "text": format!("Intent Accepted: {}", i_key)
                }]
            });
            return HttpResponse::Ok().json(res)
        },
        _ => return HttpResponse::NotAcceptable().body("Error: intent format incorrect"),
    }
    */
}

#[post("/rasa")]
pub async fn rasa(data: Data<RwLock<AppState>>, json: Json<Value>, _req: HttpRequest) -> impl Responder {
    info!("Api: Rasa");
    //let jstring = serde_json::to_string_pretty(&json).unwrap();
    let name = json.get("tracker").unwrap().get("latest_message").unwrap().get("intent").unwrap().get("name").unwrap(); 
    let data = data.write().unwrap();

    match name.as_str().unwrap() {
        "validate" => prolog::validate(&data),
        "change" => prolog::change(&data),
        "heal" => prolog::invalidate(&data),
        &_ => return HttpResponse::Ok()
    }


    return HttpResponse::Ok();
}
