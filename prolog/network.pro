:- module(network, [
		load_network/0,
		test_network/0,
		capableMachine/2,
		capableHost/2,
		capableHostNew/4,
		validRoute/2,
		validRouteLatency/2,
		validMachine/2,
		validHost/2,
		hasVCPUCapacity/2,
		hasMemoryCapacity/2,
		hasStorageCapacity/2,
		requestVCPUCapacity/2,
		requestMemoryCapacity/2,
		requestStorageCapacity/2,
		physicalNetworkPath/2,
		validPhysicalNetworkPath/2,
		validPhysicalNetworkRoute/3,
		claim_bandwidth_route/3,
		validHop/1,
		networkHop/1,
		convert_xsd/2,
		connectedByWire/2
]).

:- dynamic validRoute/2.
:- dynamic validRouteLatency/2.
:- dynamic validMachine/2.
:- dynamic validHost/2.
%:- dynamic validHost/2 as incremental.
%:- table validHost/2 as incremental.
:- dynamic validHop/1 as incremental.
:- table validHop/1 as incremental.
:- dynamic networkHop/1.
:- dynamic capableHostNew/4.

test_network :-
	load_network,
	%rdf_load('../ontologies/examples/infrastructure/21CN.ttl', [format(turtle), graph('live_network'), multifile(true)]) ,
	%rdf_load('../ontologies/examples/infrastructure/bt.ttl', [format(turtle), graph('live_network'), multifile(true)]) ,
	%rdf_load('../ontologies/examples/infrastructure/bt-full-example.ttl', [format(turtle), graph('live_network'), multifile(true)]) .
	%rdf_load('../ontologies/examples/infrastructure/bt-full-ext.ttl', [format(turtle), graph('live_network'), multifile(true)]) .
	%rdf_load('../ontologies/examples/infrastructure/new-bt.ttl', [format(turtle), graph('live_network'), multifile(true)]) .
	rdf_load('../ontologies/examples/infrastructure/bt-uk-full.ttl', [format(turtle), graph('live_network'), multifile(true)]) .
	%rdf_load('../ontologies/examples/5g/free5gc.ttl', [format(turtle), graph('live_network'), multifile(true)]) .

output_file :-
	rdf_save_turtle('./prolog/proc_network.ttl', [only_known_prefixes(true), a(true)]).

load_network :-
	rdf_create_graph('service'),
	rdf_create_graph('network_model'),
	rdf_create_graph('live_network'),
	rdf_create_graph('inferred_network'),
	rdf_create_graph('prospect_network'),
	%rdf_load('../ontologies/services/free5gc.ttl', [format(turtle), graph('service'), register_namespaces(true)]),
	rdf_load('../ontologies/network/network.ttl', [format(turtle), graph('network_model'), register_namespaces(true)]).

clear_network :-
	rdf_retractall(_, _, _).

dump_network(S, P, O) :-
	rdf(S, P, O, 'live_network').

dump_inferred_network(S, P, O) :-
	infer_network;
	(
		rdf(S, P, O, 'inferred_network'),
		not(rdf(S, rdf:type, O))
	);
	true .

dump_prospect_network(S, P, O) :-
	prospect_network;
	(
		rdf(S, P, O, 'prospect_network'),
		not(rdf(S, rdf:type, O))
	);
	true.

dump_core_switches(S, P, O) :-
	(
		coreSwitch(S),
		coreSwitch(CSTwo),
		S \= CSTwo,
		physicalLink(O, S),
		physicalLink(O, CSTwo),
		rdf_global_id(nm:physicalLink, P)
	);
	!.

dump_metro_switches(S, P, O) :-
	(
		metroSwitch(S),
		metroSwitch(CSTwo),
		S \= CSTwo,
		physicalLink(O, S),
		physicalLink(O, CSTwo),
		rdf_global_id(nm:physicalLink, P)
	);
	!.

dump_access_switches(S, P, O) :-
	(
		accessSwitch(S),
		accessSwitch(CSTwo),
		S \= CSTwo,
		physicalLink(O, S),
		physicalLink(O, CSTwo),
		rdf_global_id(nm:physicalLink, P)
	);
	!.

clean_network :-
	rdf_retractall(_, _, _, 'live_network'),
	rdf_retractall(_, _, _, 'network_model').

prospect_network :-
	writeln(VDU),
	list_vdus(VDU, _, _),
	/*rdf_assert(VDU, VP, VO, 'prospect_network'),*/
	/*
	(
		not(assert_connected(Service)) ->
		writeln("Fail: Connected")
	),
	*/
	(
		not(assert_secure) ->
		writeln("Fail: Secure")
	),
	(
		not(assert_redundant(_, [H|_])) ->
		writeln("Fail: Redundant"),
		deployedOnMachine(H, OM),
		physicalMachine(NM),
		NM \= OM
	),
	false.

infer_network :-
	rdf_assert(ln:'OzOverlay', rdf:type, nm:'OverlayNetwork', 'inferred_network'),
	(
		writeln("vdu_deployments"),
		writeln(X),
		vdu_deployments(X, Y, Z),
		rdf_assert(X, Y, Z, 'inferred_network')
	),
	(
		writeln("connected_vdus"),
		connected_vdus(S, _, _),
		writeln(S),
		rdf_assert(S, nm:connected, ln:'OzOverlay', 'inferred_network')
	).

intentPath :-
	physicalMachine(APM),
	kVM(AKVM),
	linuxBridge(LB),
	wiredNetworkInterface(ANIC),
	physicalRouter(R),
	isRunningOn(AKVM, APM),
	isRunningOn(ADU, AKVM),
	hasVirtualInterface(ADU, AINTF),
	connected(AINTF, LB),
	connected(LB, ANIC),
	connected(ANIC, ARI),
	hasPhysicalInterface(R, ARI).


%%%%%%%%% PREDICATES %%%%%%%%%

validHost(Host, DU) :-
	host(Host),
	deploymentUnit(DU),
	(
		hasInstance(Spec, DU),
		capableHost(Host, Spec)
	);
	host(Host),
	deviceSpecification(DU),
	(
		capableHost(Host, DU)
	).

validMachine(PM, Spec) :-
	physicalMachine(PM),
	validHost(PM, Spec).

