use actix::{Message, Recipient};
use serde::{Serialize, Deserialize};
use uuid::Uuid;

use crate::common::{IntentStatus, PrologTriples};

/*
#[derive(Serialize, Deserialize, Message)]
#[rtype(result = "()")]
pub struct WsMessage {
    pub status: IntentStatus,
}
*/

#[derive(Serialize, Deserialize, Message)]
#[rtype(result = "()")]
pub enum WsMessage {
    Text(String),
    Graph(PrologTriples),
    Status(IntentStatus),
}

#[derive(Message)]
#[rtype(result = "()")]
pub struct Connect {
    pub addr: Recipient<WsMessage>,
    pub self_id: Uuid,
}

#[derive(Message)]
#[rtype(result = "()")]
pub struct Disconnect {
    pub id: Uuid,
}
