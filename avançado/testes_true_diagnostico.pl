:- begin_tests(diagnostico_true).

:- [diagnostico].

% =========================
% Testes de sintomas e hipoteses
% =========================

test(sintoma_pc_nao_liga) :-
    sintoma(caso_pc_nao_liga, nao_liga).

test(sintoma_pc_lento) :-
    sintoma(caso_pc_lento, uso_memoria_alto).

test(hipotese_fonte_queimada) :-
    hipotese(fonte_queimada, [nao_liga, sem_led, sem_ventoinha]).

% =========================
% Testes de diagnostico direto
% =========================

test(diagnostico_fonte_queimada) :-
    diagnostico(caso_pc_nao_liga, fonte_queimada).

test(diagnostico_botao_power) :-
    diagnostico(caso_pc_nao_liga, botao_power_defeituoso).

test(diagnostico_placa_mae) :-
    diagnostico(caso_pc_nao_liga, placa_mae_com_defeito).

test(diagnostico_pouca_memoria) :-
    diagnostico(caso_pc_lento, pouca_memoria).

test(diagnostico_disco_cheio) :-
    diagnostico(caso_pc_lento, disco_cheio).

test(diagnostico_inicializacao_sobrecarregada) :-
    diagnostico(caso_pc_lento, inicializacao_sobrecarregada).

test(diagnostico_wifi_desativado) :-
    diagnostico(caso_sem_internet, wifi_desativado).

test(diagnostico_cabo_rede) :-
    diagnostico(caso_sem_internet, cabo_rede_defeituoso).

test(diagnostico_dns) :-
    diagnostico(caso_sem_internet, dns_incorreto).

test(diagnostico_memoria_ram) :-
    diagnostico(caso_sem_video, memoria_ram_mal_encaixada).

test(diagnostico_cabo_video) :-
    diagnostico(caso_sem_video, cabo_video_defeituoso).

test(diagnostico_placa_video) :-
    diagnostico(caso_sem_video, placa_video_defeituosa).

test(diagnostico_excesso_poeira) :-
    diagnostico(caso_superaquecendo, excesso_poeira).

test(diagnostico_cooler) :-
    diagnostico(caso_superaquecendo, cooler_defeituoso).

test(diagnostico_pasta_termica) :-
    diagnostico(caso_superaquecendo, pasta_termica_ressecada).

% =========================
% Testes de listas com findall/sort
% =========================

test(lista_diagnosticos_pc_nao_liga) :-
    diagnosticos(caso_pc_nao_liga, Lista),
    Lista == [botao_power_defeituoso, fonte_queimada, placa_mae_com_defeito].

test(lista_diagnosticos_pc_lento) :-
    diagnosticos(caso_pc_lento, Lista),
    Lista == [disco_cheio, inicializacao_sobrecarregada, pouca_memoria].

test(lista_diagnosticos_sem_internet) :-
    diagnosticos(caso_sem_internet, Lista),
    Lista == [cabo_rede_defeituoso, dns_incorreto, wifi_desativado].

test(lista_diagnosticos_sem_video) :-
    diagnosticos(caso_sem_video, Lista),
    Lista == [cabo_video_defeituoso, memoria_ram_mal_encaixada, placa_video_defeituosa].

test(lista_diagnosticos_superaquecendo) :-
    diagnosticos(caso_superaquecendo, Lista),
    Lista == [cooler_defeituoso, excesso_poeira, pasta_termica_ressecada].

% =========================
% Testes de contagem
% =========================

test(total_pc_nao_liga) :-
    total_diagnosticos(caso_pc_nao_liga, 3).

test(total_pc_lento) :-
    total_diagnosticos(caso_pc_lento, 3).

test(total_sem_video) :-
    total_diagnosticos(caso_sem_video, 3).

% =========================
% Testes de gravidade e acao
% =========================

test(caso_pc_nao_liga_e_critico) :-
    caso_critico(caso_pc_nao_liga).

test(caso_sem_video_e_critico) :-
    caso_critico(caso_sem_video).

test(precisa_tecnico_pc_nao_liga) :-
    precisa_tecnico(caso_pc_nao_liga).

test(diagnostico_completo_fonte) :-
    diagnostico_completo(
        caso_pc_nao_liga,
        fonte_queimada,
        alta,
        verificar_ou_trocar_fonte
    ).

test(diagnostico_completo_dns) :-
    diagnostico_completo(
        caso_sem_internet,
        dns_incorreto,
        baixa,
        alterar_dns
    ).

% =========================
% Teste de descarte por incompatibilidade
% =========================

test(fonte_descartada_se_pc_liga) :-
    descartada(caso_sem_video, fonte_queimada).

:- end_tests(diagnostico_true).
