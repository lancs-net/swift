use std::path::Path;

use crate::common;

pub fn generate_ontology(path: &Path) {
    match common::parse_turtle(path) {
        Ok(_ont) => {
               
        },
        Err(err) => panic!("{:?}", err),
    }
}
