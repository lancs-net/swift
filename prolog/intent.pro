:- module(intent, [
		load_intent/0,
		test_intent/0,
		infer_intent/0,
		%requiresAvailability/1,
		%requiresAvoidance/2,
		requiresSecurity/1,
		requiresLatency/1
]).

test_intent :-
	load_intent,
	rdf_load('../ontologies/examples/tmf_example/customer_intent.ttl', [format(turtle), graph('intent'), register_namespaces(true)]).

load_intent :-
	rdf_load('../ontologies/intent/intent.ttl', [format(turtle), graph('intent_model'), register_namespaces(true)]),
	rdf_load('../ontologies/tmf/icm.ttl', [format(turtle), graph('icm'), register_namespaces(true)]),
	rdf_load('../ontologies/intent/kpi.ttl', [format(turtle), graph('kpi'), register_namespaces(true)]),
	rdf_load('../ontologies/examples/tmf_example/service.ttl', [format(turtle), graph('service'), register_namespaces(true)]).

output_intent :-
	rdf_save_turtle('./prolog/op_intent.ttl', [only_known_prefixes(true), a(true)]).

dump_intent(S, P, O) :-
	rdf(S, P, O, 'intent').
	/*rdf_has(S, owl:topObjectProperty, O, P).*/

dump_inferred_intent(S, P, O) :-
	dump_intent(S, P, O).

clean_intent :-
	rdf_retractall(_, _, _, 'icm'),
	rdf_retractall(_, _, _, 'intent').

/** Functors */
infer_intent :-
	requiresAvailability(_),
	requiresLatency(_),
	requiresSecurity(_),
	requiresAvoidance(_, _),
	requiresBandwidth(_).

%%%%%%%%% USER POLICY %%%%%%%%%

requiresInstantiation(_) :-
	% If no instances of anything.
	serviceSpecification(Service),
	findall(ChainSpec, (
		requiresFunctionChain(Service, ChainSpec),
		network:instantiate_function_chain(ChainSpec, _)
	), _).

/* Availability */

% Does availability intent exist?
availabilityIntent(I) :-
	rdfs_individual_of(I, icm:'PropertyParameter'),
	rdf_has(I, kpi:availability, _).

% Forward Chain Availbility.
%:- dynamic checkAvailability/0.
%requiresAvailability(I) :-
%	rdfs_individual_of(I, icm:'PropertyParameter'),
%	rdf_has(I, kpi:availability, _) ->
%	writeln("A"),
%	assertz(user:constraint(checkAvailability, true)),
%	writeln("A"),
%	current_predicate(validHost, Head),
%	writeln("A"),
%	arg(1, Head, Host),
%	writeln("A"),
%	clause(Head, Body, _),
%	writeln("A"),
%	asserta((user:validHost(Host, Spec) :- 
%		Body,
%		constraint(checkAvailability, Bool),
%		(
%			Bool,
%			\+ (
%				hasDeploymentUnit(F, DU),
%				hasFunction(FC, F),
%				isRunningOn(ODU, Host),
%				hasDeploymentUnit(OF, ODU),
%				hasFunction(OFC, OF),
%				\+ rdf_equal(FC, OFC)
%			)
%		);
%		true
%	)),
%	abolish_all_tables.

% Current implementation means validHop always false

/*
:- dynamic checkBandwidth/0.
requiresBandwidth(I) :-
	rdfs_individual_of(I, icm:'PropertyParameter'),
	rdf_has(I, kpi:kpiTerm, Secure),
	convert_xsd(Secure, SecureString),
	SecureString == "throughput" ->
	assertz(constraint(checkBandwidth, true)),
	add_constraint(validHop(X), (
		constraint(checkAvoidance, Bool),
		Bool ->
		
	)),
	abolish_all_tables.
*/

:- dynamic checkLatency/0.
requiresLatency(_) :-
	true.

:- dynamic checkSecurity/0.
requiresSecurity(_) :-
	true.

%%%%%%%%% ENTERPRISE POLICY %%%%%%%%%

requiresFireSafety(_) :-
	true.

requiresEnergy(_) :-
	true.

latencyIntent(I) :-
	rdfs_individual_of(I, icm:'PropertyParameter'),
	rdf_has(I, kpi:latency, _).

