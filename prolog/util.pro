:- module(util, [
	short_uuid/1,
	convert_xsd/2,
	smallest_in_list/3,
	largest_in_list/3,
	list_length/2,
	quick_sort/2,
	bubble_sort/2,	
	bubble_sort_2d/2,
	sum_list/2
]).

short_uuid(Out) :-
	uuid(UUID),
	once((
		sub_string(UUID, Before, _, _, "-"),
		sub_atom(UUID, 0, Before, _, Out)
	)).

convert_xsd(Val, Ret) :-
	rdf_equal(Val, Ret^^xsd:unsignedInt);
	rdf_equal(Val, Ret^^xsd:integer);
	rdf_equal(Val, Ret^^xsd:float);
	rdf_equal(Val, Ret^^xsd:double);
	rdf_equal(Val, Ret^^xsd:string).

smallest_in_list([], CH, Val) :- Val = CH.
smallest_in_list([A|B], CH, Val) :-
	A < CH ->
	smallest_in_list(B, A, Val);
	smallest_in_list(B, CH, Val).

largest_in_list([], CH, Val) :- Val = CH.
largest_in_list([A|B], CH, Val) :-
	A > CH ->
	largest_in_list(B, A, Val);
	largest_in_list(B, CH, Val).

list_length([_|T], Count) :-
	count_list(T, Count),
	Count = Count + 1.

list_length([], Count) :-
	Count = 0.

sum_list([], Res) :- Res = 0.
sum_list([H|T], Res) :-
	sum_list(T, SumList),
	Res = H + SumList.

/* Quick Sort */
quick_sort(List, Sorted) :- q_sort(List, [], Sorted).
q_sort([], Acc, Acc).
q_sort([H|T], Acc, Sorted) :-
	pivoting(H, T, L1, L2),
	q_sort(L1, Acc, Sorted1), q_sort(L2, [H|Sorted1], Sorted).

pivoting(_, [], [], []).
pivoting(H,[X|T], [X|L], G) :- X =< H, pivoting(H,T,L,G).
pivoting(H,[X|T], L, [X|G]) :- X > H, pivoting(H,T,L,G).

get_2nd_element([_, Y|_], Val) :- Val = Y.

/* Bubble Sort */
bubble_sort(List, Sorted) :- b_sort(List, [], Sorted).
b_sort([], Acc, Acc).
b_sort([H|T], Acc, Sorted) :- bubble(H, T, NT, Max), b_sort(NT, [Max|Acc], Sorted).

bubble(X, [], [], X).
bubble(X, [Y|T], [Y|NT], Max) :- X > Y, bubble(X, T, NT, Max).
bubble(X, [Y|T], [X|NT], Max) :- X =< Y, bubble(Y, T, NT, Max).

bubble_sort_2d(List, Sorted) :- b_sort_2d(List, [], Sorted).
b_sort_2d([], Acc, Acc).
b_sort_2d([H|T], Acc, Sorted) :- bubble_2d(H, T, NT, Max), b_sort_2d(NT, [Max|Acc], Sorted).

bubble_2d(X, [], [], X).
bubble_2d(X, [Y|T], [Y|NT], Max) :- 
	get_2nd_element(X, Xt),
	get_2nd_element(Y, Yt),
	Xt > Yt, 
	bubble_2d(X, T, NT, Max).

bubble_2d(X, [Y|T], [X|NT], Max) :- 
	get_2nd_element(X, Xt),
	get_2nd_element(Y, Yt),
	Xt =< Yt, 
	bubble_2d(Y, T, NT, Max).
