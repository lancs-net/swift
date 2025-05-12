#![allow(dead_code)]
use std::collections::HashMap;
use std::sync::{RwLock, Arc};
use std::fs::File;
use std::io::BufReader;
use std::thread;
use std::time::Duration;
use actix_web::web::Data;
use sophia::graph::inmem::FastGraph;
use sophia::parser::turtle;
use sophia::triple::stream::TripleSource;
use swipl::prelude::*;
use common::{AppState, turtle_to_xml, Triple, Config};
use log::info;
use clap::Parser;

use crate::api::sessions::SessionManager;
use crate::common::{Catalog, to_rdf, OzIntent};

mod prolog;
mod api;
mod stack;
mod common;
mod models;
mod monitor;
mod demo;
mod onos;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// Setup full system
    #[arg(short, long)]
    setup: bool,

    /// Clean system
    #[arg(short, long)]
    clean: bool,

    /// Run whatever test
    #[arg(short, long)]
    test: bool,

    /// Add new slice to create test case
    #[arg(short, long)]
    next: bool,

    /// Test Intent
    #[arg(short, long)]
    intent: Option<String>,
    
    /// Add Subscriber
    #[arg(short, long)]
    addsub: Option<u8>,

}

fn main() {

    // SWIFT PAPER
    let args = Args::parse();

    env_logger::init();
    let rt = tokio::runtime::Runtime::new().unwrap();

    // SWIFT PAPER
    if args.clean {
        rt.block_on(demo::cleanup());
        return;
    } else if args.setup {
        rt.block_on(demo::start_demo());
        return;
    } else if args.test {
        rt.block_on(demo::test());
        return;
    } else if args.next {
        rt.block_on(demo::situation());
        return;
    } else if let Some(device) = args.intent {
        rt.block_on(onos::add_flow(device));
        return;
    } else if let Some(sub) = args.addsub {
        rt.block_on(demo::add_subscriber(sub));
        return;
    }

    let de = prolog::DomainExpert::new();
    de.load_prolog_all();
    let _ctx = de.get_context();

    // Start api server
    info!("Oz: Server started!");
    rt.block_on(
        async {
            //api::start_server(appstate).await.unwrap();
            api::demo_server().await.unwrap();
        }
    );
}