validHypervisor(Hypr, Spec) :-
	hypervisor(Hypr),
	validHost(Hypr, Spec).

availableBandwidth(A, B, Total) :-
	shortest_valid_network_path(A, B, [First|Route]),
	free_bandwidth(First, BW),
	min_bandwidth_route(Route, BW, Total).

:- table physicalNetworkPath/2.
:- rdf_meta physicalNetworkPath(r, r).
physicalNetworkPath(A, B) :-
	physicalNetworkPathStep(A, B);
	physicalNetworkPath(A, Y),
	A \= Y,
	physicalNetworkPath(Y, B).

physicalNetworkPathStep(X, Y) :-
	rdf(X, nm:hasInterface, Y);
	rdf(Y, nm:hasInterface, X);
	rdf_has(X, nm:physicalLink, Y);
	rdf_has(Y, nm:physicalLink, X);
	rdf_has(X, nm:radioLink, Y);
	rdf_has(Y, nm:radioLink, X);
	rdf_has(X, nm:isRunningOn, Y);
	rdf_has(Y, nm:isRunningOn, X).
	%hasInterface(X, Y);
	%physicalLink(X, Y);
	%radioLink(X, Y);
	%link(X, Y);
	%isRunningOn(X, Y).
	%isRunningOn(Y, X).

/*
:- table physicalNetworkRoute/3.
:- rdf_meta physicalNetworkRoute(r, r, r).
physicalNetworkRoute(A, B, Route) :-
	physicalNetworkRoute(A, B, [], Route).
*/
:- table physicalNetworkRoute/3.
physicalNetworkRoute(A, B, Route) :-
	shortest_network_path(A, B, Route).

/*
physicalNetworkRoute(A, B, Acc, Route) :-
	physicalNetworkPathStep(A, B),
	Route = [B|Acc];
	physicalNetworkRoute(A, Y, Acc, Route),
	physicalNetworkRoute(Y, B, [Y|Acc], Route).
*/

:- table testPhysicalNetworkPath/2 as incremental.
:- rdf_meta testPhysicalNetworkPath(r, r).
testPhysicalNetworkPath(A, B) :-
	testPhysicalNetworkPathStep(A, B);
	testPhysicalNetworkPath(A, Y),
	deploymentUnit(A),
	networkHop(Y),
	(
		free_bandwidth(Y, BW),
		BW > 0;
		ownsClaim(A, Claim),
		claimTarget(Claim, Y)
	),
	testPhysicalNetworkPath(Y, B).

testPhysicalNetworkPathStep(X, Y) :-
	hasInterface(X, Y);
	%physicalLink(X, Y);
	%radioLink(X, Y);
	link(X, Y);
	isRunningOn(X, Y);
	isRunningOn(Y, X).

:- table validPhysicalNetworkPath/2 as incremental.
:- rdf_meta validPhysicalNetworkPath(r, r).
validPhysicalNetworkPath(A, B) :-
	validPhysicalNetworkPathStep(A, B);
	validPhysicalNetworkPath(A, Y),
	A \= Y,
	% Is this needed? validHop == networkHop
	networkHop(Y),
	validHop(Y),
	validPhysicalNetworkPath(Y, B).

% Better calculation due to repeated visits...
validPhysicalNetworkPathStep(X, Y) :-
	rdf(X, nm:hasInterface, Y);
	rdf_has(X, nm:physicalLink, Y);
	rdf_has(Y, nm:physicalLink, X);
	rdf_has(X, nm:radioLink, Y);
	rdf_has(Y, nm:radioLink, X);
	rdf_has(X, nm:isRunningOn, Y);
	rdf_has(Y, nm:isRunningOn, X).
	%hasInterface(X, Y);
	%physicalLink(X, Y);
	%radioLink(X, Y);
	%link(X, Y);
	%isRunningOn(X, Y).
	%isRunningOn(Y, X).

/* Like validPhysicalNetworkPath
 * except returns list of hops. */
%:- table validPhysicalNetworkRoute/3 as incremental.
:- rdf_meta validPhysicalNetworkRoute(r, r, r).
validPhysicalNetworkRoute(A, B, Route) :-
	shortest_valid_network_path(A, B, Route).

%:- table shortest_network_path as incremental.
shortest_network_path(Start, Goal, Route) :-
	shortest_network_path([[Start]|Tail]-Tail, [], Goal, Route).

shortest_network_path([[Goal|Path]|_]-[], _, Goal, Route) :-
	physicalNetworkPathStep(_, Goal),
    reverse([Goal|Path], Route).

shortest_network_path([[Current|Path]|Rest]-RT, Visited, Goal, Route) :-
	ground(Current),
    findall(Neighbor, (
		physicalNetworkPathStep(Current, Neighbor),
		networkHop(Neighbor),
		\+ member(Neighbor, Visited)
	), Neighbors),
	(
		Neighbors \= [] ->
		(
			add_paths_new(Neighbors, Current, Path, NewPaths-NPT),
			RT = NewPaths,
			Queue = Rest-NPT
		);
		Queue = Rest-RT
	),
	shortest_network_path(Queue, [Current|Visited], Goal, Route).

:- table shortest_valid_network_path/3 as incremental.
%:- dynamic shortest_valid_network_path/4.
shortest_valid_network_path(Start, Goal, Route) :-
	shortest_valid_network_path([[Start]|Tail]-Tail, [], Goal, Route).

shortest_valid_network_path([[Goal|Path]|_]-[], _, Goal, Route) :-
	physicalNetworkPathStep(_, Goal),
    reverse([Goal|Path], Route).

%shortest_valid_network_path([]-[], _, _, _) :- false.
shortest_valid_network_path([[Current|Path]|Rest]-RT, Visited, Goal, Route) :-
	ground(Current),
    findall(Neighbor, (
		physicalNetworkPathStep(Current, Neighbor),
		% Again... is this needed? validHop == networkHop.
		%networkHop(Neighbor),
		validHop(Neighbor),
		\+ member(Neighbor, Visited)
	), Neighbors),
	(
		Neighbors \= [] ->
		(
			add_paths_new(Neighbors, Current, Path, NewPaths-NPT),
			RT = NewPaths,
			Queue = Rest-NPT
		);
		Queue = Rest-RT
	),
	shortest_valid_network_path(Queue, [Current|Visited], Goal, Route).

