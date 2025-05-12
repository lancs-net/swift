
make_gnode(Name) :-
	assertz(gNodeB(Name)).

make_core(Name) :-
	assertz(coreSwitch(Name)).

make_metro(Name) :-
	assertz(metroSwitch(Name)).

make_default_wire(Name) :-
	assertz(wire(Name)).

make_link(Wire, Node) :-
	assertz(physicalLink(Wire, Node)).

make_links(Wire, Node1, Node1) :-
	make_link(Wire, Node1),
	make_link(Wire, Node2).

