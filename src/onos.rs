use serde_json::{Map, Value};
//use serde_yaml::Value;

pub async fn get_hosts() {
    let client = reqwest::Client::new();

    let req = client.get("http://127.0.0.1:8181/onos/v1/hosts")
                    .basic_auth("onos", Some("rocks"))
                    .send()
                    .await.unwrap();
    let json: Value = req.json().await.unwrap();
    println!("{:?}", json);
}

pub async fn get_host(_mac_addr: String) {
    let client = reqwest::Client::new();

    let req = client.get("http://127.0.0.1:8181/onos/v1/hosts")
                    .basic_auth("onos", Some("rocks"))
                    .send()
                    .await.unwrap();
    let json: Value = req.json().await.unwrap();
    println!("{:?}", json);
}

pub async fn get_switch_ports(_device_id: String) {
    let client = reqwest::Client::new();
    let req = client.get("http://127.0.0.1:8181/onos/v1/devices")
                    .basic_auth("onos", Some("rocks"))
                    .send()
                    .await.unwrap();
    let devices: Value = req.json().await.unwrap();
    println!("{:?}", devices);
}

pub async fn add_flow(device: String) {
    let client = reqwest::Client::new();
    let map = format!(r#"
        {{
          "flows": [
            {{
              "priority": 100,
              "timeout": 0,
              "isPermanent": true,
              "deviceId": "{device}",
              "treatment": {{
                "instructions": [
                  {{
                    "type": "OUTPUT",
                    "port": "CONTROLLER"
                  }}
                ]
              }},
              "selector": {{
                "criteria": [
                  {{
                    "type": "IPV4_DST",
                    "ip": "192.0.0.17/32"
                  }},
                  {{
                    "type": "IPV4_SRC",
                    "ip": "192.0.0.0/8"
                  }}
                ]
              }}
            }}
          ]
        }}"#);

    let m: Value = serde_json::from_str(&map).unwrap();

    let req = client.post("http://127.0.0.1:8181/onos/v1/flows")
                    .basic_auth("onos", Some("rocks"))
                    .json(&m)
                    .send()
                    .await.unwrap();

    println!("{:?}", req.text().await);
}

pub async fn get_switch_id(switch_name: &str) -> Option<String> {
    let client = reqwest::Client::new();
    let req = client.get("http://127.0.0.1:8181/onos/v1/devices")
                    .basic_auth("onos", Some("rocks"))
                    .send()
                    .await.unwrap();
    let devices: Value = req.json().await.unwrap();
    
    for i in devices["devices"].as_array().unwrap() {
        let id = i["id"].as_str().unwrap();
        match get_switch_name(id).await {
            Some(i) => {
                if i == switch_name.to_string() {
                    println!("{}", id);
                    return Some(id.to_string())
                }
            },
            None => return None,
        }
    }

    None
}

pub async fn get_switch_name(device_id: &str) -> Option<String> {
    let client = reqwest::Client::new();
    let req = client.get(format!("http://127.0.0.1:8181/onos/v1/devices/{device_id}/ports"))
                    .basic_auth("onos", Some("rocks"))
                    .send()
                    .await.unwrap();
    let devices: Value = req.json().await.unwrap();
    for i in devices["ports"].as_array().unwrap() {
        if let Value::String(p_type) = &i["port"] {
            if *p_type == "local".to_string() {
                return Some(i["annotations"]["portName"].as_str().unwrap().to_string());
            }
        }
    }
    return None
}

pub async fn add_host_intent(host_one: &str, host_two: &str, subnet: Option<&str>) {
    let client = reqwest::Client::new();
    let mut map = Map::new();
    //let mut map: Vec<(&str, Value)> = Vec::new();
    map.insert("type".to_string(), Value::String("HostToHostIntent".to_string()));
    map.insert("appId".to_string(), Value::String("org.onosproject.cli".to_string()));
    map.insert("priority".to_string(), Value::Number(55.into()));
    map.insert("one".to_string(), Value::String(host_one.to_string()));
    map.insert("two".to_string(), Value::String(host_two.to_string()));
    if let Some(sub) = subnet {
        map.insert("ipSrc".to_string(), Value::String(sub.to_string()));
        map.insert("ipDst".to_string(), Value::String(sub.to_string()));
    }

    //let m: Value = serde_json::from_str(&map).unwrap();
    let req = client.post("http://127.0.0.1:8181/onos/v1/intents")
                    .basic_auth("onos", Some("rocks"))
                    .json(&map)
                    .send()
                    .await.unwrap();
    match req.status().is_success() {
        false => {
            println!("{}", req.text().await.unwrap());
        }
        true => return
    }
    //let json: Value = req.json().await.unwrap();
    //println!("{:?}", json);
}

// Use tuple with id and ip address for each node.
/*
pub async fn add_slice(upf: String, endpoints: Vec<(String, String)>) {
    let client = reqwest::Client::new();
    let map = format!(r#"
    {{
        "type": "HostToHostIntent",
        "appId": "org.onosproject.cli",
        "priority": 55,
        "one": "{host_one}",
        "two": "{host_two}"
    }}"#);

    let m: Value = serde_json::from_str(&map).unwrap();
    let req = client.post("http://127.0.0.1:8181/onos/v1/intents")
                    .basic_auth("onos", Some("rocks"))
                    .json(&m)
                    .send()
                    .await.unwrap();
    //let json: Value = req.json().await.unwrap();
    //println!("{:?}", json);
}
*/

pub async fn list_intents() -> Vec<(String, String)> {
    let client = reqwest::Client::new();

    let req = client.get("http://127.0.0.1:8181/onos/v1/intents")
                    .basic_auth("onos", Some("rocks"))
                    .send()
                    .await.unwrap();

    let json: Value = req.json().await.unwrap();
    let intent_seq = json["intents"].as_array().unwrap();

    let mut results: Vec<(String, String)> = Vec::new();
    for i in intent_seq {
        let app_id = i["appId"].as_str().unwrap();
        let key = i["key"].as_str().unwrap();
        results.push((app_id.to_string(), key.to_string()));
    }

    results
}

pub async fn flush_intent(app_id: String, key: String) -> bool {
    let client = reqwest::Client::new();
    let url = format!("http://127.0.0.1:8181/onos/v1/intents/{}/{}", app_id, key);
    let req = client.delete(url)
                    .basic_auth("onos", Some("rocks"))
                    .send()
                    .await.unwrap();

    return req.status().is_success()
}

pub async fn flush_intents() {
    let intents = list_intents().await;
    for i in intents {
        flush_intent(i.0, i.1).await;
    }
}
