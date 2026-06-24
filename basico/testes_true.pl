:- begin_tests(familia_true).

:- [familia].

% =========================
% Testes de fatos diretos
% =========================

test(pai_jose_joao) :-
    pai(jose, joao).

test(pai_joao_maria) :-
    pai(joao, maria).

test(pai_joao_pedro) :-
    pai(joao, pedro).

test(pai_pedro_felipe) :-
    pai(pedro, felipe).

% =========================
% Testes de avô
% =========================

test(avo_jose_maria) :-
    avo(jose, maria).

test(avo_jose_pedro) :-
    avo(jose, pedro).

test(avo_joao_felipe) :-
    avo(joao, felipe).

% =========================
% Teste de bisavô
% =========================

test(bisavo_jose_felipe) :-
    bisavo(jose, felipe).

% =========================
% Testes conferindo todas as respostas verdadeiras
% =========================

test(todos_os_pais) :-
    setof((X, Y), pai(X, Y), Resultado),
    Resultado == [
        (joao, maria),
        (joao, pedro),
        (jose, joao),
        (pedro, felipe)
    ].

test(todos_os_avos) :-
    setof((X, Y), avo(X, Y), Resultado),
    Resultado == [
        (joao, felipe),
        (jose, maria),
        (jose, pedro)
    ].

test(todos_os_bisavos) :-
    setof((X, Y), bisavo(X, Y), Resultado),
    Resultado == [
        (jose, felipe)
    ].

:- end_tests(familia_true).
