default:
	just --list

build-osm:
        mkdir -p res/models/wodan-nsd
        mkdir -p res/models/wodanSBE-vnfd
        mkdir -p res/models/wodanVLB-vnfd
        cp res/models/wodanVLB-vnfd.yaml res/models/wodanVLB-vnfd
        cp res/models/wodanSBE-vnfd.yaml res/models/wodanSBE-vnfd
        cp res/models/wodan-nsd.yaml res/models/wodan-nsd
        tar -czf res/models/wodan-nsd.tar.gz -C res/models wodan-nsd
        tar -czf res/models/wodanVLB-vnfd.tar.gz -C res/models wodanVLB-vnfd
        tar -czf res/models/wodanSBE-vnfd.tar.gz -C res/models wodanSBE-vnfd
        rm -rf res/models/wodan-nsd
        rm -rf res/models/wodanVLB-vnfd
        rm -rf res/models/wodanSBE-vnfd

upload-intent:
	echo "No"

graphdb:
	podman run -p 7200:7200 --name graphdb --rm ontotext/graphdb:10.1.3

generate-dlps:
	swipl -s prolog/owl.pro -g generate_network -t halt
	swipl -s prolog/owl.pro -g generate_intent -t halt

swipl-net:
	swipl -s prolog/owl.pro -g load_network

swipl:
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test

swipl-less:
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')"

swipl-test:
	swipl -g "consult('./prolog/network.pro')" -g "consult('./prolog/intent.pro')" -g test_intent -g test_network

swipl-chr:
	swipl -g "consult('./prolog/old/chr.pro')"

swipl-test-validation:
	python python/generate.py --metros 1 --machines 1
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_avoidance(1,1)" -t "halt"
	#swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_redundancy(1,1)" -t "halt"
	python python/generate.py --metros 1 --machines 2
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_avoidance(1,2)" -t "halt"
	#swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_redundancy(1,2)" -t "halt"
	python python/generate.py --metros 1 --machines 3
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_avoidance(1,3)" -t "halt"
	#swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_redundancy(1,3)" -t "halt"
	python python/generate.py --metros 1 --machines 4
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_avoidance(1,4)" -t "halt"
	#swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_redundancy(1,4)" -t "halt"
	python python/generate.py --metros 2 --machines 1
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_avoidance(2,1)" -t "halt"
	#swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_redundancy(2,1)" -t "halt"
	python python/generate.py --metros 3 --machines 1
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_avoidance(3,1)" -t "halt"
	#swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_redundancy(3,1)" -t "halt"
	python python/generate.py --metros 4 --machines 1
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_avoidance(4,1)" -t "halt"
	#swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test -g "test_redundancy(4,1)" -t "halt"

swipl-run-tests:
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g "test" -g "test(walk, 1, 1)" -t "halt"
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g "test" -g "test(walk, 1, 2)" -t "halt"
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g "test" -g "test(walk, 1, 3)" -t "halt"
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g "test" -g "test(walk, 2, 1)" -t "halt"
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g "test" -g "test(walk, 3, 1)" -t "halt"
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g "test" -g "test(optim, 1, 1)" -t "halt"
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g "test" -g "test(optim, 2, 1)" -t "halt"
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g "test" -g "test(optim, 3, 1)" -t "halt"
	swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g "test" -g "test(optim, 1, 2)" -t "halt"

konclude:
	podman run -v $(pwd)/ontologies/xml:/data --rm konclude/konclude classification -i /data/nm.xml -o /data/konclude/nm.xml

build:
	cargo build

reset: clean restart-onos clean-next
	sudo ovs-vsctl emer-reset

clean: build
	sudo ./target/debug/oz --clean

clean-next:
	docker container stop upf1 smf1
	docker container rm upf1 smf1

run: build
	sudo ./target/debug/oz

setup: build
	sudo ./target/debug/oz --setup

stop:
	sudo ./target/debug/oz --clean

test: build
	sudo ./target/debug/oz --test

next: build
	sudo ./target/debug/oz --next

add-subs: build
	sudo ./target/debug/oz --addsub 1
	sudo ./target/debug/oz --addsub 2
	sudo ./target/debug/oz --addsub 3

iperf-server NUM:
	docker exec -it webserver /usr/bin/iperf3 -s -p 500{{NUM}}

connect-ueransim NUM IP:
	docker exec -it ueransim1 /usr/bin/iperf3 -c 192.0.0.252 -p 500{{NUM}} -t 240 --bind {{IP}}
	#docker exec -it ueransim1 /bin/bash

run-ryu:
	podman run --name ryu -v $(pwd)/python/controller.py:/app/controller.py localhost/ryu

route-ueransim:
	docker exec -it ueransim1 ip route add 10.60.0.0/24 via 10.60.0.1 via dev uesimtun0
	#docker exec -it ueransim1 ip route add 10.61.0.0/24 via 10.61.0.1 dev uesimtun1

route-webui:
	sudo ip link add hostm type veth peer name hosts	
	sudo ip addr add 192.0.0.254/24 dev hostm
	sudo ip addr add 192.0.0.255/24 dev hosts
	sudo ip link set hostm up
	sudo ip link set hosts up
	sudo ip route add 192.0.0.17/32 via 192.0.0.254 dev hostm
	sudo ovs-vsctl add-port s3 hosts

restart-onos:
	docker-compose -f 5g/onos-compose.yaml down
	docker volume prune -f
	docker-compose -f 5g/onos-compose.yaml up -d

connect-onos:
	ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" -l onos -p 8101 localhost

start-ue:
	docker exec -it ueransim5 ./nr-ue -c config/ue/uecfg1.yaml

start-ue-two:
	docker exec -it ueransim5 ./nr-ue -c config/ue/uecfg2.yaml

start-ue-three:
	docker exec -it ueransim5 ./nr-ue -c config/ue/uecfg3.yaml

run-all: build
	# Setups up the whole demo environment
	sudo ./target/debug/oz --setup
	sleep 10
	sudo ./target/debug/oz --addsub 1
	sudo ./target/debug/oz --addsub 2
	sudo ./target/debug/oz --test
	sudo ./target/debug/oz --next
