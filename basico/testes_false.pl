:- begin_tests(familia_false).

:- [familia].

% =========================
% Testes que devem dar false
% =========================

test(jose_nao_e_pai_de_maria, [fail]) :-
    pai(jose, maria).

test(jose_nao_e_pai_de_pedro, [fail]) :-
    pai(jose, pedro).

test(joao_nao_e_pai_de_felipe, [fail]) :-
    pai(joao, felipe).

test(maria_nao_e_pai_de_felipe, [fail]) :-
    pai(maria, felipe).

test(pedro_nao_e_pai_de_joao, [fail]) :-
    pai(pedro, joao).

test(pedro_nao_e_avo_de_maria, [fail]) :-
    avo(pedro, maria).

test(jose_nao_e_avo_de_felipe, [fail]) :-
    avo(jose, felipe).

test(maria_nao_e_avo_de_felipe, [fail]) :-
    avo(maria, felipe).

test(joao_nao_e_bisavo_de_felipe, [fail]) :-
    bisavo(joao, felipe).

test(jose_nao_e_bisavo_de_maria, [fail]) :-
    bisavo(jose, maria).

test(pedro_nao_e_bisavo_de_felipe, [fail]) :-
    bisavo(pedro, felipe).

:- end_tests(familia_false).