/*
add_to_back(El, OpenList-Hole, Ans) :-
	difference_append(OpenList-Hole, [El|ElHole]-ElHole, Ans-[]).

difference_append(OpenList1-Hole1,OpenList2-Hole2,OpenList1-Hole2):-
	 Hole1=OpenList2.

append_diff(List1-Tail1, List2-Tail2, Result-Tail2) :-
    Tail1 = List2,
    List1 = Result.
*/

networkHop(X) :-
	physicalDevice(X);
	wire(X);
	coreSwitch(X);
	metroSwitch(X).

validHop(X) :- 
	networkHop(X).

deployedOnMachine(X, Y) :-
	virtualDevice(X),
	isRunningOn(X, KVM),
	physicalMachine(Y),
	isRunningOn(KVM, Y).

connectedByWire(X, Y) :-
	physicalLink(B, X),
	wire(B),
	physicalLink(B, Y).

find_overloaded_devices(List, Res) :- find_overloaded_devices(List, [], Res).
find_overloaded_devices([], Acc, Acc).
find_overloaded_devices([Device|Ms], Acc, Overloaded) :-
	cpuUtilization(Device, CPUUtil),
	convert_xsd(CPUUtil, Num),
	Num =< 50,
	find_overloaded_devices(Ms, Acc, Overloaded).
	
find_overloaded_devices([Device|Ms], Acc, Overloaded) :-
	cpuUtilization(Device, CPUUtil),
	convert_xsd(CPUUtil, Num),
	Num > 50,
	find_overloaded_devices(Ms, [Device|Acc], Overloaded).

redundancyFunction(NumOfDeploymentUnits, Res) :-
	(
		NumOfDeploymentUnits < 3 ->
		Res = 1
	);
	(
		NumOfDeploymentUnits < 6 ->
		Res = 2
	);
	(
		NumOfDeploymentUnits < 12 ->
		Res = 3
	);
	Val is round(NumOfDeploymentUnits * 0.2),
	(
		Val < 2 -> 
		Res = 2;
		Res = Val
	).

min_bandwidth_route([], Last, Last).
min_bandwidth_route([Hop|Route], Last, _) :-
	wire(Hop),
	free_bandwidth(Hop, BWC),
	NBWC is min(Last, BWC),
	min_bandwidth_route(Route, NBWC).
min_bandwidth_route([_|Route], Last, Total) :-
	min_bandwidth_route(Route, Last, Total).

% Edited to exclude undo.
% Must reedit to enable alternative choices.
claim_bandwidth_route([], _, _).
claim_bandwidth_route([Hop|Route], Claimant, Amount) :- 
	%writeln('NOT CLAMING BANDWIDTH'),
	\+ wire(Hop),
	claim_bandwidth_route(Route, Claimant, Amount).
claim_bandwidth_route([Hop|Route], Claimant, Amount) :-
	%writeln('CLAMING BANDWIDTH'),
	wire(Hop),
	claim_bandwidth(Hop, Claimant, Amount),
	%undo(unclaim_bandwidth(Hop, Claimant)),
	claim_bandwidth_route(Route, Claimant, Amount).

unclaim_bandwidth_route([Hop|Route], Claimant) :-
	\+ wire(Hop),
	unclaim_bandwidth_route(Route, Claimant).

unclaim_bandwidth_route([Hop|Route], Claimant) :-
	wire(Hop),
	unclaim_bandwidth(Hop, Claimant),
	unclaim_bandwidth_route(Route, Claimant).

claim_bandwidth(Hop, Claimant, Amount) :-
	%writeln(Hop),
	free_bandwidth(Hop, Free),
	%writeln(Free),
	Free > 0,
	Free >= Amount,
	short_uuid(SUUID),
	assertz(user:bandwidthClaim(SUUID)),
	rdf_equal(Amount^^xsd:double, AmountLiteral),
	assertz(user:bandwidth(SUUID, AmountLiteral)),
	assertz(user:ownsClaim(Claimant, SUUID)),
	assertz(user:claimTarget(SUUID, Hop)),
	incr_invalidate_call(validHop(Hop)).

unclaim_bandwidth(Hop, Claimant) :-
	writeln("UNCLAIMED AGAIN"),
	user:ownsClaim(Claimant, SUUID),
	user:claimTarget(SUUID, Hop),
	retract(user:bandwidthClaim(SUUID)),
	retract(user:bandwidth(SUUID, _)),
	retract(user:ownsClaim(Claimant, SUUID)),
	retractall(user:claimTarget(SUUID, _)),
	incr_invalidate_call(validHop(Hop)).

default_redundancy(Res) :-
	bagof(DU, (
		deploymentUnit(DU)
	), DUs),
	length(DUs, DUC),
	redundancyFunction(DUC, Res).

distributedDeployments([]) :- true.
distributedDeployments([H|Ms]) :-
	(
		deployedOnMachine(_, H) ->
		(
			bagof(DU, (
				deployedOnMachine(DU, H)
			), DUs),
			length(DUs, DUC),
			default_redundancy(Distribution),
			DUC > Distribution ->
			false, !;
			distributedDeployments(Ms)
		);
		distributedDeployments(Ms)
	).
		

distribution(FT, Ms) :-
	(
		aggregate_all(count, physicalMachine(Ms), MC),
		aggregate_all(count, virtualDevice(FT), FC),
		MC < FC -> 
		false
	);
	true.

try_fix_all :-
	rdf_transaction(fix_all),
	abolish_all_tables;
	bin_packing_deployment,
	fix_all.
	/*
	fix_availability,
	assert_redundant(_).
	*/

fix_all :-
	writeln("fix_all"),
	abolish_all_tables,
	(
		availabilityIntent(_) ->
		(
			assert_redundant(_) ->
			true;
			fix_availability
		)
	),
	(
		writeln("laten"),
		latencyIntent(_) ->
		(
			assert_latency(_) ->
			true;
			fix_latency
		)
	),
	(
		writeln("secu"),
		securityIntent(_) ->
		(
			assert_secure ->
			true;
			fix_security
		)
	),
	(
		writeln("conn"),
		connectivityIntent(_) ->
		(
			assert_connected(_) ->
			true;
			fix_connectivity
		)
	),
	(
		writeln("through"),
		throughputIntent(_) ->
		(
			assert_throughput(_) ->
			true;
			fix_load
		)
	), !.

