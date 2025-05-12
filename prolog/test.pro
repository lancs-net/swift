:- module(test, [
	tests/2,
	test_avoidance/2,
	test_redundancy/2,
	test/3,
	test_sequential/2,
	test_sequential/4,
	test_walk/0,
	test_optimal/0,
	test_run/0
]).


tests(_, _) :-
	open('tests-optim.csv', write, OptimStream),
	open('tests-walk.csv', write, WalkStream),
	csv_write_stream(WalkStream, [row('PreDeps', 'PostDeps', 'Duration', 'Success', 'Quality')], []),
	csv_write_stream(OptimStream, [row('PreDeps', 'PostDeps', 'Duration', 'Success', 'Quality')], []),
	/*
	test(walk, 1, 1),
	test(walk, 1, 2),
	test(optim, 1, 1),
	test(optim, 1, 2),
	*/
	close(WalkStream),
	close(OptimStream).

add_and_scale(0).
add_and_scale(Total) :-
	make_definition,
	%add_chain(_, _, Chain),
	%scale_backends_in_chain(Chain, 1),
	solve_walk,
	NewTotal is Total-1,
	add_and_scale(NewTotal).

create_logs :-
	open('avoid.csv', write, AvoidStream),
	open('redundant.csv', write, RedundantStream),
	csv_write_stream(AvoidStream, [row('Countdown', 'Duration', 'TotalDeploymentUnits')], []),
	csv_write_stream(RedundantStream, [row('Countdown', 'Duration', 'TotalDeploymentUnits')], []),
	close(RedundantStream),
	close(AvoidStream).

test_avoidance(0).
test_avoidance(TotalNum) :-
	add_and_scale(5),
	abolish_all_tables,
	aggregate_all(count, (
		deploymentUnit(_)
	), TotalDeploymentUnits),
	writeln(TotalDeploymentUnits),
	get_time(StartTime),
	network:assert_routes,
	time_since(StartTime, Duration),
	open('avoid.csv', append, AStream),
	csv_write_stream(AStream, [row(TotalNum, Duration, TotalDeploymentUnits)],[]),
	close(AStream),
	abolish_all_tables,
	Next is TotalNum-1,
	test_avoidance(Next).

test_redundancy(0).
test_redundancy(TotalNum) :-
	add_and_scale(5),
	abolish_all_tables,
	aggregate_all(count, (
		deploymentUnit(_)
	), TotalDeploymentUnits),
	writeln(TotalDeploymentUnits),
	get_time(StartTime),
	network:assert_redundant(_),
	time_since(StartTime, Duration),
	open('redundant.csv', append, AStream),
	csv_write_stream(AStream, [row(TotalNum, Duration, TotalDeploymentUnits)],[]),
	close(AStream),
	abolish_all_tables,
	Next is TotalNum-1,
	test_redundancy(Next).

test_avoidance(Metros, Machines) :-
	once(infer_intent),
	once(test_sequential(walk, 500)), 
	destroy_floating_deployment_units,
	format(string(Filename), 'data/test/test-~w-~w.xml', [Metros, Machines]),
	open(Filename, write, Stream),
	rdf_save(stream(Stream), []),
	format(string(Progname), 'data/test/test-~w-~w.pro', [Metros, Machines]),
	qsave_program(Progname, []),
	get_time(StartTime), 
	network:assert_routes,
	time_since(StartTime, Duration), 
	open('avoid.csv', append, AStream), 
	csv_write_stream(AStream, [row(Metros, Machines, Duration)],[]).

test_redundancy(Metros, Machines) :-
	once(infer_intent),
	once(test_sequential(walk, 500)), 
	destroy_floating_deployment_units,
	/*
	format(string(Filename), 'data/test/test-~w-~w.xml', [Metros, Machines]),
	open(Filename, write, Stream),
	rdf_save(Stream, []),
	*/
	get_time(StartTime), 
	network:assert_redundant(_), 
	time_since(StartTime, Duration), 
	open('redundant.csv', append, Stream), 
	csv_write_stream(Stream, [row(Metros, Machines, Duration)],[]).

