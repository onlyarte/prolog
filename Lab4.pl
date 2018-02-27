/* Напишіть предикат, який перетворює вихідний список 
у список позицій від'ємних елементів. */

task1(MH,VecH):-task10(MH,0,[],VecH),!.

task10([], _, Indexes, Indexes).
task10([Head | Tail], Index, Indexes, Res):-
        Incr is Index+1,
        (
          Head < 0
        ->
          task10(Tail, Incr, [Index | Indexes], Res)
        ;
          task10(Tail, Incr, Indexes, Res)
        ),!.


/* 2. Напишіть предикат, що замінює всі входження заданого 
елемента на символ change_done. */

task2([],_,[]).
task2([Head | Tail], Elem, Res):-
        task2(Tail, Elem, Res0),
        (
          Head is Elem
        ->
          Res = ['change_done' | Res0]
        ;
          Res = [Head | Res0]
        ),!.


/*3. Напишіть предикат, що перетворює будь-який список арабських 
чисел (від 1 до 50) у список відповідних їм римських чисел.*/

task3([], []).
task3([Head | Tail], Res):-
        task30(Head, HR),
        append30(HR, HRT),
        task3(Tail, TR),
        Res = [HRT | TR],!.

append30([], Res):-Res = '',!.
append30([Head | Tail], Res):-
        append30(Tail, Res0),
        atom_concat(Head, Res0, Res),!.

task30(0, []).
task30(N, ['I'|Right]):-
        N < 4, M is N - 1, task30(M, Right),!.
task30(4, ['IV']).
task30(5, ['V']).
task30(N, ['V'|Right]):-
        N < 9, M is N - 5, task30(M, Right),!.
task30(9, ['IX']).
task30(N, ['X'|Right]):-
        N < 40, M is N - 10, task30(M, Right),!.
task30(N, ['XL'|Right]):-
        N < 50, M is N - 40, task30(M, Right),!.


/* 4. Напишіть предикат, що здійснює циклічний зсув елементів списку на один вправо. */

task4([],[]).
task4([Head | []], [Head | []]).
task4([Head | Tail],R):-
        cutLast([Head | Tail], T0),
        last(Tail, H0),
        R = [H0 | T0],!.

cutLast([Head | []], []).
cutLast([Head | Tail], R):-
        cutLast(Tail, R0),
        R = [Head | R0],!.

/* 5. Напишіть предикат, що реалізує множення матриці (список списків) на вектор. */
/*
Рядок матриці — список
Матриця — список рядків
Вектор — список

|2  -3|  *  |2| = |-5|
|4   7|     |3| = |29|

task5([[2,-3],[4,7]],[2,3],Res).

Res = [-5,29]

*/

task5(Matrix,Vector,Res):- task50(Matrix,Vector,Vector,Res),!.

task50([],_,_,[]).
task50([[MH | []] | MT],[VecH | []], VecT, [ResH | ResT]):-
        ResH is MH * VecH,
        task50(MT, VecT, VecT, ResT),!.
task50([[MH | MT] | MT1], [VecH | VecT], VecT1, [Z | ZT]):-
        task50([MT | MT1], VecT, VecT1, [Z1 | ZT]),
        Z is VecH * MH + Z1,!.