fix_availability :-
	writeln("-----FIX AVAILABILITY------"),
	bagof(DU, (
		deploymentUnit(DU)
	), DUs),
	length(DUs, DUC),
	redundancyFunction(DUC, Distribution),
	moveable_vms(Distribution, Res),
	writeln("\nVMS REQUIRE MOVE"),
	writeln(Res) ->
	rehome_vms(Res, Distribution).

fix_security :-
	writeln("fix_s"),
	/** Remove all links to external routers */
	true.

fix_connectivity :-
	writeln("fix_c"),
	true.

fix_latency :-
	writeln("-----FIX LATENCY-----"),
	bagof(DU, BF^(
		function(BF),
		hasInstance(BF, DU),
		deploymentUnit(DU)
	), DUs),
	find_overloaded_devices(DUs, Overloaded),
	writeln("\nDEVICES OVERLOADED"),
	writeln(Overloaded),
	share_load_create(Overloaded).

fix_load :-
	assert_load(_),
	/** Determine replication necessary */
	true.

free_memory(M, Free) :-
	memoryResource(M, MR),
	convert_xsd(MR, MTotal),
	(
		isRunningOn(DU, M) ->
		(
			bagof(MEMV, DU^(
				deploymentUnit(DU),
				memoryUtilization(DU, MEMU),
				convert_xsd(MEMU, MEMV)
			), MEMUs),
			sum_list(MEMUs, SumList)
		);
		SumList = 0
	),
	Free is MTotal - SumList.

free_vcpu(M, Free) :-
	vcpuResource(M, VCR),
	convert_xsd(VCR, CTotal),
	(
		isRunningOn(_, M) ->
		bagof(DU, (
			isRunningOn(DU, M),
			deploymentUnit(DU)
		), DUs),
		sum_vcpu(DUs, DUC);
		DUC = 0
	),
	Free is CTotal - DUC.

free_bandwidth(Hop, Free) :-
	bandwidth(Hop, BW),
	convert_xsd(BW, BWTotal),
	(
		bagof(Claim, Hop^(
			claimTarget(Claim, Hop)
		), Claims) ->
		(
			sum_bandwidth(Claims, Total)
		);
		Total is 0
	),
	Free is BWTotal - Total.

free_storage(M, Free) :-
	storageResource(M, SR),
	convert_xsd(SR, STotal),
	(
		isRunningOn(DU, M) ->
		(
			bagof(STV, DU^(
				deploymentUnit(DU),
				storageUtilization(DU, STU),
				convert_xsd(STU, STV)
			), STVs),
			sum_list(STVs, SumList)
		);
		SumList = 0
	),
	Free is STotal - SumList.

sum_vcpu([], Res) :- Res = 0.
sum_vcpu([H|T], Res) :-
	sum_vcpu(T, Last),
	vcpuUtilization(H, VUtil),
	convert_xsd(VUtil, Num),
	Res is Last + Num.

sum_bandwidth([], Res) :- 
	Res is 0.
sum_bandwidth([H|T], Res) :-
	%writeln("Sum Bandwidth"),
	sum_bandwidth(T, Last),
	bandwidth(H, BUtil),
	convert_xsd(BUtil, Num),
	Res is Last + Num.

requestStorageCapacity(Host, Req) :-
	free_storage(Host, Capacity),
	Req =< Capacity.

requestMemoryCapacity(Host, Req) :-
	free_memory(Host, Capacity),
	Req =< Capacity.

requestVCPUCapacity(Host, Req) :-
	free_vcpu(Host, Capacity),
	Req =< Capacity.

:- rdf_meta hasStorageCapacity(r, r).
hasStorageCapacity(Host, Package) :-
	host(Host),
	virtualDeviceSpecification(Package),
	rdf(Package, im:minStorageRequirement, MSR),
	convert_xsd(MSR, SRNum),
	requestStorageCapacity(Host, SRNum).

:- rdf_meta hasMemoryCapacity(r, r).
hasMemoryCapacity(Host, Package) :-
	host(Host),
	virtualDeviceSpecification(Package),
	rdf(Package, im:minMemoryRequirement, MMR),
	convert_xsd(MMR, MRNum),
	requestMemoryCapacity(Host, MRNum).

:- rdf_meta hasVCPUCapacity(r, r).
hasVCPUCapacity(Host, Package) :-
	host(Host),
	deviceSpecification(Package),
	rdf(Package, im:minCPURequirement, MCR),
	convert_xsd(MCR, CRN),
	requestVCPUCapacity(Host, CRN).

:- rdf_meta capableMachine(r, r).
capableMachine(PM, FuncSpec) :-
	physicalMachine(PM),
	capableHost(PM, FuncSpec),
	default_redundancy(DefR),
	deploymentNumOnHost(PM, DepNo),
	DepNo =< DefR.

% Ensure is Host
capableHost(Host, FuncSpec) :-
	host(Host),
	hasVCPUCapacity(Host, FuncSpec),
	hasMemoryCapacity(Host, FuncSpec),
	hasStorageCapacity(Host, FuncSpec).
	/*default_redundancy(DefR),
	deploymentNumOnHost(H, DepNo),
	DepNo < DefR.*/

capableHostNew(Host, MinCPU, MinMem, MinStor) :-
	requestVCPUCapacity(Host, MinCPU),
	requestMemoryCapacity(Host, MinMem),
	requestStorageCapacity(Host, MinStor).

bin_packing_deployment :-
	writeln("-----BIN PACK-----"),
	%undeploy_all,
	bagof(DU, (
		deploymentUnit(DU)
	), DUs),
	writeln("TEST"),
	writeln(DUs),
	hasInstance(DUSpec, DU),
	best_bin_pack(DUs, DUSpec).

/* First fit */
bin_pack([], _) :- !.
bin_pack([H|DUs], Package) :-
	physicalMachine(M),
	isRunningOn(Hypr, M),
	hypervisor(Hypr),
	capableMachine(M,H),
	deploy_on_hypervisor(H, Hypr),
	bin_pack(DUs, Package).

best_bin(_, _, []) :- 	
	writeln("ERROR: Could not deploy"),
	false, !.

