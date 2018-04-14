exists(A, list(A, _, _, _, _)).
exists(A, list(_, A, _, _, _)).
exists(A, list(_, _, A, _, _)).
exists(A, list(_, _, _, A, _)).
exists(A, list(_, _, _, _, A)).

rightOf(R, L, list(L, R, _, _, _)).
rightOf(R, L, list(_, L, R, _, _)).
rightOf(R, L, list(_, _, L, R, _)).
rightOf(R, L, list(_, _, _, L, R)).

middle(A, list(_, _, A, _, _)).

first(A, list(A, _, _, _, _)).

nextTo(A, B, list(B, A, _, _, _)).
nextTo(A, B, list(_, B, A, _, _)).
nextTo(A, B, list(_, _, B, A, _)).
nextTo(A, B, list(_, _, _, B, A)).
nextTo(A, B, list(A, B, _, _, _)).
nextTo(A, B, list(_, A, B, _, _)).
nextTo(A, B, list(_, _, A, B, _)).
nextTo(A, B, list(_, _, _, A, B)).

puzzle(WHO) :-
  exists(house('red', 'english', _, _, _), Houses),
  exists(house(_, 'swede', _, _, 'dog'), Houses),
  exists(house(_, 'dane', 'tea', _, _), Houses),
  rightOf(house('green', _, _, _, _), house('white', _, _, _, _), Houses),
  exists(house('green', _, 'coffee', _, _), Houses),
  exists(house(_, _, _, 'Pall-Mall', 'bird'), Houses),
  middle(house(_, _, 'milk', _, _), Houses),
  exists(house('yellow', _, _, 'Dunhill', _), Houses),
  first(house(_, 'norway', _, _, _), Houses),
  nextTo(house(_, _, _, 'Marlboro', _),house(_, _, _, _, 'cat'), Houses), 
  nextTo(house(_, _, _, 'Dunhill', _),house(_, _, _, _, 'horse'), Houses),
  exists(house(_, _, 'bear', 'Winfield', _), Houses),
  nextTo(house(_, 'norway', _, _, _),house('blue', _, _, _, _), Houses),
  exists(house(_, 'german', _, 'Rothmans', _), Houses),
  nextTo(house(_, _, _, 'Marlboro', _),house(_, _, 'water', _, _), Houses),
  exists(house(_, WHO, _, _, 'fish'), Houses),!.

run:-
    nl, nl, puzzle(WHO), write(WHO), nl, nl.

:-initialization(run).
