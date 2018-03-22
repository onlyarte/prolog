insert_at(_, [], _,_, []).
insert_at(E, L, 1, X) :-
        X = [E|L],!.
insert_at(E, [H | T], C, X) :-
        C0 is C-1,
        insert_at(E, T, C0, X0),
        X = [H | X0],!.

drop([], _, _, []).
drop([H|T], N, 0, R) :- drop(T, N, N, R),!.
drop([H | T], N, C, R) :- 
        C0 is C-1,
        drop(T, N, C0, R0),
        R = [H | R0],!.