best_bin(DU, Package, [[H, _]|T]) :-
	write("\t"),
	writeln(H),
	validHost(H, DU),
	deploy_on_host(DU, H);
	best_bin(DU, Package, T).

/* First fit */
best_bin_pack([], _) :- !.
best_bin_pack([DU|DUs], Package) :-
	host(Hosts),
	loaded_hosts(Hosts, LH),
	writeln("\nATTEMPT DEPLOYMENT OF:"),
	writeln(DU),
	writeln("ON:"),
	best_bin(DU, Package, LH),
	best_bin_pack(DUs, Package).

loaded_hypervisors(MLM) :-
	hypervisor(Hypr),
	loaded_hosts(Hypr, MLM).

loaded_hosts(Host, LHosts) :-
	% If Hosts not bound -> Hosts
	writeln("Loaded Hosts"),
	bagof(Res, Host^(
		avg_host(Host, Res)
	), LMs),
	bubble_sort_2d(LMs, Sorted),
	LHosts = Sorted.

avg_host(Host, Res) :-
	writeln("Host Loaded"),
	free_vcpu(Host, CPUFree),
	free_memory(Host, MEMFree),
	free_storage(Host, STORFree),
	ALL = CPUFree + MEMFree + STORFree,
	AVG = ALL / 3,
	Res = [Host, AVG].

avg_hypervisor(Host, Res) :-
	writeln("AVG Hyper"),
	hypervisor(Host),
	avg_host(Host, Res).

share_load_create([]).
share_load_create([H|VDevice]) :-
	share_load_create(VDevice),
	hasInstance(PKG, H),
	package(PKG),
	create_vm(PKG, VM),
	writeln("TO SHARE LOAD"),
	default_redundancy(DefR),
	deploy_vm(VM, DefR),
	rdf(H, nm:cpuUtilization, OLD),
	rdf_update(H, nm:cpuUtilization, OLD, object(0)).

unclaim_hop(Device, Hop) :-
	claimTarget(Claim, Hop),
	ownsClaim(Device, Claim),
	retract(user:claimTarget(Claim, Hop)),
	retract(user:ownsClaim(Device, Claim)),
	retract(user:bandwidthClaim(Claim)),
	retract(user:bandwidth(Claim, _)),
	incr_invalidate_call(validHop(Hop)).

retract_hostvar_claims([]).
retract_hostvar_claims([HostVar|HostVars]) :-
	(
		bagof(Device, (
			deploymentUnit(Device),
			rdf(Device, im:requires, HostVar)
		), Devices) ->
		retract_device_claims(Devices);
		true
	),
	retract_hostvar_claims(HostVars).

retract_device_claims([]).
retract_device_claims([Device|Devices]) :-
	findall(Claim, (
		user:ownsClaim(Device, Claim),
		%writeln(Claim),
		retract(user:bandwidthClaim(Claim)),
		retract(user:bandwidth(Claim, _)),
		retract(user:ownsClaim(Device, Claim)),
		retract(user:claimTarget(Claim, _))
	), _),
	incr_invalidate_call(validHop(_)),
	retract_device_claims(Devices).

unclaim_all(_) :-
	user:bandwidthClaim(Claim),
	retractall(user:bandwidthClaim(_)),
	retract(user:bandwidth(Claim, _)),
	retractall(user:ownsClaim(_, _)),
	retractall(user:claimTarget(_, _)),
	incr_invalidate_call(validHop(_)).

rehome_vms([], _) :- true.
rehome_vms([H|VMs], Max) :-
	deployedOnMachine(H, OM),
	find_deployable(Max, M),
	M \= OM,
	isRunningOn(KVM, M),
	writeln("\nREHOME: "),
	writeln(H),
	hypervisor(KVM),
	hypervisor(OKVM),
	isRunningOn(H, OKVM),
	/* Shouldn't change here... */
	writeln("FROM: "),
	writeln(OKVM),
	writeln('TO: '),
	writeln(KVM),
	rdf_update(H, nm:isRunningOn, OKVM, object(KVM)),
	rehome_vms(VMs, Max), !.

/** Get all vms which don't fit */
moveable_vms(Max, Res) :-
	setof(M, NF^(
		virtualDevice(NF),
		deployedOnMachine(NF, M)
	), Ms),
	moveable_from_machine(Ms, Max, Move),
	flatten([Move], Res).

moveable_from_machine([H|Ms], Max, Move) :-
	moveable_from_machine(Ms, Max, LMove),
	(
		bagof(NF, H^( virtualDevice(NF),
			deployedOnMachine(NF, H)
		), NFs) ->
		(
			exclude_vms(NFs, 1, Max, VMove),
			append([LMove, [VMove]], Move)
		);
		Move = [LMove]
	).

moveable_from_machine([], _, M) :- M=[], !.

create_vm(PackageSpec, VM) :-
	uuid(ID),
	rdf(PackageSpec, im:requiresDeploymentUnit, VDU),
	rdf(VDU, im:minMemoryRequirement, MMR),
	rdf(VDU, im:minCPURequirement, MCR),
	rdf(VDU, im:minStorageRequirement, MSR),
	convert_xsd(MMR, MV),
	convert_xsd(MCR, CV),
	convert_xsd(MSR, SV),
	format(atom(VM), "~a_~a", [PackageSpec, ID]),
	format(atom(VMINTF), "~a-eth0", [VM]),
	rdf_assert(VM, rdf:type, owl:'NamedIndividual'),
	rdf_assert(VM, rdf:type, nm:'VirtualDevice'),
	rdf_assert(VM, rdf:type, nm:'DeploymentUnit'),
	rdf_assert(VM, nm:cpuUtilization, "0"^^xsd:string),
	rdf_assert(VM, nm:vcpuUtilization, CV),
	rdf_assert(VM, nm:memoryUtilization, MV),
	rdf_assert(VM, nm:storageUtilization, SV),
	rdf_assert(VM, nm:hasInterface, VMINTF).

instantiate_service(ServiceSpec, _) :-
	requiresFunctionChain(ServiceSpec, ChainSpec),
	rdf(ChainSpec, im:replication, N),
	convert_xsd(N, Num),
	instantiate_function_chains(ChainSpec, Num, 0, _).

instantiate_function_chains(_, Total, Tally, Chains) :- 
	writeln(Total),
	writeln(Tally),
	Total =:= Tally,
	Chains = [].

