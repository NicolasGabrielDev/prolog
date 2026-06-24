:- begin_tests(diagnostico_false).

:- [diagnostico].

% =========================
% Testes de diagnosticos falsos
% =========================

test(pc_lento_nao_e_fonte_queimada, [fail]) :-
    diagnostico(caso_pc_lento, fonte_queimada).

test(pc_nao_liga_nao_e_disco_cheio, [fail]) :-
    diagnostico(caso_pc_nao_liga, disco_cheio).

test(sem_internet_nao_e_memoria_ram, [fail]) :-
    diagnostico(caso_sem_internet, memoria_ram_mal_encaixada).

test(superaquecendo_nao_e_dns, [fail]) :-
    diagnostico(caso_superaquecendo, dns_incorreto).

test(sem_video_nao_e_wifi_desativado, [fail]) :-
    diagnostico(caso_sem_video, wifi_desativado).

test(sem_video_nao_e_fonte_queimada, [fail]) :-
    diagnostico(caso_sem_video, fonte_queimada).

% =========================
% Testes de coordenacao das regras
% =========================

test(caso_pc_lento_nao_e_critico, [fail]) :-
    caso_critico(caso_pc_lento).

test(caso_sem_internet_nao_precisa_tecnico, [fail]) :-
    precisa_tecnico(caso_sem_internet).

test(caso_superaquecendo_nao_e_critico, [fail]) :-
    caso_critico(caso_superaquecendo).

test(caso_inexistente_nao_tem_diagnosticos, [fail]) :-
    diagnosticos(caso_inexistente, _).

test(total_incorreto_pc_nao_liga, [fail]) :-
    total_diagnosticos(caso_pc_nao_liga, 1).

test(lista_errada_pc_lento, [fail]) :-
    diagnosticos(caso_pc_lento, [fonte_queimada]).

test(acao_errada_para_dns, [fail]) :-
    diagnostico_completo(
        caso_sem_internet,
        dns_incorreto,
        alta,
        trocar_placa_mae
    ).

% =========================
% Testes de fatos falsos
% =========================

test(sintoma_falso_pc_nao_liga, [fail]) :-
    sintoma(caso_pc_nao_liga, uso_memoria_alto).

test(hipotese_inexistente, [fail]) :-
    hipotese(virus, [lento]).

:- end_tests(diagnostico_false).