test(Type, PreDeps, PostDeps) :-
	format(string(Filename), 'test-~w.csv', [Type]),
	open(Filename, append, Stream),
	csv_write_stream(Stream, [row('PreDeps', 'PostDeps', 'Duration', 'Success', 'Quality')], []),
	get_time(StartTime),
	nb_setval('StartTime', StartTime),
	setup_test,
	add_backends(PreDeps, 0),
	solve_walk,
	add_backends(PostDeps, 0),
	rdf_snapshot(Snap),
	snapshot(
		rdf_transaction((
			(
				Type == walk ->
				(
					solve_walk ->
					format(string(Success), 'yes', []);
					format(string(Success), 'no', [])
				);
				(
					solve_optimal ->
					format(string(Success), 'yes', []);
					format(string(Success), 'no', [])
				)
			),
			config_quality(Quality),
			time_since(Duration)
		), user, [snapshot(Snap)])
	),
	csv_write_stream(Stream, [row(PreDeps, PostDeps, Duration, Success, Quality)], []),
	close(Stream).

test_sequential(Type, Total) :-
	format(string(Filename), 'test-seq-~w.csv', [Type]),
	open(Filename, write, Stream),
	csv_write_stream(Stream, [row('Seq', 'Duration', 'Success', 'Quality')], []),
	get_time(StartTime),
	nb_setval('StartTime', StartTime),
	setup_test,
	add_backends,
	%solve_walk,
	once(initial_deploy),
	/*
	snapshot(
		rdf_transaction((
			%undo(break),
			test_sequential(Type, Total, 0, Stream)
		))
	),
	*/
	test_sequential(Type, Total, 0, Stream),
	close(Stream).

test_sequential(_, Total, Num, _) :- Total == Num.
test_sequential(Type, Total, Num, Stream) :-
	%add_backends,
	add_chain(_, _, Chain),
	scale_backends_in_chain(Chain, 1),
	(
	Type == walk ->
		(
			solve_walk ->
			format(string(Success), 'yes', []);
			format(string(Success), 'no', [])
		);
		(
			solve_optimal ->
			format(string(Success), 'yes', []);
			format(string(Success), 'no', [])
		)
	),
	time_since(Duration),
	config_quality(Quality),
	csv_write_stream(Stream, [row(Num, Duration, Success, Quality)], []),
	Success == "yes" ->
	(
		NewNum is Num + 1,
		test_sequential(Type, Total, NewNum, Stream)
	);
	test_sequential(Type, Total, Total, Stream).
	
test_walk :-
	open('walk.csv', write, Stream),
	csv_write_stream(Stream, [row('Test', 'Duration', 'Hosts')], []),
	get_time(StartTime),
	nb_setval('StartTime', StartTime),
	close(Stream),
	setup_test,
	add_backends,
	add_backends,
	solve_walk,
	time_since(Duration),
	append_csv('walk.csv', [row(0, 'Finished', Duration)]).

test_optimal :-
	open('optimal.csv', write, Stream),
	csv_write_stream(Stream, [row('Test', 'Duration', 'Hosts')], []),
	get_time(StartTime),
	nb_setval('StartTime', StartTime),
	close(Stream),
	setup_test,
	add_backends,
	add_backends,
	solve_optimal,
	time_since(Duration),
	%write("Total Time: "),
	%writeln(Duration),
	append_csv('optimal.csv', [row(0, 'Finished', Duration)]).

test_run :-
	open('run.csv', write, Stream),
	csv_write_stream(Stream, [row('Test', 'Duration', 'Success')]),
	get_time(StartTime),
	nb_setval('StartTime', StartTime),
	close(Stream),
	setup_test,
	add_backends,
	add_backends,
	solve_optimal,
	time_since(_).
