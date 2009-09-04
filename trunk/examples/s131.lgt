
% Slide 131: a language of simple arithmetic expressions

:- object(arithL,
	instantiates(language)).

	:- initialization((
		::show,
		::diagnostics
	)).

	alphabet([a,+,*,'(',')']).

	positive([a]).
	positive([a,+,a]).
	positive(['(',a,')',*,a]).

	negative([]).
	negative([+]).
	negative(['(',a,'(',*,a]).

:- end_object.



:- object(arithCFG,
	instantiates(cfg)).

	:- initialization((
		write('*** Context free grammar of slide 131 ***'), nl,
		::show,
		::diagnostics,
		arithL::test_mechanism(arithCFG),
		
		write('Listing some words generated by grammar '), nl,
		show_words(6)	
	)).
 
	start_symbol('E').

	rules([
		('E'->['E',+,'T']),
		('E'->['T']),
		('T'->['T',*,'F']),
		('T'->['F']),
		('F'->['(','E',')']),
		('F'->[a])
	]).
	
	show_words(MaxLen) :-
		show_words_process(MaxLen) ; true.
	show_words_process(MaxLen) :-
 		::word(W),
		length(W, L),
		(L > MaxLen -> !, fail ; true),
		write('    '), writeq(W), nl,
		fail.

:- end_object.