throughputIntent(I) :-
	rdfs_individual_of(I, icm:'PropertyParameter'),
	rdf_has(I, kpi:throughput, _).

securityIntent(I) :-
	rdfs_individual_of(I, icm:'PropertyParameter'),
	rdf_has(I, kpi:kpiTerm, "secure"^^xsd:string).

connectivityIntent(I) :-
	rdfs_individual_of(I, icm:'PropertyParameter'),
	rdf_has(I, kpi:kpiTerm, "connect"^^xsd:string).

% Probably needs editing but can't test yet
:- rdf_meta parentService(r, o).
parentService(I, Service) :-
	rdf_has(S, _, I),
	(
		serviceSpecification(Service), !;
		parentService(S, Service)
	).

%%%%%%%%% GETTERS %%%%%%%%%

%%%%%%%%% Service Queries %%%%%%%%%

% Create a virtual environment (new graph),
% which designs a scenario to determine the 
% minimum number of hosts, using completely 
% unconstrained host machines.

%:- table find_smallest_requirements/3.
find_smallest_requirements(MinCPU, MinMEM, MinSTOR) :-
	findall(CPU, (
		virtualDeviceSpecification(DepSpec),
		rdf(DepSpec, im:minCPURequirement, CPUF),
		convert_xsd(CPUF, CPU)
	), CPUs),
	findall(MEM, (
		virtualDeviceSpecification(DepSpec),
		rdf(DepSpec, im:minMemoryRequirement, MEMF),
		convert_xsd(MEMF, MEM)
	), MEMs),
	findall(STOR, (
		virtualDeviceSpecification(DepSpec),
		rdf(DepSpec, im:minStorageRequirement, STORF),
		convert_xsd(STORF, STOR)
	), STORs),
	[FCPU|CPUL] = CPUs,
	[FMEM|MEML] = MEMs,
	[FSTOR|STORL] = STORs,
	smallest_in_list(CPUL, FCPU, MinCPU),
	smallest_in_list(MEML, FMEM, MinMEM),
	smallest_in_list(STORL, FSTOR, MinSTOR).

%%%%%%%%% MUTATORS %%%%%%%%%
get_var(Clause, Var) :-
	current_predicate(Clause, Head),
	arg(1, Head, Var).

%:- meta_predicate get_vars(?, ?).
%get_vars(Clause, Vars) :-
%	current_predicate(Clause, Head),
%	functor(Head, Name, N).
	%bagof(Arg, arg(U, Head, Arg), Vars).

get_arg(Last, Last, _, _).
get_arg(Index, LastIndex, Head, Arg) :-
	arg(Index, Head, TArg),
	get_arg(Index+1, LastIndex, Head, NArg),
	Arg = [TArg, NArg].

exchange_host(Variable, Host) :-
	rdf(X, im:requires, Variable),
	rdf_retractall(X, im:requires, Variable),
	rdf_assert(X, nm:isRunningOn, Host).

attach_host(Variable, Host) :-
	/*
	findall(X, (
		rdf(X, im:requires, Variable),
		asserta(isRunningOn(X, Host))
	), _).
	*/
	findall(X, (
		rdf(X, im:requires, Variable),
		rdf_assert(X, nm:isRunningOn, Host)
	), _).
	
    %rdf(X, im:requires, Variable),
	%assertz(isRunningOn(X, Host))
	%rdf_assert(X, nm:isRunningOn, Host).
	
attach_valid_hosts(Variable, Host) :-
	bagof(Device, (
		rdf(Device, im:requires, Variable),
		deploymentUnit(Device)
	), Devices),
	rdf_transaction((
		attach_valid_host(Devices, Host)		
	)).

attach_valid_host([], _).
attach_valid_host([Device|Devices], Host) :-
	validHost(Host, Device),
	rdf_assert(Device, nm:isRunningOn, Host),
	attach_valid_host(Devices, Host).
	
undo_attach_host(Variable, Host) :-
	rdf(X, im:requires, Variable),
	rdf_retractall(X, nm:isRunningOn, Host).

create_slice(ID) :-
	rdf_assert(ID, rdf:type, icm:'Intent'),
	rdf_assert(ID, rdfs:comment, "TUDOR intent for ordering aslice"^^xsd:string).
