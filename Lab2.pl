div(X,Y,D,M):-div0(X, Y, D, M, 0, 0).
div0(X,_,D,M,A,X):-D is A, M is 0,!.
div0(X,Y,D,M,A,B):-B > X, D is A-1, M is X-(B-Y),!.
div0(X,Y,D,M,A,B):-A0 is A+1, B0 is B+Y, div0(X, Y, D, M, A0, B0),!.

pow(X,Y,Z):-pow0(X, Y, Z, 0, 1).
pow0(_,Y,Z,Y,B):-Z is B,!.
pow0(X,Y,Z,A,B):-A0 is A+1, B0 is B*X, pow0(X,Y,Z,A0,B0),!.

fastPow(X,0,Z):-Z is 1,!.
fastPow(X,1,Z):-Z is X,!.
fastPow(X,2,Z):-Z is X*X,!.
fastPow(X,N,Z):-div(N, 2, D, M), M is 0, fastPow(X, D, I), pow(I, 2, Z),!.
fastPow(X,N,Z):-div(N, 2, _, M), M is 1, F is N-1, fastPow(X, F, I), Z is I*X,!.

fib(0, 0):-!.
fib(1, 1):-!.
fib(X, Y):-X > 1, X2 is X-2, fib(X2, Y2), X1 is X-1, fib(X1, Y1), Y is Y1+Y2,!.

fastFib(0, 0):-!.
fastFib(X, Y):- X > 0, fastFib(X, Y, _),!.
fastFib(1, 1, 0):-!.
fastFib(X, Y1, Y2):-X > 1, X1 is X-1, fastFib(X1, Y2, Y3), Y1 is Y2+Y3,!.

/* skips 1s, 2s so that [_,_,_,_,3] is displayed for 48 meaning [2,2,2,2,3] */
factors( N, FS):-factors2(N, FS).
factors2( N, FS):-(
    N < 2 -> FS = [];
    4 > N -> FS = [N]; 
    0 is N rem 2 -> FS = [K|FS2], N2 is N div 2, factors2(N2, FS2);
    factors( N, 3, FS)).
factors(N, K, FS):-( 
    N < 2 -> FS = []; 
    K*K > N -> FS = [N]; 
    0 is N rem K -> FS = [K|FS2], N2 is N div K, factors( N2, K, FS2);
    K2 is K+2, factors( N, K2, FS)).

sum_series(1,1):-!.
sum_series(N,S):-
    ss0(N,S,1,0,1),!.

ss0(N, S, N, R, P):-S is R+(1/(P*N)),!.
ss0(N, S, C, R, P):-
    C < N,
    C0 is C+1,
    P0 is P*C,
    R0 is R+(1/P0),
    ss0(N, S, C0, R0, P0),!.


run:-
    nl, nl, write('TASK 1 DIV. 18 / 4 = D [M]'),
    div(18,4,D,M), nl,
    write('D = '), write(D), nl, write('M = '), write(M), nl, nl,
    write('TASK 1 DIV. 20 / 8 = D [M]'),
    div(20,8,D0,M0), nl,
    write('D = '), write(D0), nl, write('M = '), write(M0), nl, nl,
    write('TASK 2 POW. 2^8 = P'),
    pow(2,8,P), nl,
    write('P = '), write(P), nl, nl,
    write('TASK 2 FAST POW. 3^3 = P'),
    pow(3,3,P0), nl,
    write('P = '), write(P0), nl, nl,
    write('TASK 3 FIBS SERIES'), nl,
    write('9th = '), fib(9,N0), write(N0), nl, write('10th = '), fib(10,N1), write(N1), nl, write('11th = '), fib(11,N2), write(N2), nl, nl,
    write('TASK 3 FAST FIBS SERIES'), nl,
    write('9th = '), fastFib(9,N01), write(N01), nl, write('10th = '), fastFib(10,N11), write(N11), nl, write('11th = '), fastFib(11,N21), write(N21), nl, nl,
    write('TASK 4 FACTORS'), nl,
    write('18 = '), factors(18, LL), write(LL), nl,
    write('23 = '), factors(23, LL1), write(LL1), nl, nl,
    write('TASK 5 SERIES 1/1! + ... + 1/N!'), nl,
    write('N = 10; SUM = '), sum_series(10, NNN), write(NNN), nl,
    write('N = 12; SUM = '), sum_series(12, NNNM), write(NNNM), nl, nl.

:-initialization(run).