instantiate_function_chains(ChainSpec, Total, Tally, Chains) :-
	instantiate_function_chains(ChainSpec, Total, Tally+1, FChains),
	instantiate_function_chain(ChainSpec, FC),
	Chains = [[FC], FChains].

instantiate_function_chain(ChainSpec, FC) :-
	uuid(ID),
	format(atom(FC), "~a_~a", [ChainSpec, ID]),
	rdf_assert(ChainSpec, nm:hasInstance, FC),
	rdf_assert(FC, rdf:type, owl:'NamedIndividual'),
	rdf_assert(FC, rdf:type, nm:'FunctionChain'),
	rdf_assert(ChainSpec, nm:hasInstance, FC),
	findall(FuncSpec, (
		requiresFunction(ChainSpec, FuncSpec),
		instantiate_function(FuncSpec, FC, _)
	), _),
	true.

instantiate_function(FuncSpec, FC, F) :-
	uuid(ID),
	rdf(FuncSpec, im:requiresRole, Role),
	format(atom(F), "~a_~a", [FuncSpec, ID]),
	rdf_assert(F, rdf:type, owl:'NamedIndividual'),
	rdf_assert(F, rdf:type, nm:'Function'),
	rdf_assert(F, rdf:type, Role),
	rdf_assert(FuncSpec, nm:hasInstance, F),
	rdf_assert(FC, nm:hasFunction, F),
	abolish_all_tables,
	findall(DepSpec, (
		requiresDeploymentUnit(FuncSpec, DepSpec),
		instantiate_deployment_unit(DepSpec, F, _)
	), _),
	true.

instantiate_deployment_unit(PackageSpec, F, VM) :-
	uuid(ID),
	rdf(PackageSpec, im:minMemoryRequirement, MMR),
	rdf(PackageSpec, im:minCPURequirement, MCR),
	rdf(PackageSpec, im:minStorageRequirement, MSR),
	convert_xsd(MMR, MV),
	convert_xsd(MCR, CV),
	convert_xsd(MSR, SV),
	format(atom(VM), "~a_~a", [PackageSpec, ID]),
	format(atom(VMINTF), "~a-eth0", [VM]),
	rdf_assert(VM, rdf:type, owl:'NamedIndividual'),
	rdf_assert(VM, rdf:type, nm:'VirtualDevice'),
	rdf_assert(VM, rdf:type, nm:'DeploymentUnit'),
	rdf_assert(PackageSpec, nm:hasInstance, VM),
	rdf_assert(VM, nm:cpuUtilization, "0"^^xsd:string),
	rdf_assert(VM, nm:vcpuUtilization, CV),
	rdf_assert(VM, nm:memoryUtilization, MV),
	rdf_assert(VM, nm:storageUtilization, SV),
	rdf_assert(VM, nm:hasInterface, VMINTF),
	rdf_assert(F, nm:hasDeploymentUnit, VM),
	%abolish_all_tables,
	(
		requiresHost(PackageSpec, Var) ->
		(
			rdf(Var, im:defines, nm:'Host'),
			% Should I ensure that the Host atom is removed?
			format(atom(HostVar), "~a_host", [VM]),
			rdf_assert(Var, nm:hasInstance, HostVar),
			rdf_assert(HostVar, rdf:type, im:'Variable'),
			rdf_assert(HostVar, im:defines, nm:'Host'),
			rdf_assert(VM, im:requires, HostVar)
		);
		true
	),
	(
		% Create Network Variable if it doesn't exist
		% Currently: Only works once for each service chain.
		% TODO: Make it work for multiple chains
		connectsToNetwork(PackageSpec, NetVar) -> 
		(
			rdf(NetVar, im:defines, nm:'Network'),
			hasFunction(FC, F),
			% If atom already exists, don't do anything
			format(atom(NetVarInst), "~a_net", [FC]),
			(
				not(rdf(NetVarInst, rdf:type, im:'Variable')) ->
				(
					rdf_assert(NetVar, nm:hasInstance, NetVarInst),
					rdf_assert(NetVarInst, rdf:type, im:'Variable'),
					rdf_assert(NetVarInst, im:defines, nm:'Network')
				); 
				true
			),
			rdf_assert(VM, im:requires, NetVarInst)
		);
		true
	).

exclude_vms([], _, _, M) :- M=[].
exclude_vms([H|NFs], Count, Max, Move) :-
	exclude_vms(NFs, Count+1, Max, LMove),
	(
		Count > Max ->
		(
			append([LMove, [H]], Move)
		);
		Move = [LMove]
	).

deploymentNumOnHost(Host, DepNo) :-
	bagof(NF, (
		deployedOnHost(NF, Host),
		virtualDevice(NF)
	), Ds) ->
	length(Ds, DepNo);
	DepNo = 0.


%%%%%%% Mutators %%%%%%%

undeploy_all :-
	bagof(DU, H^(
		deploymentUnit(DU),
		isRunningOn(DU, H),
		hypervisor(H),
		rdf_retractall(DU, nm:isRunningOn, H)
	), _).

deploy_on_host(DU, Host) :-
	(
		isRunningOn(DU, OHost),
		host(OHost) ->
		retract(isRunningOn(DU, OHost));
		true
	),
	assertz(isRunningOn(DU, Host)).

undeploy_on_host(DU, Host) :-
	retract(isRunningOn(DU, Host)).

deploy_on_hypervisor(DU, Hypr) :-
	deploymentUnit(DU),
	(
		deployedOnMachine(DU, PM) ->
		physicalMachine(PM),
		isRunningOn(OH, PM),
		hypervisor(OH),
		assertz(isRunningOn(DU, OH));
		true
	),
	rdf_assert(DU, nm:isRunningOn, Hypr).

deploy_vm(VM, _) :-
	capableMachine(M, VM),
	writeln("CAPABLE MACHIEN"),
	writeln(M),
	isRunningOn(KVM, M),
	hypervisor(KVM),
	rdf_assert(VM, nm:isRunningOn, KVM),
	abolish_all_tables.

