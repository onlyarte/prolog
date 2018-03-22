/*
TASK 1
Visit all nodes of an AVL tree.

nodesAVL(t(4, t(2, t(1, nil, nil), t(3, nil, nil)), t(6, t(5, nil, nil), t(7, nil, nil))), X).

X = 1 ? ;
X = 2 ? ;
X = 3 ? ;
X = 4 ? ;
X = 5 ? ;
X = 6 ? ;
X = 7 ? ;
*/

nodesAVL(t(_, L, _), X) :- nodesAVL(L, X).
nodesAVL(t(X, _, _), X).
nodesAVL(t(_, _, R), X) :- nodesAVL(R, X).

/*
TASK 2
Find an element in an AVL-tree.

searchAVL(t(4, t(2, t(1, nil, nil), t(3, nil, nil)), t(6, t(5, nil, nil), t(7, nil, nil))), 7, X).
X = 7

searchAVL(t(4, t(2, t(1, nil, nil), t(3, nil, nil)), t(6, t(5, nil, nil), t(7, nil, nil))), 8, X).
no
*/

searchAVL(t(Q, _, _), Q, Q) :- !.
searchAVL(t(X0, L, _), Q, X) :- Q < X0, searchAVL(L, Q, X),!.
searchAVL(t(X0, _, R), Q, X) :- Q > X0, searchAVL(R, Q, X),!.

/*
TASK 3
Check if tree is AVL.
Conditions:
- AVL tree is an binary search tree;
- the heights of the two child subtrees of any node differ by at most one.

isAVL(t(4, t(2, t(1, nil, nil), t(3, nil, nil)), t(6, t(5, nil, nil), t(7, nil, nil)))).
true
*/

isAVL(nil).
isAVL(t(_, nil, nil)).
isAVL(t(_, L, nil)) :- height(L, 1).
isAVL(t(_, nil, R)) :- height(R, 1).
isAVL(t(X, t(X1, L1, R1), t(X2, L2, R2))) :-
      X1 < X, X2 > X,
      L = t(X1, L1, R1),
      R = t(X2, L2, R2),
      height(L, HL),
      height(R, HR),
      ( 
        1 is abs(HL - HR) ;
        0 is HL - HR 
      ),
      isAVL(L),
      isAVL(R).

/* using */
height(nil,0).
height(t(_,nil,nil),1).
height(t(_,L,R),H) :- L = t(_,_,_), R = t(_,_,_),
    height(L,HL), height(R,HR), 
    (   HL >= HR
    ->  H is HL+1
    ;   H is HR+1 ),!.
