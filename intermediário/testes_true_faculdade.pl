:- begin_tests(faculdade_true).

:- [faculdade].

% =========================
% Testes de fatos diretos
% =========================

test(existe_instituicao) :-
    instituicao(cefet).

test(existe_curso_sistemas) :-
    curso(sistemas_informacao, cefet).

test(existe_curso_engenharia_civil) :-
    curso(engenharia_civil, cefet).

test(diretor_do_cefet) :-
    diretor(marcos, cefet).

test(coordenadora_sistemas) :-
    coordenador(ana, sistemas_informacao).

test(coordenador_engenharia_civil) :-
    coordenador(ricardo, engenharia_civil).

test(carlos_leciona_logica) :-
    leciona(carlos, logica, sistemas_informacao).

test(juliana_leciona_calculo) :-
    leciona(juliana, calculo, engenharia_civil).

test(nicolas_matriculado_logica) :-
    matriculado(nicolas, logica).

test(lucas_matriculado_calculo) :-
    matriculado(lucas, calculo).

% =========================
% Testes de inferência
% =========================

test(curso_do_nicolas) :-
    once(curso_do_aluno(nicolas, sistemas_informacao)).

test(curso_do_lucas) :-
    once(curso_do_aluno(lucas, engenharia_civil)).

test(carlos_professor_do_nicolas) :-
    once(professor_do_aluno(carlos, nicolas)).

test(beatriz_professora_do_nicolas) :-
    once(professor_do_aluno(beatriz, nicolas)).

test(fernando_professor_da_maria) :-
    once(professor_do_aluno(fernando, maria)).

test(juliana_professora_do_lucas) :-
    once(professor_do_aluno(juliana, lucas)).

test(ana_coordenadora_do_nicolas) :-
    once(coordenador_do_aluno(ana, nicolas)).

test(ricardo_coordenador_do_lucas) :-
    once(coordenador_do_aluno(ricardo, lucas)).

test(marcos_diretor_do_nicolas) :-
    once(diretor_do_aluno(marcos, nicolas)).

test(marcos_diretor_do_lucas) :-
    once(diretor_do_aluno(marcos, lucas)).

test(nicolas_colega_da_maria) :-
    once(colega_de_materia(nicolas, maria)).

test(nicolas_colega_do_joao) :-
    once(colega_de_materia(nicolas, joao)).

test(maria_colega_do_joao) :-
    once(colega_de_materia(maria, joao)).

test(logica_e_banco_dados_mesmo_curso) :-
    once(materias_do_mesmo_curso(logica, banco_dados)).

test(logica_e_programacao_mesmo_curso) :-
    once(materias_do_mesmo_curso(logica, programacao)).

% =========================
% Testes com listas de respostas
% =========================

test(professores_do_nicolas) :-
    setof(Professor, professor_do_aluno(Professor, nicolas), Resultado),
    Resultado == [beatriz, carlos].

test(colegas_do_nicolas) :-
    setof(Colega, colega_de_materia(nicolas, Colega), Resultado),
    Resultado == [joao, maria].

test(materias_de_sistemas_informacao) :-
    setof(Materia, Professor^leciona(Professor, Materia, sistemas_informacao), Resultado),
    Resultado == [banco_dados, logica, programacao].

:- end_tests(faculdade_true).
