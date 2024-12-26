:- use_module(library(lists)).
% males
male(charles).
male(princewilliam).
male(princegeorge).
male(princelouis).
male(archieharrison).
male(princeharry).
% females
female(diana).
female(camila).
female(catherine).
female(meghan).
female(princesscharlotte).
%spouse
spouse(charles,diana).
spouse(diana,charles).
spouse(camila,charles).
spouse(charles,camila).
spouse(catherine,princewilliam).
spouse(princewilliam,catherine).
spouse(princeharry,meghan).
spouse(meghan,princeharry).
%parent(X,Y): X is a parent of Y
parent(charles,princewilliam).
parent(charles,princeharry).
parent(diana,princewilliam).
parent(diana,princeharry).
parent(catherine,princegeorge).
parent(catherine,princesscharlotte).
parent(catherine,princelouis).
parent(princewilliam,princegeorge).
parent(princewilliam,princesscharlotte).
parent(princewilliam,princelouis).
parent(meghan,archieharrison).
parent(princeharry,archieharrison).

% constants are lowercase: charles, diana, ...
mother(X,Y) :- parent(X,Y),female(X).
father(X,Y) :- parent(X,Y),male(X).
brother(X,Y) :- male(X),parent(Z,X),parent(Z, Y),X \== Y.
sister(X,Y) :- female(X),parent(Z,X),parent(Z, Y),X \== Y.
sibling(X,Y) :- brother(X,Y); sister(X,Y).
nephew(X,Y) :- male(X), parent(Z, X), sibling(Z, Y); male(X), parent(Z, X), sibling(Z, A), spouse(A,Y).
niece(X, Y) :- female(X), parent(Z, X), sibling(Z, Y); female(X), parent(Z, X), sibling(Z, A), spouse(A,Y).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
stepmother(X, Y) :- female(X), spouse(X, Z),parent(Z, Y), \+ parent(X, Y) .
cousin(X, Y) :- parent(Z, X),sibling(Z, W), parent(W, Y).
uncle(X, Y) :- male(X),(niece(Y,X);nephew(Y,X)).
aunt(X, Y) :- female(X),(niece(Y,X);nephew(Y,X)).