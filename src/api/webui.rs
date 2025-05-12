use std::{time::{Instant, Duration}, sync::RwLock};

use actix::{Actor, StreamHandler, Recipient, AsyncContext, Running, Handler, ActorContext};
use actix_web::{HttpResponse, HttpRequest, web::{Payload, Data, Bytes}};
use actix_web_actors::ws::{self};
use log::{warn, info};
use serde_json::Value;
use uuid::Uuid;

use crate::common::AppState;
use crate::prolog;
 
use super::messages::WsMessage;

type Socket = Recipient<WsMessage>;

/*
#[derive(Message)]
#[rtype(result = "()")]
*/
pub struct WebSession {
    id: Uuid,
    heartbeat: Instant,
    appstate: Data<RwLock<AppState>>
}

const HEARTBEAT_INTERVAL: Duration = Duration::from_secs(5);
const CLIENT_TIMEOUT: Duration = Duration::from_secs(10);

impl WebSession {

    fn heartbeat(&self, ctx: &mut ws::WebsocketContext<Self>) {
        ctx.run_interval(HEARTBEAT_INTERVAL, |act, ctx| {
            if Instant::now().duration_since(act.heartbeat) > CLIENT_TIMEOUT {
                warn!("Disconnecting: Failed hearbeat");
                ctx.stop();
                return;
            }
            ctx.ping(b"hi");
        });
    }
    
    /// Handle data migration on first connection
    fn handle_json(&self, json: Value, ctx: &mut ws::WebsocketContext<Self>) {
        info!("Handle JSON");
        if json.is_object() {
            if let Some(rt) = json.get("RequestType") {
                match rt.as_str().unwrap() {
                    "startup" => {
                        let data = self.appstate.read().unwrap();
                        let ngraph = prolog::get_network(&data);  
                        let json: String = serde_json::to_string(&ngraph).unwrap();
                        ctx.text(json);
                    },
                    _ => {
                        info!("Didn't recognize the json in there...");
                    }
                }
            }
        }
    } 
}

impl Actor for WebSession {
    type Context = ws::WebsocketContext<Self>;

    fn started(&mut self, ctx: &mut Self::Context) {
        self.heartbeat(ctx);
    }

    fn stopping(&mut self, ctx: &mut Self::Context) -> actix::Running {
        ctx.stop();        
        Running::Stop
    }
}

/// Handle data received from stream (i.e. Client)
impl StreamHandler<Result<ws::Message, ws::ProtocolError>> for WebSession {
    fn handle(&mut self, msg: Result<ws::Message, ws::ProtocolError>, ctx: &mut Self::Context) {
        info!("WebSocket: Handler<Stream>");
        match msg {
            Ok(ws::Message::Ping(msg)) => {
                self.heartbeat = Instant::now();
                ctx.pong(&msg);
            },
            Ok(ws::Message::Pong(_)) => {
                info!("WebSocket: Pong");
                self.heartbeat = Instant::now();
            },
            Ok(ws::Message::Text(s)) => {
                info!("WebSocket: Text");
                let json = deserialize_json(s.into_bytes());
                self.handle_json(json, ctx);
            },
            Ok(ws::Message::Binary(bin)) => {
                info!("WebSocket: Binary");
                let json = deserialize_json(bin);
                self.handle_json(json, ctx); 
            },
            Ok(ws::Message::Close(reason)) => {
                ctx.close(reason);
                ctx.stop();
            },
            Ok(ws::Message::Continuation(_)) => {
                ctx.stop();
            }
            Ok(ws::Message::Nop) => (),
            Err(e) => std::panic::panic_any(e),
        }
    }
}

/// Handle data not from stream (i.e. Server)
impl Handler<WsMessage> for WebSession {
    type Result = ();

    fn handle(&mut self, msg: WsMessage, ctx: &mut Self::Context) {
        // Process sending data from server... format and send to socket
        info!("WebSocket: Handler<WsMessage>");
        match msg {
            WsMessage::Text(text) => ctx.text(text),
            WsMessage::Graph(graph) => {
                let encoded: Vec<u8> = bincode::serialize(&graph).unwrap();
                ctx.binary(encoded);
            },
            WsMessage::Status(status) => {
                let encoded: Vec<u8> = bincode::serialize(&status).unwrap();
                ctx.binary(encoded);
            }
        }
    }
}

//#[get("/ws")]
pub async fn webui_start_connection(req: HttpRequest, stream: Payload, data: Data<RwLock<AppState>>) -> Result<HttpResponse, actix_web::Error> {
    info!("Api Endpoint: WebSocket");

    let ws_id = Uuid::new_v4();
    let ws = WebSession {
        id: ws_id,
        heartbeat: Instant::now(),
        appstate: data.clone(),
    };

    //data.sessions.insert(ws_id, resp);
    let rb = ws::WsResponseBuilder::new(ws, &req, stream);

    match ws::WsResponseBuilder::start_with_addr(rb) {
        Ok((addr, resp)) => {
            info!("Created!");
            let data = data.read().unwrap();
            let sessions = &data.session_manager;
            // ToDo, fix adding sessions
            sessions.add(ws_id, addr);
            return Ok(resp)
        },
        Err(err) => {
            info!("Error setting up socket");
            return Err(err)
        },
    }
}

fn deserialize_json(bin: Bytes) -> Value {
    let json: Value = serde_json::from_reader(bin.as_ref()).unwrap();
    json
}

/*
fn serialize_json<T>(json: T) -> impl Into<Bytes> 
where T: Sized + Serialize {
    let json: String = serde_json::to_string::<T>(&json).unwrap();
    json
}
*/
