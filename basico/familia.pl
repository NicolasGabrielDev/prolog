
pai(jose, joao).
pai(joao, maria).
pai(joao, pedro).
pai(pedro, felipe).

avo(X, Y) :-
    pai(X, C),
    pai(C, Y).

bisavo(X, Y) :-
    avo(X, C),
    pai(C, Y).
