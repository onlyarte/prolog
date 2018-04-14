/*
TASK 1
Visit all nodes of a BT.

nodesLR(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil))), L).

L = d ? ;
L = b ? ;
L = e ? ;
L = a ? ;
L = c ? ;
L = g ? ;
L = f ? ;
no
*/

nodesLR(t(_, L, _), X) :- nodesLR(L, X).
nodesLR(t(X, _, _), X).
nodesLR(t(_, _, R), X) :- nodesLR(R, X).

/*
TASK 2
Node with no successors is called a leave.
Count leaves in a BT.

countLeaves(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil))), C).
C = 3
*/

countLeaves(nil,0).
countLeaves(t(_,nil,nil),1).
countLeaves(t(_,L,nil),C) :- L = t(_,_,_), countLeaves(L,C).
countLeaves(t(_,nil,R),C) :- R = t(_,_,_), countLeaves(R,C).
countLeaves(t(_,L,R),C) :- L = t(_,_,_), R = t(_,_,_),
    countLeaves(L,CL), countLeaves(R,CR), C is CL+CR.

/*
TASK 3
Find BT height.

height(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil))), H).
H = 4
*/

height(nil,0).
height(t(_,nil,nil),1).
height(t(_,L,nil),H) :- L = t(_,_,_), height(L,HL), H is HL+1.
height(t(_,nil,R),H) :- R = t(_,_,_), height(R,HR), H is HR+1.
height(t(_,L,R),H) :- L = t(_,_,_), R = t(_,_,_),
    height(L,HL), height(R,HR), 
    (
      HL >= HR
    ->
      H is HL+1
    ;
      H is HR+1
    ),!.

/*
TASK 4
Node with no successors is called a leave, other nodes are called internal nodes.
Count internal nodes in a BT.

countIN(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil))), C).
C = 4
*/

countIN(nil,0).
countIN(t(_,nil,nil),0).
countIN(t(_,L,nil),C) :- L = t(_,_,_), countIN(L,CL), C is CL+1.
countIN(t(_,nil,R),C) :- R = t(_,_,_), countIN(R,CR), C is CR+1.
countIN(t(_,L,R),C) :- L = t(_,_,_), R = t(_,_,_),
    countIN(L,CL), countIN(R,CR), C is CL+CR+1.

/*
TASK 5
Visit all nodes of a 2-3 tree.

nodes23(v2(d, v3(b ,c , v2(a, nil, nil), nil, nil), v2(e, nil, nil)), X).

X = a ? ;
X = b ? ;
X = c ? ;
X = d ? ;
X = e ? ;
no
*/

nodes23(v2(_, L, _), X) :- nodes23(L, X). 
nodes23(v2(X, _, _), X).
nodes23(v2(_, _, R), X) :- nodes23(R, X).
nodes23(v3(_, _, L, _, _), X) :- nodes23(L, X).
nodes23(v3(X, _, _, _, _), X).
nodes23(v3(_, X, _, _, _), X).
nodes23(v3(_, _, _, M, _), X) :- nodes23(M, X).
nodes23(v3(_, _, _, _, R), X) :- nodes23(R, X).

/*
TASK 6
Find an element in a 2-3 tree.
Q - element to find

search23(v2(d, v3(b ,c , v2(a, nil, nil), nil, nil), v2(e, nil, nil)), f, X).
no

search23(v2(d, v3(b ,c , v2(a, nil, nil), nil, nil), v2(e, nil, nil)), e, X).
X = e ? ;
no
*/

search23(v2(_, L, _), Q, X) :- search23(L, Q, X). 
search23(v2(Q, _, _), Q, Q).
search23(v2(_, _, R), Q, X) :- search23(R, Q, X).
search23(v3(_, _, L, _, _), Q, X) :- search23(L, Q, X).
search23(v3(Q, _, _, _, _), Q, Q).
search23(v3(_, Q, _, _, _), Q, Q).
search23(v3(_, _, _, M, _), Q, X) :- search23(M, Q, X).
search23(v3(_, _, _, _, R), Q, X) :- search23(R, Q, X).


/*
TASK 7
Check if a tree is binary.

isBT(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil)))).
yes
*/

isBT(nil).
isBT(t(_,L,R)) :- isBT(L), isBT(R).


/*
Check if a tree is 2-3.

is23(v2(d, v3(b ,c , v2(a, nil, nil), nil, nil), v2(e, nil, nil))).
yes
*/

is23(nil).
is23(v2(_, L, R)) :- is23(L), is23(R).
is23(v3(_, _, L, M, R)) :- is23(L), is23(M), is23(R).

run:-
    nl, nl, write('BINARY TREE FOR TASKS 1-4: t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil)))'),
    nl, nl, write('TASK 1 BT to list'), nl,
    findall(L, nodesLR(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil))), L), ALL), write(ALL), nl, nl,
    write('TASK 2 count BT leaves'), nl,
    write('N = '), countLeaves(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil))), C), write(C), nl, nl,
    write('TASK 3 BT height'), nl,
    write('H = '), height(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil))), H), write(H), nl, nl,
    write('TASK 4 count internal nodes'), nl,
    write('N = '), countIN(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil))), C0), write(C0), nl, nl,
    write('2-3 TREE FOR TASKS 5-6: v2(d, v3(b ,c , v2(a, nil, nil), nil, nil), v2(e, nil, nil))'), nl, nl,
    write('TASK 5 2-3 tree to list'), nl,
    findall(X, nodes23(v2(d, v3(b ,c , v2(a, nil, nil), nil, nil), v2(e, nil, nil)), X), ALL0), write(ALL0), nl, nl,
    write('TAKS 6 2-3 search'), nl,
    write('find e'),
    search23(v2(d, v3(b ,c , v2(a, nil, nil), nil, nil), v2(e, nil, nil)), e, G2), write(G2), nl, nl,
    write('TASK 7 is BT tree 1-4'), nl,
    isBT(t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil)))), write('yes'), nl, nl,
    write('TASK 7 is 2-3 tree 5-6'), nl,
    is23(v2(d, v3(b ,c , v2(a, nil, nil), nil, nil), v2(e, nil, nil))), write('yes'), nl, nl.

:-initialization(run).
