:- use_module(library(http/json)).
:- use_module(library(term_to_json)).
:- use_module(library(prolog_stream)).

/* Generate NSD
 * 1. Add all machines and service def
 * 2. Add SFCs for each targeted service
 * 3. Get all relevant vnfds
 * 4. Redundancy ->
 *		Create minimum number of instances
 *		Connect to 2 machines
 * 5. Connectivity -> 
 *		Ensure ext-cpds are connected to each other
 * 6. Security ->
 *		Ensure validity of security intent
 * 7.  
 */

/** Create New */
test_nsd(O) :-
	get_nsd(I),
	json_write(O, I).
/*
dump_nsd(O) :-
	nsd(O),
	writeln(O).*/
	/*json_write_dict(O, I, [width(0)]).*/
	/*atom_json_dict(O, I, [serialize_unknown(true),width(0)]).*/
	/*atom_json_dict(O, I, [width(0)]).*/
	/*term_to_json(I, O).*/

dump_nsd_stream(S, _) :-
	nsd(I),
	json_write_dict(S, I, [width(0)]).

dump_nsd(O) :-
	writeln("NSD"),
	rdf(Name, icm:hasTarget, _),
	ID = Name,
	/* Description */
	rdf(I, rdf:type, im:'Intent'),
	rdf(I, rdfs:comment, AD),
	/*rdf_equal(AD, Desc^^xsd:string),*/

	/* Get all inferred links */
	virtuallinkdesc(_, VLD),

	/* Get all vnfds */
	vnfdid(_, VNFDIDs),
	defaultf(VNFDIDs, DF),
	Version = '1.0',
	O = nsd{
		id: ID,
		description: AD,
		name: Name,
		version: Version,
		virtual_link_desc: VLD,
		vnfd_id: VNFDIDs,
		df: DF
	}.

virtuallinkdesc(_, O) :-
	writeln("VLD"),
	O = [vld{
			id: 'osm-mgmt', 
			mgmt_network: 'true'
		}].

vnfdid(_, O) :-
	writeln("VNFDID"),
	bagof(Y, (
		rdf_has(_, im:requiresFunction, Y)
	), VNFDIDs),
	O = VNFDIDs.

defaultf(_, O) :-
	writeln("Defaultf"),
	bagof(L, (
		vnfprofile(_, L)
	), DFL),
	writeln(DFL),
	DFID = 'default-df',
	L = df{
		id: DFID,
		vnf_profile: DFL
	},
	O = [L].

vnfprofile(_, O) :-
	writeln("VNFPROFILE"),
	/*rdf_has(_, im:requiresFunction, VPVDID),*/
	virtualMachine(Z),
	rdf(VNFDID, im:requiresDeploymentUnit, Z),
	rdf(VNFDID, nm:hasInstance, VNFPID),
	virtuallinkconnectivity(VNFDID, VNFPID, VLC),
	L = vnfp{
		id: VNFPID,
		virtual_link_connectivity: VLC,
		vnfd_id: VNFDID
	},
	O = L.

virtuallinkconnectivity(VNFDID, VNFPID, O) :-
	writeln("CCPID"),
	bagof(L, (
		Link = 'osm-mgmt',
		constituentbaseelement(VNFDID, VNFPID, CBPDID),
		L = cci{
			constituent_cpd_id: CBPDID,
			virtual_link_profile_id: Link
		}
	), VCL),
	O = VCL.

constituentbaseelement(VNFDID, VNFPID, O) :-
	writeln("CBE"),
	/* Work out this from something */
	CBEID = VNFPID,
	format(atom(CBCI), '~a-mgmt', [VNFDID]),
	bagof(L, (
		L = cbe{
			constituent_base_element_id: CBEID,
			constituent_cpd_id: CBCI
		}
	), CBL),
	O = CBL.


dump_deployment(S, P, O) :-
	add_machines;
	add_vnfds;
	create_minimum;
	intent_mutate;
	rdf(S, P, O, 'deploy').

intent_mutate :-
	get_intents(I),
	get_intent_properties(I, _),
	(
		rdf_has(_, kpi:availability, _) ->
		/*get_propertyparam_value(P, V),*/
		mutate_available
	);
	(
		rdf_has(_, kpi:connectivity, _) ->
		/*get_propertyparam_value(P, V),*/
		/*mutate_connected*/
		true
	).

