:- begin_tests(faculdade_false).

:- [faculdade].

% =========================
% Testes de fatos falsos
% =========================

test(engenharia_civil_nao_e_outro_cefet, [fail]) :-
    curso(engenharia_civil, outra_instituicao).

test(marcos_nao_coordena_sistemas, [fail]) :-
    coordenador(marcos, sistemas_informacao).

test(ana_nao_coordena_engenharia_civil, [fail]) :-
    coordenador(ana, engenharia_civil).

test(carlos_nao_leciona_calculo, [fail]) :-
    leciona(carlos, calculo, engenharia_civil).

test(lucas_nao_matriculado_logica, [fail]) :-
    matriculado(lucas, logica).

% =========================
% Testes de inferências falsas
% =========================

test(lucas_nao_e_de_sistemas, [fail]) :-
    curso_do_aluno(lucas, sistemas_informacao).

test(nicolas_nao_e_de_engenharia_civil, [fail]) :-
    curso_do_aluno(nicolas, engenharia_civil).

test(juliana_nao_e_professora_do_nicolas, [fail]) :-
    professor_do_aluno(juliana, nicolas).

test(carlos_nao_e_professor_do_lucas, [fail]) :-
    professor_do_aluno(carlos, lucas).

test(ricardo_nao_coordena_nicolas, [fail]) :-
    coordenador_do_aluno(ricardo, nicolas).

test(ana_nao_coordena_lucas, [fail]) :-
    coordenador_do_aluno(ana, lucas).

test(nicolas_nao_e_colega_do_lucas, [fail]) :-
    colega_de_materia(nicolas, lucas).

test(maria_nao_e_colega_do_lucas, [fail]) :-
    colega_de_materia(maria, lucas).

test(logica_e_calculo_nao_sao_mesmo_curso, [fail]) :-
    materias_do_mesmo_curso(logica, calculo).

test(banco_dados_e_calculo_nao_sao_mesmo_curso, [fail]) :-
    materias_do_mesmo_curso(banco_dados, calculo).

:- end_tests(faculdade_false).