prune :-
	abolish_all_tables,
	% order by... not needing to check other things
	% Avoidance!
	% find datacentres in avoidance areas
	%find_all_avoidance_areas(Areas),
	% exclude nodes within avoidance areas
	%retract_avoidance_areas(Areas),
	% remove links exclusive to avoidance areas
	%retract_unnecessary_links(Areas),
	findall(Link, (
		networkHop(Link),
		(
			\+ validHop(Link);
			rdf_has(Link, nm:bandwidth, _) ->
			(
				free_bandwidth(Link, BW),
				%BW < 100000000 ->
				BW < 100 ->
				retract(user:constraintHop(Link));
				true
			);
			true
		)
	), _),
	% Network!
	% (with better path calulator)... exclude all 
	% datacentres with bad latency/throughput
	%retract_link_datacenters(DataCentres),
	% Compute!
	%bagof(HostVar, rdf(HostVar, im:defines, nm:'Host'), _),
	% Calculate all pre-requisites
	intent:find_smallest_requirements(MinCPU, MinMEM, MinSTOR),
	% Find minimum number of hosts for service
	% Remove hosts if they don't match any of the minimum resources
	findall(Host, (
		host(Host),
		(
			\+ (
				requestVCPUCapacity(Host, MinCPU),
				requestMemoryCapacity(Host, MinMEM),
				requestStorageCapacity(Host, MinSTOR)
			);
			\+ validHost(Host, _) ->
			%rdf_retractall(Host, Y, Z),
			retract(user:constraintHost(Host))
			%abolish_all_tables
		)
	), _).

try_prune_host(Host) :-
	intent:find_smallest_requirements(MinCPU, MinMEM, MinSTOR),
	host(Host),
	(
		\+ (
			requestVCPUCapacity(Host, MinCPU),
			requestMemoryCapacity(Host, MinMEM),
			requestStorageCapacity(Host, MinSTOR)
		) ->
		retract(user:constraintHost(Host))
	).

%%%%% Validate %%%%%%

assert_all(IntentName, Valid) :-
	abolish_all_tables,
	(
		intent:availabilityIntent(_) ->
		IntentName = 'Availability',
		(
			network:assert_redundant(_) ->
			Valid = true;
			Valid = false
		)
	);
	(
		intent:latencyIntent(_) ->
		IntentName = 'Latency',
		(
			network:assert_latency(_) ->
			(
				network:assert_load(_) -> 
				Valid = true;
				Valid = false
			);
			Valid = false
		)
	);
	(
		intent:securityIntent(_) ->
		IntentName = 'Security',
		(
			network:assert_secure ->
			Valid = true;
			Valid = false
		)
	);
	(
		intent:connectivityIntent(_) ->
		IntentName = 'Connectivity',
		(
			network:assert_connected(_) ->
			Valid = true;
			Valid = false
		)
	);
	(
		intent:throughputIntent(_) ->
		IntentName = 'Throughput',
		(
			network:assert_throughput(_) ->
			Valid = true;
			Valid = false
		)
	). 

assert_live :-
	!.

assert_secure :-
	(
		not((
			physicalRouter(X),
			physicalRouter(Y),
			hasPhysicalInterface(X, XI),
			hasPhysicalInterface(Y, YI),
			linkDirect(XI, YI)
		))
	) ->
	true;
	false.

assert_connected_old(Service) :-
	physicalRouter(R),
	not(rdf_bnode(R)),
	forall((
		service_network_functions(Service, Backend),
		service_network_functions(Service, LB),
		loadBalanceFunction(LB),
		backendFunction(Backend)
	),
	(
		hasDeploymentUnit(Backend, VDU),
		hasVirtualInterface(VDU, VI),
		linkDirect(VI, RI),
		hasPhysicalInterface(R, RI),
		rdf_has(R, nm:hasPhysicalInterface, RI2),
		linkDirect(OVI, RI2),
		hasVirtualInterface(_, OVI),
		hasDeploymentUnit(LB, _)
	)).

/*
assert_redundant(_) :-
	abolish_all_tables,
	bagof(M, (
		physicalMachine(M)
	), Ms),
	distributedDeployments(Ms),
	!.
*/

assert_redundant(_) :-
	\+ (
		host(Host),
		isRunningOn(DU, Host),
		isRunningOn(ODU, Host),
		hasDeploymentUnit(F, DU),
		hasDeploymentUnit(OF, ODU),
		hasFunction(FC, F),
		hasFunction(OFC, OF),
		FC \= OFC
	).

assert_load(Overloaded) :-
	bagof(Inst, F^(
		function(F),
		hasInstance(F, Inst)
	), Insts),
	find_overloaded_devices(Insts, Overloaded),
	(
		length(Overloaded, L),
		L > 0 -> 
		false;
		true
	).


/* Assert that all load balancers serve
 * at most 3 backends
 */
assert_throughput(_) :-
	true.

/* Assert that there is low util
 * on all backends
 */
assert_latency(_) :-
	bagof(DU, X^(
		backendFunction(X),
		hasInstance(X, DU),
		deploymentUnit(DU)
	), DUs),
	find_overloaded_devices(DUs, Overloaded),
	writeln(Overloaded),
	length(DUs, DUC),
	DUC < 0.

assert_hosts :-
	findall(L, (
		host(L),
		assert_host(L),
		assertz(user:constraintHost(L))
	), _).

assert_host(Host) :-
	deviceSpecification(DS),
	validHost(Host, DS), !.

assert_hops :-
	findall(L, (
		networkHop(L),
		assertz(user:constraintHop(L))
	), _).

assert_connected([]).
assert_connected([Device|Devices]) :-
	(
		bagof(NetDevice, NetVar^(
			rdf(Device, im:requires, NetVar),
			variable(NetVar),
			rdf(NetDevice, im:requires, NetVar),
			Device \= NetDevice,
			rdf(NetVar, im:defines, nm:'Network'),
			isRunningOn(NetDevice, _)
		), NetDevices) ->
		true;
		NetDevices = []
	),
	assert_connected(Device, NetDevices),
	assert_connected(Devices).

assert_compute :-
	bagof(Device, (
		deploymentUnit(Device)
	), Devices),
	assert_compute(Devices).

assert_routes :-
	bagof(Device, (
		deploymentUnit(Device)
	), Devices),
	assert_routes(Devices).

