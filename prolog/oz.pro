:- use_module(library(semweb/rdf11)).
:- use_module(library(semweb/rdf_prefixes), [ (rdf_meta)/1, op(_,_,rdf_meta) ]).
:- use_module(library(semweb/rdfs)) .
:- use_module(library(semweb/turtle)) .
:- use_module(library(semweb/rdf_portray)) .
:- use_module(library(uuid)).
:- use_module(library(increval)).
:- use_module(library(clpfd)).
:- use_module(library(random)).
:- use_module(library(prolog_stack)).
:- use_foreign_library('../oz-prolog/target/debug/liboz_prolog.so').
%:- debug.
:- set_prolog_flag(stack_limit, 4_294_967_296).
%:- set_prolog_flag(stack_limit, 80_294_967_296).

:- rdf_register_prefix(kpi, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/kpi#').
%:- rdf_register_prefix(cat, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/tmf_example/service#').
:- rdf_register_prefix(cat, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/services/free5gc#').
:- rdf_register_prefix(im, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#').
:- rdf_register_prefix(icm, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#').
:- rdf_register_prefix(in, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/tmf_example/customer_intent#').
%:- rdf_register_prefix(sv, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/tmf_example/service#').
:- rdf_register_prefix(sv, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/services/free5gc#').
:- rdf_register_prefix(nm, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#').
:- rdf_register_prefix(ln, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/tmf_example/live_network#').
:- rdf_register_prefix(example, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/tmf_example/simple#').
:- rdf_register_prefix(bt, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/infrastructure/bt#').
:- rdf_register_prefix(cn, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/infrastructure/core-network#').

%:- rdf_register_prefix(cn, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/infrastructure/21CN#').

:- rdf_register_prefix(fg, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/5g#').
:- rdf_register_prefix(freeg, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/examples/5g/free5gc#').

:- rdf_register_prefix(time, 'http://www.w3c.org/2006/time#').
:- rdf_register_prefix(wd, 'http://wikidata.org/entity/').
:- use_module('prolog/util.pro').
:- use_module('prolog/network.pro').
:- use_module('prolog/intent.pro').
:- use_module('prolog/test.pro').

:- dynamic constraintHost/1.
:- dynamic constraintHop/1.
:- dynamic constraint/2.
:- dynamic optionalConstraint/2.

:- get_time(StartTime), nb_setval('StartTime', StartTime).
:- get_time(StartTime), asserta(starttime(StartTime)).

% Just for testing
%:- assertz(optionalConstraint(superness, true)).

test :-
	test_intent,
	test_network.

load :-
	load_network,
	load_intent.

/* Convenience Rule
 * Make any rule live
*/
live(Pred) :-
	Pred =.. List,
	distinct(make_live(List)).

make_live([Functor, Arg1]) :-
	rdf(Arg1, _, _, 'live_network'),
	call(Functor, Arg1).

make_live([Functor, Arg1, Arg2]) :-
	rdf(Arg1, _, _, 'live_network'),
	call(Functor, Arg1, Arg2).

arnold(S, P, O) :-
	S = 'Put That',
	P = 'Cookie',
	O = 'Down'.
/*
intent(Pred) :-
	Pred =.. List,
	distinct(target_graph(List, 'intent')).

network(Pred) :-
	Pred =.. List,
	distinct(target_graph(List, 'network')).

target_graph([Functor, Arg1], Graph) :-
	rdf(Arg1, _, _, Graph),
	call(Functor, Arg1).

target_graph([Functor, Arg1, Arg2], Graph) :-
	rdf(Arg1, _, _, Graph),
	call(Functor, Arg1, Arg2).
*/

make_definition :-
	once((
		serviceSpecification(SSpec),
		network:instantiate_service(SSpec, _)
	)).

setup_test :-
	once(infer_intent),
	make_definition.

add_backends(Max, Num) :- Max == Num.
add_backends(Max, Num) :-
	add_backends,
	NewNum is Num+1,
	add_backends(Max, NewNum).
add_backends :-
	findall(_, (
		functionChain(FC),
		scale_backends_in_chain(FC, 1)
	), _).


%%%%%%%%% Setup %%%%%%%%%
initial_deploy :-
	bagof(Device, Var^(
		deploymentUnit(Device),
		rdf(Device, im:requires, Var),
		unresolvedHostVariable(Var)
	), Devices),
	rdf_equal(G, cn:'pm145-1-1'),
	initial_deploy(Devices, G).

initial_deploy([], _).
initial_deploy([Device|Devices], Host) :-
	intent:attach_valid_host([Device], Host) ->
	initial_deploy(Devices, Host);
	(
		validHost(Next, Device),
		validPhysicalNetworkRoute(Host, Next, _),
		initial_deploy([Device|Devices], Next)
	).


create_slice(SliceName, GNodeB) :-
	create_slice(SliceName, 0, 2, "10.61.0.0./24", GNodeB).

create_slice(Name, SST, SSNAI, IP, GNodeB) :-
	rdf_assert(Name, rdf:type, nm:'NetworkSlice'),
	rdf_assert(Name, nm:hasSST, SST),
	rdf_assert(Name, nm:hasSD, SSNAI),
	rdf_assert(Name, nm:hasSubnet, IP),
	rdf_assert(Name, nm:servingGNB, GNodeB).


%%%%%%%%% Optimal Run %%%%%%%%%
solve_optimal :-
	% writeln('SOLVE OPTIMAL'),
	nb_setval('OptimalQuality', 1000000),
	nb_setval('OptimalHosts', []),
	retractall(constraintHost(_)),
	retractall(constraintHop(_)),
	% Use required by... only need to check once
	% writeln('Host Variable'),
	once(findall(Variable, unresolvedHostVariable(Variable), HostVars)),
	% writeln('Host Vars DONE'),
	intent:find_smallest_requirements(MinCPU, MinMEM, MinSTOR),
	% ensure all hosts considered at beginning
	network:assert_hosts,
	network:assert_hops,
	network:prune,
	% Writes out combinations to csv
	findall(_, (
		optimal_solve_hosts(HostVars, [], MinCPU, MinMEM, MinSTOR)
	), Results),
	network:retract_hostvar_claims(HostVars),
	(
		Results == [] ->
		(
			relax_constraints,
			open('constraints.txt', append, WriteStream),
			get_time(Time),
			starttime(StartTime),
			Duration is Time - StartTime,
			writeln(WriteStream, Duration),
			close(WriteStream),
			findall(_, (
				optimal_solve_hosts(HostVars, [], MinCPU, MinMEM, MinSTOR)
			), _)
		);
		true
	),
	nb_getval('OptimalHosts', OptimalHosts),
	OptimalHosts \= [],
	writeln('Ready to deploy'),
	deploy_devices(OptimalHosts).
	% Find first configuration with lowest score...


optimal_solve_hosts([], Acc, _, _, _) :-
	%writeln("ALL HOSTS SOLVED"),
	time_since(Duration),
	solve_config(Acc, Hosts, []),
	rdf_format_nested_list(Hosts, FHosts),
	config_quality(Quality),
	append_csv('optimal.csv', [row(Duration, FHosts, Quality)]),
	nb_getval('OptimalQuality', CurrentQuality),
	(
		Quality < CurrentQuality ->
		(
			nb_setval('OptimalHosts', Hosts),
			nb_setval('OptimalQuality', Quality)
		);
		true
	),
	nb_getval('OptimalQuality', _),
	nb_getval('OptimalHosts', _).

optimal_solve_hosts([HostVar|HostVars], Acc, MinCPU, MinMEM, MinSTOR) :-
	rdf(HostVar, im:defines, nm:'Host'),
	(
		findall(Device, (
			rdf(Device, im:requires, HostVar)
		), Devices);
		Devices = []
	),
	optimal_solve_host(Devices, [], NAcc, MinCPU, MinMEM, MinSTOR),
	% optimal_solve_host_slow(Devices, [], NAcc, MinCPU, MinMEM, MinSTOR),
	optimal_solve_hosts(HostVars, [NAcc|Acc], MinCPU, MinMEM, MinSTOR).

optimal_solve_host([], Rep, Acc, _, _, _) :- Acc = Rep.
optimal_solve_host([Device|Devices], Rep, Acc, MinCPU, MinMEM, MinSTOR) :-
	% write("SOLVE DEVICE "),
	findall(NetVar, (
		rdf(Device, im:requires, NetVar),
		rdf(NetVar, im:defines, nm:'Network')
	), NetVars),
	constraintHost(Host),
	(
		capableHostNew(Host, MinCPU, MinMEM, MinSTOR) ->
		(
			validHost(Host, Device),
			optionalConstraint(checkBandwidth, BBool),
			transaction((
				change_constraint(checkBandwidth, true),
				solve_network(Device, Host, NetVars),
				change_constraint(checkBandwidth, BBool)
			)),
			network:deploy_on_host(Device, Host),
			undo(network:undeploy_on_host(Device, Host)),
			optimal_solve_host(Devices, [[Host, Device]|Rep], Acc, MinCPU, MinMEM, MinSTOR)
		);
		(
			retract(constraintHost(Host)),
			undo(assertz(constraintHost(Host))),
			optimal_solve_host([Device|Devices], Rep, Acc, MinCPU, MinMEM, MinSTOR)
		)
	).


optimal_solve_host_slow([], Rep, Acc, _, _, _) :- Acc = Rep.
optimal_solve_host_slow([Device|Devices], Rep, Acc, MinCPU, MinMEM, MinSTOR) :-
	%write("SOLVE DEVICE "),
	findall(NetVar, (
		rdf(Device, im:requires, NetVar),
		rdf(NetVar, im:defines, nm:'Network')
	), NetVars),
	constraintHost(Host),
	capableHostNew(Host, MinCPU, MinMEM, MinSTOR),
	validHost(Host, Device),
	optionalConstraint(checkBandwidth, BBool),
	% write("SOLVE NETWORK FOR DEVICE "),
	% writeln(GDevice),
	% undo(break),
	% undo(writeln('Solve Network fail')),
	transaction((
		change_constraint(checkBandwidth, true),
		% writeln('Network'),
		solve_network(Device, Host, NetVars),
		change_constraint(checkBandwidth, BBool)
	)),
	% write("NETWORK SOLVED"),
	% undo(network:unclaim_all(Device)),
	% writeln("DEPLOYING"),
	network:deploy_on_host(Device, Host),
	undo(network:undeploy_on_host(Device, Host)),
	% writeln("SOLVE NEXT HOST"),
	optimal_solve_host_slow(Devices, [[Host, Device]|Rep], Acc, MinCPU, MinMEM, MinSTOR).


solve_config([], Z, Z).
solve_config([H|T], Z, Acc) :- solve_config(T, Z, [H|Acc]).


deploy_devices([]).
deploy_devices([[[Host, Device]]|Devices]) :-
	writeln("Deploy Devices"),
	writeln('Host'),
	writeln(Host),
	writeln('Devices'),
	writeln(Devices),
	findall(NetVar, (
		rdf(Device, im:requires, NetVar),
		rdf(NetVar, im:defines, nm:'Network')
	), NetVars),
	writeln(NetVars),
	% hasInstance(_, Device),
	% constraintHost(Host),
	% write("TRYING HOST:"),
	% writeln(Host),
	% validHost(Host, Device),
	optionalConstraint(checkBandwidth, BBool),
	transaction((
		change_constraint(checkBandwidth, true),
		%undo(writeln('Solve Network fail')),
		solve_network(Device, Host, NetVars),
		%solve_network_p(Device, Host, NetVars),
		change_constraint(checkBandwidth, BBool)
	)),
	network:deploy_on_host(Device, Host),
	deploy_devices(Devices).


%%%%%%%%% Best Run %%%%%%%%%
solve_walk :-
	network:assert_hops,
	network:assert_hosts,
	network:prune,
	(
		try_walk;
		% try_walk_variant;
		relax_constraints,
		open('constraints.txt', append, WriteStream),
		get_time(Time),
		starttime(StartTime),
		Duration is Time - StartTime,
		writeln(WriteStream, Duration),
		close(WriteStream),
		try_walk
		% try_walk_variant
	) ->
	retractall(constraintHost(_)),
	retractall(constraintHop(_)),
	true;
	retractall(constraintHost(_)),
	retractall(constraintHop(_)),
	false.


% Need to actually WALK
% Find host or several random hosts, or groups of hosts
% then WALK! to nearest other suitable hosts
% then deploy as beneficial
try_walk :-
	constraintHost(Host),
	% rdf_transaction((
	transaction((
		findall(HostVar, unresolvedHostVariable(HostVar), HostVars),
		solve(HostVars, Host)
	)).
	%abolish_all_tables.


try_walk_variant :-
	constraintHost(Host1),
	constraintHost(Host2),
	constraintHost(Host3),
	Host1 \= Host2,
	Host2 \= Host3,
	Host1 \= Host3,
	snapshot((
		findall(HostVar, unresolvedHostVariable(HostVar), HostVars),
		solve(HostVars, Host1),
		config_quality(Q1)
	)),
	writeln('Snapshot 1'),
	snapshot((
		findall(HostVar, unresolvedHostVariable(HostVar), HostVars),
		solve(HostVars, Host2),
		config_quality(Q2)
	)),
	writeln('Snapshot 2'),
	snapshot((
		findall(HostVar, unresolvedHostVariable(HostVar), HostVars),
		solve(HostVars, Host3),
		config_quality(Q3)
	)),
	writeln('Snapshot 3'),
	intent:smallest_in_list([Q2, Q3], Q1, Out),
	writeln(Out),
	(
		Q1 == Out ->
		solve(HostVars, Host1);
		(
			Q2 == Out ->
			solve(HostVars, Host2);
			(
				Q3 == Out ->
				solve(HostVars, Host3);
				false
			)
		)
	).


% Pin Node, is the device to look for things
% around
solve([], _).
solve([HostVar|HostVars], PinNode) :-
	rdf(HostVar, im:defines, nm:'Host'),
	bagof(Device, HostVar^(
		rdf(Device, im:requires, HostVar)
	), Devices),
	solve_device(Devices, PinNode),
	solve(HostVars, PinNode).


solve_device([], _).
solve_device([Device|Devices], PinNode) :-
	(
		constraintHost(PinNode),
		Host = PinNode;
		constraintHost(B),
		B \= PinNode,
		validPhysicalNetworkRoute(PinNode, B, _),
		Host = B
	),
	bagof(NetVar, (
		rdf(Device, im:requires, NetVar),
		rdf(NetVar, im:defines, nm:'Network')
	), NetVars),
	% hasInstance(_, Device), -- why?
	constraintHost(Host),
	% undo(writeln(Host)),
	validHost(Host, Device),
	optionalConstraint(checkBandwidth, BBool),
	transaction((
		change_constraint(checkBandwidth, true),
		solve_network(Device, Host, NetVars),
		change_constraint(checkBandwidth, BBool)
	)),
	network:deploy_on_host(Device, Host),
	% incr_invalidate_call(validHost(Host, _)),
	% network:try_prune_host(Host),
	% undo(network:undeploy_on_host(Device, Host)),
	solve_device(Devices, Host).


solve_networks([]).
solve_networks([Device|Devices]) :-
	bagof(ODevice, NetVar^(
		rdf(Device, im:requires, NetVar),
		rdf(ODevice, im:requires, NetVar),
		Device \= ODevice,
		rdf(NetVar, im:defines, nm:'Network')
	), ODevices),
	%isRunningOn(Device, Host),
	optionalConstraint(checkBandwidth, BBool),
	transaction((
		change_constraint(checkBandwidth, true),
		% solve_network(Device, Host, NetVars),
		validate_connectivity(Device, ODevices),
		change_constraint(checkBandwidth, BBool)
	)),
	solve_networks(Devices).


solve_network(_, _, []).
solve_network(Device, Host, [NetVar|_]) :-
	% writeln('Solve Network'),
	(
		bagof(NetDevice, (
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
	hasInstance(NetSpec, NetVar),
	% undo(writeln(NetSpec)),
	% undo(writeln(NetVar)),
	% undo(writeln(NetSpec)),
	bandwidth(NetSpec, NetBW),
	% writeln('XSD'),
	% undo(writeln('Back it up')),
	% network:convert_xsd(NetBW, NetBWNum),
	rdf_equal(NetBW, NetBWNum^^xsd:double),
	% writeln(NetBWNum),
	% undo(writeln('Oooh')),
	% writeln("####\tTRY NETWORK"),
	solve_network(Device, Host, NetBWNum, NetDevices).


solve_network(_, _, _, []).
solve_network(Device, PHost, BW, [NetDevice|NetDevices]) :-
	% writeln('### Solve Network ###'),
	% writeln(Device),
	% writeln(PHost),
	isRunningOn(NetDevice, NHost) ->
	(
		PHost == NHost ->
		solve_network(Device, PHost, BW, NetDevices);
		(
			validPhysicalNetworkRoute(PHost, NHost, Route),
			/*
			validPhysicalNetworkRoute(PHost, NHost, Route) ->
			(
				writeln("### REACHABLE ###"),
				write("Host: "),
				writeln(PHost),
				write("Neighbor: "),
				writeln(NHost),
				writeln("### REACHABLE ###")
			);
			(
				writeln("!!! NOT REACHABLE !!!"),
				write("Host: "),
				writeln(PHost),
				write("Neighbor: "),
				writeln(NHost),
				writeln("!!! NOT REACHABLE !!!"),
				false
			)
			*/
			% abolish_all_tables
			% rdf_print_list(Route),
			% undo(break),
			% undo(writeln('Undoing')),
			network:claim_bandwidth_route(Route, Device, BW),
			% writeln('Test Claim'),
			% writeln(Device),
			% writeln(Route),
			% break
			% undo(break),
			% undo(network:unclaim_bandwidth_route(Route, Device)),
			% undo(break)
			solve_network(Device, PHost, BW, NetDevices)
		)
	);
	solve_network(Device, PHost, BW, NetDevices).


% Ideas:
% - On each deployed host, how much 
% unused resource is there?
% - How much bandwidth does 
% each host theoretically have
% (between connections)
config_quality(TotalScore) :-
	setof(H, DU^(
		deploymentUnit(DU),
		isRunningOn(DU, H),
		host(H)
	), Hs),
	setof(NetVar, DU^(
		rdf_has(DU, im:requires, NetVar)
	), NetVars),
	(
		setof(Link, (
			networkHop(Link),
			rdf(_, nm:claimTarget, Link)
		), Links) ->
		link_allocation_score(Links, LinkScore);
		LinkScore = 1
	),
	host_nearbyness(NetVars, Score),
	% Number of hosts used
	length(Hs, Count),
	% bagof constraints... count
	TotalScore is Score * Count * LinkScore.

/*
targeted_config_quality([DU|DUs], TotalScore) :-
	rdf_has(DU, im:requires, NetVar),
	host_nearbyness([NetVar], Score),
*/
	


% TODO: Make some score with hops or something...
% Hops, latency, bandwidth idk.
host_nearbyness([], Score) :- Score is 0.
host_nearbyness([NetVar|NetVars], Score) :-
	findall(Neighbour, (
		rdf(Neighbour, im:requires, NetVar)
	), _),
	TScore is 1,
	host_nearbyness(NetVars, NScore),
	Score is TScore + NScore.

link_allocation_score([], Score) :- Score is 0.
link_allocation_score([Link|Links], Score) :-
	rdf(Claim, nm:claimTarget, Link),
	rdf(Claim, nm:bandwidth, BW),
	network:convert_xsd(BW, BWNum),
	TScore is BWNum,
	link_allocation_score(Links, NScore),
	Score is TScore + NScore.
	
% Assume all devices have been able to find a host
% Get all true constraints
% Try turning off in breadth-first
relax_constraints :-
	writeln("RELAX CONSTRAINTS"),
	bagof(Name, (
		optionalConstraint(Name, true)
		% writeln(Name)
	), Names),
	off_constraints(Names, []).

demo_relax_constraints :-
	%% TEMP
	assertz(optionalConstraint(superness, true)),
	assertz(optionalConstraint(magicness, true)),
	assertz(optionalConstraint(mystery, true)),
	assertz(optionalConstraint(robust, true)),
	assertz(optionalConstraint(hotel, true)),
	assertz(optionalConstraint(trivago, true)),
	relax_constraints.

off_constraints([], [Name|Acc]) :- switch_constraint(Name), off_constraints(Acc, []).
off_constraints([Name|Names], Acc) :-
	write("\n\t#### OFF CONSTRAINTS ####\n"),
	transaction((
			switch_constraint(Name),
			print_constraints
	));
	off_constraints(Names, [Name|Acc]).
	
switch_constraint(Name) :-
	% writeln("SWITCH CONSTRAINT: "),
	% writeln(Name),
	optionalConstraint(Name, Bool),
	Bool == true ->
	(
		retract(optionalConstraint(Name, true)),
		assertz(optionalConstraint(Name, false))
	);
	(
		retract(optionalConstraint(Name, false)),
		assertz(optionalConstraint(Name, true))
	).

change_constraint(Name, Bool) :-
	optionalConstraint(Name, Bool);
	switch_constraint(Name).

print_constraints :-
	bagof(Name, (
		optionalConstraint(Name, _)
		% writeln(Name),
		% writeln(Bool)
	), _), !.

destroy_variables :-
	findall(HostVar, (
		rdf(HostVar, im:defines, nm:'Host'),
		rdf(HostVar, Y, Z),
		rdf_retractall(HostVar, Y, Z)
	), _),
	findall(NetVar, (
		rdf(NetVar, im:defines, nm:'Network'),
		rdf(NetVar, Y, Z),
		rdf_retractall(NetVar, Y, Z)
	), _).

validate_connectivity(_, []).
validate_connectivity(X, [X|_]).
validate_connectivity(X, [Next|Devices]) :-
	validPhysicalNetworkPath(X, Next),
	validate_connectivity(X, Devices),
	validate_connectivity(Next, Devices).

validate_allocation(_, []).
validate_allocation(X, [X|_]).

validate_allocation(X, [Next|Devices]) :-
	testPhysicalNetworkPath(X, Next),
	validate_allocation(X, Devices),
	validate_allocation(Next, Devices).
		
% Breadth-first but slower... 
% starts from scratch..
/*
validate_connectivity(_, []).
validate_connectivity(X, [Next|Devices]) :-
	%validPhysicalNetworkPath(X, Next),
	validPhysicalNetworkRoute(X, Next, _),
	validate_connectivity(X, Devices),
	validate_connectivity(Next, Devices).
*/

match_device_connectivity([_, []]).
match_device_connectivity([H, Next|Devices]) :-
	validPhysicalNetworkPath(H, Next),
	match_device_connectivity([Next|Devices]).

/*
match_host(_, _).
	% Find all VDUs connected - in spec (given by variable)
	% Sum all resource values
	% Find all hosts with enough resources

match_routable_host(_, _).
	% Filter hosts by ability to route to
	% host
	
% Define the breadth-first traversal predicate.
bf_traversal(Start, Goal, PathInOrder) :-
    bfs_traversal([[Start]], [], Goal, PathInOrder).

% Base case: If the current node is the goal, we're done.
bfs_traversal([[Goal|Path]|_], _, Goal, PathInOrder) :-
    rdf(_, _, Goal),
    reverse([Goal|Path], PathInOrder).
	%writeln(PathInOrder).

% Recursive case: Explore neighbors.
bfs_traversal([[Current|Path]|Rest], Visited, Goal, PathInOrder) :-
    findall(Neighbor, (rdf(Current, _, Neighbor), \+ member(Neighbor, Visited)), Neighbors),
    add_paths(Neighbors, Current, Path, NewPaths),
    append(Rest, NewPaths, Queue),
	bfs_traversal(Queue, [Current|Visited], Goal, PathInOrder).
*/

% Add paths to the neighbors.
add_paths([], _, _, []).
add_paths([Neighbor|Neighbors], Current, Path, [[Neighbor,Current|Path]|Rest]) :-
	add_paths(Neighbors, Current, Path, Rest).


add_paths_new([], _, _, Tail-Tail).
add_paths_new([Neighbor|Neighbors], Current, Path, [[Neighbor,Current|Path]|Rest]-Tail) :-
	add_paths_new(Neighbors, Current, Path, Rest-Tail).


start_csv(FileName) :-
	open(FileName, write, Stream),
	csv_write_stream(Stream, [row('RunNumber', 'Stage', 'Timings')], []),
	csv_write_stream(Stream, [row(0, 'Start', 0.0)], []),
	close(Stream).


append_csv(FileName, ToAdd) :-
	open(FileName, append, Stream),
	csv_write_stream(Stream, ToAdd, []),
	close(Stream).


time_since(Duration) :-
	get_time(CurrentTime),
	%nb_getval('StartTime', StartTime),
	once(starttime(StartTime)),
	Duration is CurrentTime-StartTime.


time_since(StartTime, Duration) :-
	get_time(CurrentTime),
	Duration is CurrentTime-StartTime.


rdf_print_list(List) :-
	write('\t[ '),
	rdf_print_entry(List),
	write(' ]\n').


rdf_format_list(List, Out) :-
	%writeln(List),
	rdf_format_entries(List, Formatted),
	format(string(Out), "[ ~w ]", [Formatted]).


rdf_format_nested_list(List, Out) :-
	rdf_format_nested_entries(List, Formatted),
	format(string(Out), "[ ~w ]", [Formatted]).


rdf_format_nested_entries([], Out) :- format(string(Out), "~w", [" "]).
rdf_format_nested_entries([[[H, N]]|T], Out) :-
	rdf_global_id(HH, H),
	rdf_global_id(NN, N),
	rdf_format_nested_entries(T, NOut),
	format(string(Out), " ~w-~w, ~w", [HH, NN, NOut]).


rdf_format_entries([], Out) :- format(string(Out), "~w", [" "]).
rdf_format_entries([H, N|T], Out) :-
	rdf_global_id(HH, H),
	rdf_global_id(NN, N),
	rdf_format_entries(T, NOut),
	format(string(Out), " ~w-~w, ~w", [HH, NN, NOut]).
rdf_format_entries([H|T], Out) :-
	rdf_global_id(G, H),
	rdf_format_entries(T, NOut),
	format(string(Out), " ~w~w", [G, NOut]).
rdf_format_entry(In, Out) :-
	rdf_global_id(G, In),
	format(string(Out), "~w", [G]).


rdf_print_entry([]) :- write(' ').
rdf_print_entry([H|T]) :-
	rdf_global_id(G, H),
	write(' '),
	write(G),
	rdf_print_entry(T).


populate_valid_hosts :-
	bagof(Host, (
		host(Host),
		writeln(Host)
		%assertz(constraintHost(Host))
		%asserta(validHost(Host, _))
	), _).


requiresBandwidth(I) :-
	writeln("REQUIRES BANDWIDTH"),
	rdfs_individual_of(I, icm:'PropertyParameter'),
	rdf_has(I, kpi:bandwidth, _),
	assertz(optionalConstraint(checkBandwidth, false)),
	add_constraint(validHop, [Hop], 
	(
		(
			optionalConstraint(checkBandwidth, false);
			(
				wire(Hop) ->
				(
					rdf_has(Hop, nm:bandwidth, BW),
					network:convert_xsd(BW, BWString),
					BWString >= 10000000
				);
				true
			)
		)
	)).


:- dynamic checkAvailability/0.
requiresAvailability(I) :-
	rdfs_individual_of(I, icm:'PropertyParameter'),
	rdf_has(I, kpi:availability, _),
	assertz(constraint(checkAvailability, true)),
	add_constraint(validHost, [Host, DU], 
	(
		(
			constraint(checkAvailability, false);
			(
				\+ (
					isRunningOn(ODU, Host),
					hasDeploymentUnit(F, DU),
					hasDeploymentUnit(OF, ODU),
					hasFunction(FC, F),
					hasFunction(OFC, OF),
					FC \= OFC
					%(\+ rdf_equal(FC, OFC))
				)
			)
		)
	)).


:- dynamic checkAvoidance/0.
requiresAvoidance(I, _) :-
	rdfs_individual_of(I, icm:'PropertyParameter'),
	rdf_has(I, kpi:kpiTerm, Secure),
	network:convert_xsd(Secure, SecureString),
	SecureString == "secure",
	assertz(constraint(checkAvoidance, true)),
	% Edit validHop to include avoidance of
	% certain areas
	add_constraint(validHop, [Hop], 
	(
		(
			constraint(checkAvoidance, false);
			(
				rdf(Hop, nm:country, C) ->
				(
					rdf_global_id(G, C),
					wd:'Q34' \= G
				);
				true
			)
		)
	)),
	% Edit ValidHost to disclude all
	% hosts
	add_constraint(validHost, [Host, _], 
	(
		constraint(checkAvoidance, false);
		(
			rdf(Host, nm:country, C),
			rdf_global_id(G, C),
			wd:'Q34' \= G
		)
	)).
	%abolish_all_tables.


unresolvedHostVariable(Variable) :-
	variable(Variable),
	rdf(Variable, im:defines, nm:'Host'),
	\+ (
		rdf(DU, im:requires, Variable),
		deploymentUnit(DU),
		isRunningOn(DU, _)
	).


resolve_netvars :-
	bagof(NetVar, (
		variable(NetVar),
		rdf(NetVar, im:defines, nm:'Network'),
		resolve_netvar(NetVar)
	), _).


resolve_netvar(NetVar) :-
	bagof(H, NetVar^(
		rdf(DU, im:requires, NetVar),
		variable(NetVar),
		deploymentUnit(DU),
		isRunningOn(DU, H)
	), Hosts),
	resolve_conn(Hosts).


resolve_conn([H, N|T]) :-
	validPhysicalNetworkRoute(H, N, _),
	%abolish_all_tables,
	resolve_conn([N|T]).


add_balancer(Service, _) :-
	serviceSpecification(Service),
	requiresFunctionChain(Service, FC),
	requiresFunction(FC, F),
	rdf_global_id(nm:'LoadBalanceFunction', LBF),
	requiresRole(F, LBF),
	network:instantiate_function(F, FC, _).


add_chain(Service, _, Chain) :-
	serviceSpecification(Service),
	requiresFunctionChain(Service, FC),
	network:instantiate_function_chain(FC, Chain).

% Factor assumed to be 1 for now
scale_backends_in_chain(FC, AddNum) :-
	functionChain(FC),
	hasFunction(FC, F),
	hasInstance(FS, F),
	rdf_equal(nm:'BackendFunction', G),
	requiresRole(FS, G),
	% setof as could be dual-function?
	setof(F, (
		requiresDeploymentUnit(FS, DUS),
		add_deployment_units(DUS, F, 0, AddNum)
	), _).

destroy_floating_deployment_units :-
	findall(DU, (
		deploymentUnit(DU),
		\+ isRunningOn(DU, _),
		rdf_retractall(DU, _, _)
	), _).


add_deployment_units(_, _, Total, Total).
add_deployment_units(DUSpec, F, Count, Total) :-
	Count < Total,
	network:instantiate_deployment_unit(DUSpec, F, _),
	NewCount is Count + 1,
	add_deployment_units(DUSpec, F, NewCount, Total).


find_replicator(Target, Replicator) :-
	rdf_has(Target, nm:has, Z),
	hasInstance(Spec, Z),
	rdf_has(Replicator, im:replicates, Spec);
	rdf_has(Target, nm:has, ATarget),
	find_replicator(ATarget, Replicator).


find_all_replicators(Target, Replicators) :-
	bagof(Replicator, (
		find_replicator(Target, Replicator)
	), Replicators).


% Meta Predicates for rewriting intent rules
explode(Functor, Body, Args) :-
	current_predicate(Functor, Clause),
	Clause =.. [Functor|Args],
	clause(Clause, Body, _).


get_args(Functor, Args) :-
	current_predicate(Functor, Clause),
	Clause =.. [Functor|Args].


get_body(Functor, Body) :-
	current_predicate(Functor, Head),
	clause(Head, Body, _).


add_constraint(Functor, Args, ADD) :-
	current_predicate(Functor, Clause),
	Clause =.. [_|Args],
	explode(Functor, Body, Args),
	retractall(Clause),
	asserta((Clause :- Body, ADD)).

% 5G Stuff


hopsFromNearestMachine(Thing, Hops) :-
	network:shortest_network_path(Thing, Machine, Route),
	sliceCapacityMachine(Machine),
	route_hops(Route, Hops).


route_stats(Route) :-
	route_hops(Route, Count),
	write("Hops: "),
	writeln(Count),
	route_capacity(Route, Free),
	write("Min Capacity: "),
	writeln(Free).


route_capacity([], Total) :-
	Total is 10000000000.
route_capacity([H|T], Total) :-
	wire(H),
	route_capacity(T, RFree),
	network:free_bandwidth(H, Free),
	(
		Free < RFree ->
		Total = Free; 
		Total = RFree
	).

route_capacity([_|T], Total) :-
	route_capacity([_|T], Total).


route_hops([], Count) :-
	Count is 0.
route_hops([H|T], Count) :-
	(
		metroSwitch(H);
		coreSwitch(H)
	),
	route_hops(T, NewCount),
	Count is NewCount+1.
route_hops([_|T], Count) :-
	route_hops(T, Count).


route_fitness([]).
route_fitness([[PM, R]|T]) :-
	write("Machine: "),
	writeln(PM),
	write("Min BW: "),
	route_capacity(R, MBW),
	writeln(MBW),
	write("Hops: "),
	route_hops(R, Hops),
	writeln(Hops),
	route_fitness(T).


route_score(R, Score) :-
	route_hops(R, Hops),
	route_capacity(R, Cap),
	%writeln(Hops),
	CapScore is Cap / 1000000000,
	%writeln(CapScore),
	MixedScore is Hops*10 - CapScore*50,
	random(0, 100, Random),
	Score is Random * MixedScore.


validate_route([]).
validate_route([H|T]) :-
	wire(H),
	network:free_bandwidth(H, Free),
	Free > 100000000,
	validate_route(T).
validate_route([H|T]) :-
	\+ wire(H),
	validate_route(T).


select_route([[PM, R]|T], FinalM, FinalR) :-
	select_route(T, PM, R, FinalM, FinalR).

select_route([], PM, R, FinalM, FinalR) :-
	FinalM = PM,
	FinalR = R.

select_route([[PM, R]|T], SelectedM, SelectedR, FinalM, FinalR) :-
	%route_capacity(R, MWB),
	%route_hops(R, Hops),
	%route_capacity(SelectedR, SelectedMWB),
	%route_hops(SelectedR, SelectedHops),
	route_score(SelectedR, SelectedScore),
	route_score(R, Score),
	%writeln(Score),
	(
		%MWB < SelectedMWB,
		%Hops < SelectedHops ->
		Score > SelectedScore ->
		select_route(T, PM, R, FinalM, FinalR);
		select_route(T, SelectedM, SelectedR, FinalM, FinalR)
	).


status :-
	status(TotDeps, CoreDeps, SCMs, MLs),
	writeln("*** Status ***"),
	write("Total Deployments: "),
	writeln(TotDeps),
	write("Core Deployments: "),
	writeln(CoreDeps),
	write("Free Machines: "),
	writeln(SCMs),
	write("Maxed Links: "),
	writeln(MLs).

status(TotDeps, CoreDeps, SCMs, MLs) :-
	aggregate_all(count, deploymentUnit(DU), TotDeps),
	aggregate_all(count, (
		deploymentUnit(DU),
		isRunningOn(DU, PM),
		physicalMachine(PM),
		physicalLink(W, PM),
		wire(W),
		physicalLink(W, CS),
		coreSwitch(CS)
	), CoreDeps),
	aggregate_all(count, sliceCapacityMachine(PM), SCMs),
	aggregate_all(count, (
		wire(W),
		network:free_bandwidth(W, Free),
		\+ Free > 0
	), MLs).


add_slice(GNodeB) :-
	uuid(Slice),
	create_slice(Slice, GNodeB),
	% Find nearest physical machine
	findnsols(8,
		[NM, R],
		(
			network:shortest_network_path(GNodeB, NM, R),
			validate_route(R),
			sliceCapacityMachine(NM)
		),
		L
	),
	%route_fitness(L),
	%network:shortest_network_path(GNodeB, NearestMachine, Route),
	select_route(L, NearestMachine, Route),
	%sliceCapacityMachine(NearestMachine),
	%route_stats(Route),
	%writeln(NearestMachine),
	%writeln(Route),
	% if valid deploy smf and upf and 
	deploy_slice_pair(NearestMachine, Slice),
	% claim path from machine to GNodeB
	% What is amount? - Wire has 10000000000 
	% How many do we want? - currently should support 100
	transaction(
		network:claim_bandwidth_route(Route, Slice, 100000000)
	).
	%(
		%route_hops(Route, Hops),
		%Hops > 1 ->
		%writeln("\t********** This one has more hops ***********"),
		%write("Hops: "),
		%writeln(Hops);
		%true
	%).
	%rdf_transaction(
	%deploy_slice_pair(NearestMachine, Slice),
	%	transaction(
	%      network:claim_bandwidth_route(Route, Slice, 100000000)
	%   )
	%).


sliceCapacityMachine(Machine) :-
	physicalMachine(Machine),
	network:requestVCPUCapacity(Machine, 1),
	network:requestMemoryCapacity(Machine, 10000000000),
	network:requestStorageCapacity(Machine, 10000000000).


sliceFulfillmentMachine(Machine, GNodeB) :-
	physicalMachine(Machine),
	rdf(DepU, nm:isRunningOn, Machine),
	rdf(DepU, nm:serviceSlice, Slice),
	rdf(Slice, nm:servingGNB, GNodeB).
	
sliceFulfillmentMachine(GNodeB, Machine) :-
	gNodeB(GNodeB),
	rdf(Slice, nm:servingGNB, GNodeB),
	rdf(DepU, nm:serviceSlice, Slice),
	rdf(DepU, nm:isRunningOn, Machine),
	physicalMachine(Machine).


deploy_slice_pair(Machine, Slice) :-
	deploy_slice_vdu("SMF", Machine, Slice),
	deploy_slice_vdu("UPF", Machine, Slice).


deploy_slice_vdu(Name, Machine, Slice) :-
	uuid(ID),
	format(atom(VM), "~a_~a", [Name, ID]),
	format(atom(VMINTF), "~a-eth0", [VM]),
	rdf_assert(VM, rdf:type, owl:'NamedIndividual'),
	rdf_assert(VM, rdf:type, nm:'DeploymentUnit'),
	rdf_assert(VM, nm:isRunningOn, Machine),
	rdf_assert(VM, nm:cpuUtilization, "0"^^xsd:string),
	rdf_assert(VM, nm:vcpuUtilization, 1^^xsd:integer),
	rdf_assert(VM, nm:memoryUtilization, 1000000000),
	rdf_assert(VM, nm:storageUtilization, 1000000000),
	rdf_assert(VM, nm:serviceSlice, Slice),
	rdf_assert(VM, nm:hasInterface, VMINTF).

nearestPhysicalMachine(X, Y) :-
	gNodeB(X),
	physicalConnection(X, MS),
	metroSwitch(MS),
	physicalConnection(MS, Y),
	physicalMachine(Y).

nearestTest(X, Y) :-
	gNodeB(X),
	physicalConnection(X, Y),
	physicalMachine(Y).

:- table physicalConnection/2.
physicalConnection(X, Y) :-
	physicalLink(W, X),
	wire(W),
	physicalLink(W, Y),
	X \= Y;
	physicalConnection(X, B),
	X \= B,
	physicalConnection(B, Y),
	B \= Y,
	X \= Y.

:- table physicalConnection/4.
physicalConnection(X, Y, Count, Tally) :-
	physicalLink(W, X),
	wire(W),
	physicalLink(W, Y),
	X \= Y,
	Tally is Count+1;
	physicalConnection(X, B, Count+1, Tally),
	X \= B,
	physicalConnection(B, Y, Count, Tally),
	B \= Y,
	X \= Y.

networkConnection(X, Y) :-
	physicalDevice(X),
	demoNetworkPath(X, Y),
	physicalDevice(Y).

% Either shortest possible path
% OR 
% shortest possible path with a 
% shorted possible path inside?
demoNetworkPath(X, Y) :-
	physicalLink(W, X),
	wire(W),
	physicalLink(W, Y);
	demoNetworkPath(X, S),
	metroSwitch(S),
	demoNetworkPath(S, Y).

demo(Stream) :-
	get_time(Start),
	demo,
	get_time(Finish),
	Duration is Finish-Start,
	status(TotDeps, CoreDeps, SCMs, MLs),
	csv_write_stream(Stream, [row(Duration, TotDeps, CoreDeps, SCMs, MLs)],[]).

demo :-
	findall(GNodeB, (
		gNodeB(GNodeB)
	), Gs),
	slice_demo(Gs).

slice_demo([]).
slice_demo([H|T]) :-
	%writeln(H),
	%get_time(Start),
	add_slice(H),
	%get_time(Time),
	%Duration is Time-Start,
	%writeln(Duration),
	slice_demo(T).

create_csv :-
	open('5g.csv', append, Stream),
	csv_write_stream(Stream, [row('Duration', 'Total Deployments', 'Core Deployments', 'Machine Capacity', 'Maxed Links')], []),
	close(Stream).

five_demo :-
	open('5g.csv', append, Stream),
	demo(Stream),
	demo(Stream),
	demo(Stream),
	demo(Stream),
	demo(Stream),
	demo(Stream),
	demo(Stream),
	close(Stream).

validation_demo(Num) :-
	open('validation.csv', append, Stream),
	csv_write_stream(Stream, [row('Duration')], []),
	close(Stream),
	validation_demo_run(Num).

validation_demo_run(0).
validation_demo_run(Num) :-
	demo,
	get_time(Start),
	config_quality(_),
	get_time(Time),
	Duration is Time-Start,
	open('validation.csv', append, Stream),
	csv_write_stream(Stream, [row(Duration)], []),
	close(Stream),
	NewNum is Num-1,
	validation_demo_run(NewNum).
