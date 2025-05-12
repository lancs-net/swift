use std::collections::HashMap;
use std::sync::RwLock;

use actix::{Recipient, Addr};
use log::{warn};
use uuid::Uuid;

use crate::common::IntentStatus;
use super::messages::WsMessage;
use super::webui::WebSession;


type Socket = Recipient<WsMessage>;

pub struct SessionManager {
    pub sessions: RwLock<HashMap<Uuid, Addr<WebSession>>>,
}

impl SessionManager {
    fn send_update(&self, _status: &IntentStatus, dest_id: &Uuid) {
        if let Some(dest_socket) = self.sessions.read().unwrap().get(dest_id) {
            let _ = dest_socket;
        } else {
            warn!("su: error sending message via socket");
        }
    }

    pub fn add(&self, uuid: Uuid, addr: Addr<WebSession>) {
        let mut lock = self.sessions.write().unwrap();
        if let None = lock.get(&uuid) {
            lock.insert(uuid, addr);
        } else {
            warn!("add: error adding client to sessionmanager");
        }
    }

    pub fn message(&self, dest_id: &Uuid, msg: WsMessage) {
        if let Some(dest_socket) = self.sessions.read().unwrap().get(&dest_id) {
            dest_socket.do_send(msg);
        } else {
            warn!("msg: error sending message via socket");
        }
    }

/*
impl Actor for SessionManager {
    type Context = Context<Self>;
}
*/

}
