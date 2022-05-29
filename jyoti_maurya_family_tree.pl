
/* Author: Jyoti Maurya
   Course: MCS-109 AI based Programming Tools
   University: Indira Gandhi Delhi Technical University for Women
   Date: 6 September, 2021
   Language: Prolog
   Compiler: GNU Prolog (http://www.gprolog.org/)
   Environment: Windows 10
   Source Filename: jyoti_maurya_family_tree.pl
*/

male(shyam).
male(rampati).
male(yash).
male(uday).
male(awadhesh).
male(laxman).
male(rajesh).
male(arvind).
male(praveen).
male(shivam).
male(sahil).

female(devi).
female(sudha).
female(laxmi).
female(tarawati).
female(anjali).
female(jyoti).
female(mansi).
female(sanvi).


/* SYNTAX: husband(husband_name, wife_name) */
husband(shyam, devi).
husband(rampati, sudha).
husband(yash, laxmi).
husband(uday, tarawati).


/* SYNTAX: wife(wife_name, husband_name) */
wife(devi, shyam).
wife(sudha, rampati).
wife(laxmi, yash).
wife(tarawati, uday).


/* SYNTAX: are_married(husband, wife) */
are_married(X,Y) :-
    female(Y),
    male(X),
    husband(X,Y),
    format('~w (husband) and ~w (wife) are married',[X, Y]).

/* SYNTAX: are_married(wife, husband) */
are_married(X,Y) :-
    female(X),
    male(Y),
    wife(X,Y),
    format('~w (husband) and ~w (wife) are married',[Y, X]).

/* SYNTAX: parent(parent_name, child_name) */
parent(uday, praveen).
parent(uday, jyoti).
parent(tarawati, praveen).
parent(tarawati, jyoti).

parent(yash, arvind).
parent(yash, anjali).
parent(laxmi, arvind).
parent(laxmi, anjali).

parent(shyam, yash).
parent(shyam, uday).
parent(devi, yash).
parent(devi, uday).

parent(rampati, tarawati).
parent(rampati, awadhesh).
parent(rampati, laxman).
parent(rampati, rajesh).
parent(sudha, tarawati).
parent(sudha, awadhesh).
parent(sudha, laxman).
parent(sudha, rajesh).

parent(awadhesh, shivam).
parent(awadhesh, sahil).
parent(laxman, mansi).
parent(rajesh, sanvi).


/* SYNTAX: is_mother_of(mother, child) */
is_mother_of(X,Y) :-
    parent(X,Y),
    female(X),
    format('~w is mother of ~w', [X, Y]).


/* SYNTAX: is_father_of(father, child) */
is_father_of(X,Y) :-
    parent(X,Y),
    male(X),
    format('~w is father of ~w', [X, Y]).



/* SYNTAX: is_grandparent_of(grandparent, grandchild) */
is_grandparent_of(X, Y) :-
    parent(X,Z),
    parent(Z,Y),
    format('~w is grandparent of ~w', [X, Y]).

/* SYNTAX: is_grandmother_of(grandmother, grandchild) */
is_grandmother_of(X,Y) :-
    parent(X,Z),
    parent(Z,Y),
    female(X),
    format('~w is grandmother of ~w', [X, Y]).

/* SYNTAX: is_grandfather_of(grandfather, grandchild) */
is_grandfather_of(X,Y) :-
    parent(X,Z),
    parent(Z,Y),
    male(X).
/*    format('~w is grandfather of ~w', [X, Y]).*/

/* SYNTAX: are_siblings(sibling_1, sibling_2) */
are_siblings(X,Y) :-
    parent(Z,X),
    parent(Z,Y),
    male(Z),
    X\==Y,
    format('~w and ~w are siblings', [X, Y]).

/* SYNTAX: are_cousins(cousin_1, cousin_2) */
are_cousins(X,Y) :-
    is_grandfather_of(Z,X),
    is_grandfather_of(Z,Y),
    X\==Y,
    format('~w and ~w are cousins', [X, Y]).

/* SYNTAX: are_sisters(sister_1, sister_2) */
are_sisters(X,Y) :-
    parent(Z,X),
    parent(Z,Y),
    female(X),
    female(Y),
    X\==Y,
    format('~w and ~w are sisters', [X,Y]).

/* SYNTAX: are_brothers(brother_1, brother_2) */
are_brothers(X,Y) :-
    parent(Z,X),
    parent(Z,Y),
    male(Z),
    male(X),
    male(Y),
    X\==Y,
    format('~w and ~w are brothers', [X,Y]).

/* SYNTAX: has_sister(brother_or_sister, sister) */
has_sister(X, Y) :-
    parent(Z,X),
    parent(Z,Y),
    male(Z),
    female(Y),
    X\==Y,
    format('~w is sister of ~w  ', [Y,X]).

/* SYNTAX: has_brother(brother_or_sister, brother) */
has_brother(X, Y) :-
    parent(Z,X),
    parent(Z,Y),
    male(Z),
    male(Y),
    X\==Y,
    format('~w is brother of ~w  ', [Y,X]).
