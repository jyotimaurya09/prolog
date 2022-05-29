/* Hanoi Tower */

/* Author: Jyoti Maurya
   Course: MCS-109 AI based Programming Tools
   University: Indira Gandhi Delhi Technical University for Women
   Date: 13  September, 2021
   Language: Prolog
   Compiler: GNU Prolog (http://www.gprolog.org/)
   Environment: Windows 10
   Source Filename: Hanoi_Tower.pl
*/

move(1,X,Y,_) :-
   write('Move top disk from '), write(X), write(' to '), write(Y), nl.

move(N,X,Y,Z) :-
   N>1,
   M is N-1,
   move(M,X,Z,Y),
   move(1,X,Y,_),
   move(M,Z,Y,X).
