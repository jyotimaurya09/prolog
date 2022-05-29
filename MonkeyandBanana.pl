/* Author: Jyoti Maurya
   Course: MCS-109 AI based Programming Tools
   University: Indira Gandhi Delhi Technical University for Women
   Date: 13  September, 2021
   Language: Prolog
   Compiler: GNU Prolog (http://www.gprolog.org/)
   Environment: Windows 10
   Source Filename: MonkeyandBanana.pl
*/

move(state(middle,onbox,middle,hasnot),
   grasp,
   state(middle,onbox,middle,has)).
move(state(P,onfloor,P,H),
   climb,
   state(P,onbox,P,H)).
move(state(P1,onfloor,P1,H),
   drag(P1,P2),
   state(P2,onfloor,P2,H)).
move(state(P1,onfloor,B,H),
   walk(P1,P2),
   state(P2,onfloor,B,H)).
canget(state(_,_,_,has)).
canget(State1) :-
   move(State1,_,State2),
   canget(State2).