create_minimum :-
	writeln("Minimum"),
	rdf(F, _, _, 'service'),
	/*get_vnfds(F),*/
	rdf(F, im:requiresDeploymentUnit, FT),
	/* If (min) instance number create instance */ 
	rdf_assert(F, rdf:type, FT, 'deploy'),
	(
		rdf(F, im:requiresDeploymentUnit, VDU),
		rdf_assert(F, im:requiresDeploymentUnit, VDU, 'deploy')
	),
	(
		(
			rdf_has(F, im:instanceNumber, E);
			rdf_has(F, im:minInstanceNumber, E)
		) ->
		(
			rdf_equal(E, L^^xsd:unsignedInt),
			create_backend_instances(F, 0, L)
		);
		create_backend_instances(F, 0, 1)
	).

mutate_available :-
	writeln("Mutate Available"),
	BackendNo = 3,
	/*PhysicalMachineNo = 2,*/
	/* Create 3 instances of backend */
	(
		rdf(S, _, _, 'deploy'),
		aggregate_all(count, backendFunction(S), MC),
		MC < BackendNo ->
		create_backend_instances(S, MC, BackendNo)		
	);
	/* deploy all backends when enough */
	bagof(KVM, X^(
		rdf(X, rdf:type, nm:'PhysicalMachine', 'deploy'),
		isRunningOn(KVM, X),
		kVM(KVM)
	), KVMs),
	bagof(VDU, (
			rdf(BF, rdf:type, nm:'BackendFunction', 'deploy'),
			rdf(BF, im:requiresDeploymentUnit, VDUD, 'deploy'),
			hasInstance(VDUD, VDU)
		), VDUs),
	deploy_equal(VDUs, KVMs),
	bagof(VLB, (
			rdf(LBF, rdf:type, nm:'LoadBalanceFunction', 'deploy'),
			rdf(LBF, im:requiresDeploymentUnit, VLBD, 'deploy'),
			hasInstance(VLBD, VLB)
		), VLBs),
	deploy_equal(VLBs, KVMs).

deploy_equal([], _) :-
	!.

/* VDUS and HM */
deploy_equal([HV|V], [HM|M]) :-
	rdf_assert(HV, nm:isRunningOn, HM, 'deploy'),
	append(M, [HM], L),
	deploy_equal(V, L).

mutate_connected :-
	rdf(_, _, _, 'deploy'),
	/*
	(
		
	);*/
	!.

create_backend_instances(N, C, T) :-
	(
		C < T ->
		(
			create_backend_instances(N, C+1, T),
			format(atom(A), "~a_~d", [N, C]),
			rdf_assert(A, rdf:type, owl:'Individual', 'deploy'),
			/* Probably don't need to include type here... maybe in another graph?*/
			/*rdf_assert(A, rdf:type, nm:'BackendFunction', 'deploy'),*/
			rdf_assert(N, nm:hasInstance, A, 'deploy'),
			bagof(V, rdf(N, im:requiresDeploymentUnit, V, 'service'),
			VDUs),
			instantiate_vdus(A, VDUs, 0)
		);
		!
	).

instantiate_vdus(_, [], _) :-
	!.

instantiate_vdus(A, [H|VDUs], C) :-
	instantiate_vdus(A, VDUs, C+1),
	format(atom(V), "~a_~w~d", [A, "DU", C]),
	rdf_assert(V, rdf:type, owl:'Individual', 'deploy'),
	/*rdf_assert(V, rdf:type, nm:'DeploymentUnit', 'deploy'),*/
	rdf_assert(H, nm:hasInstance, V, 'deploy'),
	rdf_assert(A, nm:hasDeploymentUnit, V, 'deploy').

add_machines :-
	writeln("Machines"),
	rdf(S, P, O, 'live_network'),
	physicalMachine(S),
	rdf_assert(S, P, O, 'deploy'),
	/* Assert Archimedes KVM */ 
	isRunningOn(KVM, S),
	rdf_assert(KVM, nm:isRunningOn, S, 'deploy'),
	rdf_assert(KVM, rdf:type, nm:'KVM', 'deploy'),
	
	/* Temporary */
	rdf_assert(ln:'Tiny', rdf:type, nm:'PhysicalMachine', 'deploy'),
	rdf_assert(ln:'Tiny_hypervisor', rdf:type, nm:'KVM', 'deploy'),
	rdf_assert(ln:'Tiny_hypervisor', nm:isRunningOn, ln:'Tiny', 'deploy').

/*
add_function_chains :-
	get_targets(O),
*/

add_vnfds :-
	writeln("VNFDS"),
	get_vnfds(S),
	rdf(S, rdf:type, O),
	rdf_assert(S, rdf:type, O, 'deploy').


/** Fact Finder */ 


get_targets(O) :-
	rdf(S, _, O, 'intent'),
	deliveryParameter(S),
	hasTarget(S, O),
	service(O).

get_vnfds(O) :-
	service(ES),
	rdf_has(ES, im:requiresFunction, O).

execute_changes :-
	true.