assert_routes([]).
assert_routes([Device|Devices]) :-
	(
		bagof(NetDevice, NetVar^(
			rdf(Device, im:requires, NetVar),
			variable(NetVar),
			rdf(NetDevice, im:requires, NetVar),
			Device \= NetDevice,
			rdf(NetVar, im:defines, nm:'Network'),
			isRunningOn(NetDevice, _)
		), NetDevices) ->
		true;
		NetDevices = []
	),
	assert_routes(Device, NetDevices),
	assert_routes(Devices).

assert_routes(_, []).
assert_routes(Device, [NetDevice|NetDevices]) :-
	isRunningOn(Device, H),
	isRunningOn(NetDevice, H),
	assert_routes(Device, NetDevices), !.

assert_routes(Device, [NetDevice|NetDevices]) :-
	/*
	validPhysicalNetworkRoute(Device, NetDevice, R),
	route_contains_no_sweden(R),
	*/
	validPhysicalNetworkPath(Device, NetDevice),
	assert_routes(Device, NetDevices).

route_contains_no_sweden([]).
route_contains_no_sweden([Hop|Route]) :-
	\+ (
		rdf(Hop, nm:country, C),
		rdf_global_id(G, C),
		wd:'Q34' = G
	),
	route_contains_no_sweden(Route).

assert_network :-
	bagof(Device, (
		deploymentUnit(Device)
	), Devices),
	assert_network(Devices).

assert_network([]).
assert_network(Devices) :-
	assert_connected(Devices),
	assert_network(Devices).
	
assert_connected(_, []).
assert_connected(Device, [ODevice|ODevices]) :-
	user:validate_allocation(Device, ODevice),
	assert_connected(Device, ODevices).

assertSymmetric([H|T], Rel) :-
	assertSymmetric(T, H, [], Rel).

assertSymmetric([], _, _, _) :-
	true.

assertSymmetric([H|T], B, A, Rel) :-
	assertSymmetric(T, H, [B|A], Rel),
	rdf_assert(B, Rel, H),
	rdf_assert(H, Rel, B),
	test_relation(B, H),
	test_relation(H, B),
	writeln(A).


% DEMO

demo_validate :-
	once(infer_intent),
	make_definition,
	solve_walk,
	assert_redundant(_).

demo_change :-
	demo_validate,
	true.

demo_invalidate :-
	once(infer_intent),
	make_definition,
	solve_walk,
	make_definition,
	once((
		deploymentUnit(DU), 
		host(H),
		\+ isRunningOn(DU, H), 
		hasDeploymentUnit(F, DU), 
		hasFunction(FC, F), 
		functionChain(OFC), 
		OFC \= FC, 
		hasFunction(OFC, OF), 
		hasDeploymentUnit(OF, ODU), 
		isRunningOn(ODU, H), 
		network:deploy_on_host(DU, H)
	)).

break_service :-
	once((
		deploymentUnit(DU), 
		host(H),
		\+ isRunningOn(DU, H), 
		hasDeploymentUnit(F, DU), 
		hasFunction(FC, F), 
		functionChain(OFC), 
		OFC \= FC, 
		hasFunction(OFC, OF), 
		hasDeploymentUnit(OF, ODU), 
		isRunningOn(ODU, H), 
		network:deploy_on_host(DU, H)
	)).

% Create 5G topology

create_fiveg :-
	create_fiveg(0, 1, 20).

create_fiveg(M, _, O) :-
	M >= O.

create_fiveg(LastMetro, LastGNode, MetroTotal) :-
	create_fiveg(LastMetro, LastGNode, NextMetro, _, MetroTotal),
	create_fiveg(NextMetro, LastGNode, AnotherMetro, AnotherGNode, MetroTotal),
	create_fiveg(AnotherMetro, AnotherGNode, MetroTotal).

:- rdf_meta create_switch(_, _, o, o, _).
create_fiveg(Metro1, GNodeBNum, Metro2, GNode2, _) :-
	format(atom(MetroID), "~a~a", ["metroUK", Metro1]),
	Metro2 is Metro1+1,
	format(atom(MetroID2), "~a~a", ["metroUK", Metro2]),
	rdf_global_id(nm:'MetroSwitch', MS),
	create_switch(MetroID, '', wd:'Q145', wd:'Q84', MS),
	create_switch(MetroID2, '', wd:'Q145', wd:'Q84', MS),
	format(atom(GNodeBID), "~a~a", ["gNodeB", GNodeBNum]),
	create_gnodeb(GNodeBID),
	create_wire(MetroID, GNodeBID),
	create_wire(MetroID2, GNodeBID),
	GNode2 is GNodeBNum+1.

:- rdf_meta create_switch(_, _, o, o, o).
create_switch(OID, Label, Country, Location, SwitchType) :-
	rdf_global_id(cn:OID, ID),
	rdf_assert(ID, rdf:type, SwitchType),
	rdf_assert(ID, rdf:label, Label),
	rdf_assert(ID, nm:country, Country),
	rdf_assert(ID, nm:deviceLocation, Location).

create_wire(ID1, ID2, BW, LAT) :-
	format(atom(FID), "~a_~a", [ID1, ID2]),
	rdf_global_id(cn:FID, WireID),
	create_wire(WireID, BW, LAT),
	rdf_assert(WireID, nm:physicalLink, ID1),
	rdf_assert(WireID, nm:physicalLink, ID2).

create_wire(ID, BW, LAT) :-
	format(atom(WireID), "~a", [ID]),
	rdf_global_object(nm:'Wire', W),
	rdf_assert(WireID, rdf:type, W),
	rdf_assert(WireID, nm:bandwidth, BW),
	rdf_assert(WireID, nm:latency, LAT).

create_wire(ID1, ID2) :-
	%create_wire(ID1, ID2, "10000000000"^^xsd:string, "1"^^xsd:integer).
	create_wire(ID1, ID2, 10000000000, 1).

create_gnodeb(ID) :-
	rdf_global_object(nm:'gNodeB', GB),
	rdf_assert(ID, rdf:type, GB).

create_physical_machine(ID) :-
	rdf_assert(ID, rdf:type, nm:'PhysicalMachine'),
	rdf_assert(ID, nm:cpuUtilization, 0),
	rdf_assert(ID, nm:vcpuResource, 20),
	rdf_assert(ID, nm:storageResource, 135074160640),
	rdf_assert(ID, nm:memoryResource, 135074160640).
