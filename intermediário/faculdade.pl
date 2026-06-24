% =====================================================
% EXEMPLO INTERMEDIÁRIO EM PROLOG
% CONTEXTO: FACULDADE
% =====================================================

% =========================
% FATOS
% =========================

% Instituição
instituicao(cefet).

% Cursos
curso(sistemas_informacao, cefet).
curso(engenharia_civil, cefet).

% Diretores
diretor(marcos, cefet).

% Coordenadores
coordenador(ana, sistemas_informacao).
coordenador(ricardo, engenharia_civil).

% Professores
professor(carlos).
professor(beatriz).
professor(fernando).
professor(juliana).

% Matérias
materia(logica).
materia(banco_dados).
materia(programacao).
materia(calculo).

% Professor leciona uma matéria em um curso
leciona(carlos, logica, sistemas_informacao).
leciona(beatriz, banco_dados, sistemas_informacao).
leciona(fernando, programacao, sistemas_informacao).
leciona(juliana, calculo, engenharia_civil).

% Alunos
aluno(nicolas).
aluno(maria).
aluno(joao).
aluno(lucas).

% Aluno matriculado em matéria
matriculado(nicolas, logica).
matriculado(nicolas, banco_dados).

matriculado(maria, logica).
matriculado(maria, programacao).

matriculado(joao, banco_dados).
matriculado(joao, programacao).

matriculado(lucas, calculo).

% =========================
% REGRAS DE INFERÊNCIA
% =========================

% Descobre o curso de um aluno pela matéria em que ele está matriculado.
curso_do_aluno(Aluno, Curso) :-
    matriculado(Aluno, Materia),
    leciona(_, Materia, Curso).

% Descobre se um professor dá aula para um aluno.
professor_do_aluno(Professor, Aluno) :-
    leciona(Professor, Materia, _),
    matriculado(Aluno, Materia).

% Descobre o coordenador responsável por um aluno.
coordenador_do_aluno(Coordenador, Aluno) :-
    curso_do_aluno(Aluno, Curso),
    coordenador(Coordenador, Curso).

% Descobre o diretor responsável por um aluno.
diretor_do_aluno(Diretor, Aluno) :-
    curso_do_aluno(Aluno, Curso),
    curso(Curso, Instituicao),
    diretor(Diretor, Instituicao).

% Dois alunos são colegas se fazem a mesma matéria.
colega_de_materia(Aluno1, Aluno2) :-
    matriculado(Aluno1, Materia),
    matriculado(Aluno2, Materia),
    Aluno1 \= Aluno2.

% Duas matérias são do mesmo curso.
materias_do_mesmo_curso(Materia1, Materia2) :-
    leciona(_, Materia1, Curso),
    leciona(_, Materia2, Curso),
    Materia1 \= Materia2.
