fill(-1):-!.
fill(X):-asserta(d(X)), X1 is X-1, fill(X1).

/* У тризначному числi, всi цифри якого непаpнi, 
закpеслили середню цифру. Виявилось, що отpимане 
двозначне число є дiльником вихiдного числа. 
Знайдiть всi такi тризначнi числа. */

task1(X):-d(A), A mod 2 > 0,
        d(B), B mod 2 > 0,
        d(C), C mod 2 > 0,
        0 is (A*100 + B*10 + C) mod (A*10 + C),
        X is A*100 + B*10 + C.

/*Знайдiть чотиризначне число, яке є точним квадратом, 
у якого двi першi цифри однаковi та двi останнi 
також однаковi.*/
/* Відповідь: 7744 */

task2(X):-d(A), d(B),
        A > 0,
        N is A*1000 + A*100 + B*10 + B,
        S is sqrt(N),
        R is round(S),
        S =:= R,
        X is N,!.

/* Скiльки iснує цiлих чисел вiд 1 до 1998, 
якi не дiляться на жодне з чисел 6, 10, 15? */
/* Відповідь: 1465 */

task3(X):-task30(1,0,X),!.

task30(X,C,R):-
      (
        X =:= 1998
      ->
        R is C
      ;
        (
          0 =\= X mod 6,
          0 =\= X mod 10,
          0 =\= X mod 15
        ->
          task30(X+1,C+1,R)
        ;
          task30(X+1,C,R)
        )
      ),!.

/* Знайти найменше натуральне число M, яке має наступну 
властивiсть: сума квадратiв одинадцяти послiдовних натуральних 
чисел, починаючи з M, є точним квадратом? */
/* Відповідь: 6 */

task4(X):-task40(1,X),!.

/* послідовна перевірка всіх натуральних чисел на виконання умови */
task40(X,Y):-
          task41(X,B),
        (
          B =:= 1
        ->
          Y is X
        ;
          task40(X+1,Y)
        ),!.
/* сума квадратiв одинадцяти послiдовних натуральних 
чисел, починаючи з M, є точним квадратом */
task41(X,B):-
        S is sqrt(X+X+1+X+2+X+3+X+4+X+5+X+6+X+7+X+8+X+9+X+10),
        R is round(S),
        (
          S =:= R
        ->
          B is 1
        ;
          B is 0
        ),!.

/* В послiдовностi 1998737... кождна цифра, починаючи з п'ятої, 
дорiвнює останнiй цифрi суми чотирьох попеpеднiх цифр. 
Через скiльки цифр знову зустрiнитья початкова комбiнацiя 1998 
(тобто скiльки цифр в перiодi)? */
/* Відповідь: 1560 */

task5(X):-task50(8,7,3,7,3,X),!.

break(X,Y,Z):-Y is X div 10, Z is X mod 10.

task50(1,9,9,8,C,R):-R is C,!.
task50(A0,A1,A2,A3,C,R):-
        break(A0+A1+A2+A3,_,A4),
        task50(A1,A2,A3,A4,C+1,R),!.

run:-
    fill(9),
    nl, nl, write('TASK 1'), nl,
    findall(N, task1(N), B), write(B), nl, nl,
    write('TASK 2'), nl,
    task2(N2), write(N2), nl, nl,
    write('TASK 3'), nl,
    task3(N3), write(N3), nl, nl,
    write('TASK 4'), nl,
    task4(N4), write(N4), nl, nl,
    write('TASK 5'), nl,
    task5(N5), write(N5), nl, nl.

:-initialization(run).
