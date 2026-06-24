% =====================================================
% EXEMPLO AVANCADO EM PROLOG
% CONTEXTO: DIAGNOSTICO TECNICO DE COMPUTADOR
% =====================================================
%
% Objetivo:
% A partir de sintomas observados em diferentes casos,
% o Prolog infere possiveis causas tecnicas.
%
% Conceitos usados:
% - backtracking
% - multiplas solucoes
% - listas
% - recursao
% - findall
% - sort
% - length
% - negacao por falha com \+
% - regras encadeadas

% =========================
% CASOS ANALISADOS
% =========================

caso(caso_pc_nao_liga).
caso(caso_pc_lento).
caso(caso_sem_internet).
caso(caso_sem_video).
caso(caso_superaquecendo).

% =========================
% SINTOMAS OBSERVADOS
% =========================

% Caso 1: computador nao liga
sintoma(caso_pc_nao_liga, nao_liga).
sintoma(caso_pc_nao_liga, sem_led).
sintoma(caso_pc_nao_liga, sem_ventoinha).
sintoma(caso_pc_nao_liga, tomada_funciona).
sintoma(caso_pc_nao_liga, cabo_energia_conectado).

% Caso 2: computador lento
sintoma(caso_pc_lento, lento).
sintoma(caso_pc_lento, travamentos).
sintoma(caso_pc_lento, uso_memoria_alto).
sintoma(caso_pc_lento, disco_cheio).
sintoma(caso_pc_lento, muitos_programas_iniciando).

% Caso 3: sem internet
sintoma(caso_sem_internet, sem_internet).
sintoma(caso_sem_internet, wifi_desativado).
sintoma(caso_sem_internet, cabo_rede_conectado).
sintoma(caso_sem_internet, led_rede_apagado).
sintoma(caso_sem_internet, navegador_nao_abre_sites).
sintoma(caso_sem_internet, ping_por_ip_funciona).

% Caso 4: computador liga, mas nao da video
sintoma(caso_sem_video, liga).
sintoma(caso_sem_video, sem_video).
sintoma(caso_sem_video, monitor_ligado).
sintoma(caso_sem_video, cabo_video_conectado).
sintoma(caso_sem_video, bipes_memoria).
sintoma(caso_sem_video, cooler_gpu_parado).

% Caso 5: computador superaquecendo
sintoma(caso_superaquecendo, temperatura_alta).
sintoma(caso_superaquecendo, desligando_sozinho).
sintoma(caso_superaquecendo, cooler_fazendo_barulho).
sintoma(caso_superaquecendo, poeira).

% =========================
% HIPOTESES DE CAUSAS
% =========================
% hipotese(Causa, ListaDeSintomasNecessarios).

hipotese(fonte_queimada, [nao_liga, sem_led, sem_ventoinha]).
hipotese(botao_power_defeituoso, [nao_liga, tomada_funciona, cabo_energia_conectado]).
hipotese(placa_mae_com_defeito, [nao_liga, sem_led]).

hipotese(pouca_memoria, [lento, travamentos, uso_memoria_alto]).
hipotese(disco_cheio, [lento, disco_cheio]).
hipotese(inicializacao_sobrecarregada, [lento, muitos_programas_iniciando]).

hipotese(wifi_desativado, [sem_internet, wifi_desativado]).
hipotese(cabo_rede_defeituoso, [sem_internet, cabo_rede_conectado, led_rede_apagado]).
hipotese(dns_incorreto, [sem_internet, navegador_nao_abre_sites, ping_por_ip_funciona]).

hipotese(memoria_ram_mal_encaixada, [liga, sem_video, bipes_memoria]).
hipotese(cabo_video_defeituoso, [sem_video, monitor_ligado, cabo_video_conectado]).
hipotese(placa_video_defeituosa, [liga, sem_video, cooler_gpu_parado]).

hipotese(excesso_poeira, [temperatura_alta, poeira]).
hipotese(cooler_defeituoso, [temperatura_alta, cooler_fazendo_barulho]).
hipotese(pasta_termica_ressecada, [temperatura_alta, desligando_sozinho]).

% =========================
% INCOMPATIBILIDADES
% =========================
% Algumas causas sao descartadas se um sintoma contraditorio aparece.

incompatibilidade(fonte_queimada, liga).
incompatibilidade(cabo_rede_defeituoso, conexao_por_cabo_funciona).
incompatibilidade(wifi_desativado, internet_funciona_no_wifi).
incompatibilidade(cabo_video_defeituoso, video_funciona_em_outro_monitor).

% =========================
% GRAVIDADE DAS CAUSAS
% =========================

gravidade(fonte_queimada, alta).
gravidade(placa_mae_com_defeito, alta).
gravidade(placa_video_defeituosa, alta).
gravidade(memoria_ram_mal_encaixada, media).
gravidade(cooler_defeituoso, media).
gravidade(pasta_termica_ressecada, media).
gravidade(cabo_rede_defeituoso, baixa).
gravidade(cabo_video_defeituoso, baixa).
gravidade(botao_power_defeituoso, media).
gravidade(pouca_memoria, media).
gravidade(disco_cheio, baixa).
gravidade(inicializacao_sobrecarregada, baixa).
gravidade(wifi_desativado, baixa).
gravidade(dns_incorreto, baixa).
gravidade(excesso_poeira, baixa).

% =========================
% ACOES RECOMENDADAS
% =========================

acao_recomendada(fonte_queimada, verificar_ou_trocar_fonte).
acao_recomendada(placa_mae_com_defeito, levar_para_assistencia).
acao_recomendada(placa_video_defeituosa, testar_placa_de_video).
acao_recomendada(memoria_ram_mal_encaixada, remover_limpar_e_reencaixar_memoria).
acao_recomendada(cooler_defeituoso, verificar_cooler).
acao_recomendada(pasta_termica_ressecada, trocar_pasta_termica).
acao_recomendada(cabo_rede_defeituoso, testar_outro_cabo_de_rede).
acao_recomendada(cabo_video_defeituoso, testar_outro_cabo_de_video).
acao_recomendada(botao_power_defeituoso, testar_botao_power).
acao_recomendada(pouca_memoria, fechar_programas_ou_aumentar_ram).
acao_recomendada(disco_cheio, liberar_espaco_em_disco).
acao_recomendada(inicializacao_sobrecarregada, desativar_programas_da_inicializacao).
acao_recomendada(wifi_desativado, ativar_wifi).
acao_recomendada(dns_incorreto, alterar_dns).
acao_recomendada(excesso_poeira, limpar_computador).

% =====================================================
% REGRAS AVANCADAS
% =====================================================

% Verifica recursivamente se todos os sintomas de uma lista
% aparecem em um caso.
possui_sintomas(_, []).

possui_sintomas(Caso, [Sintoma | Resto]) :-
    sintoma(Caso, Sintoma),
    possui_sintomas(Caso, Resto).

% Uma causa e descartada se existe uma incompatibilidade
% entre a causa e algum sintoma observado no caso.
descartada(Caso, Causa) :-
    incompatibilidade(Causa, SintomaContraditorio),
    sintoma(Caso, SintomaContraditorio).

% Diagnostico principal.
% Usa backtracking para encontrar varias causas possiveis.
diagnostico(Caso, Causa) :-
    caso(Caso),
    hipotese(Causa, SintomasNecessarios),
    possui_sintomas(Caso, SintomasNecessarios),
    \+ descartada(Caso, Causa).

% Diagnostico completo com causa, gravidade e acao recomendada.
diagnostico_completo(Caso, Causa, Gravidade, Acao) :-
    diagnostico(Caso, Causa),
    gravidade(Causa, Gravidade),
    acao_recomendada(Causa, Acao).

% Retorna todas as causas possiveis de um caso em uma lista ordenada.
diagnosticos(Caso, Lista) :-
    caso(Caso),
    findall(Causa, diagnostico(Caso, Causa), Causas),
    sort(Causas, Lista).

% Conta quantos diagnosticos possiveis existem para um caso.
total_diagnosticos(Caso, Total) :-
    diagnosticos(Caso, Lista),
    length(Lista, Total).

% Um caso e critico se existe pelo menos uma causa de gravidade alta.
caso_critico(Caso) :-
    diagnostico(Caso, Causa),
    gravidade(Causa, alta).

% Um caso precisa de tecnico se alguma causa possivel possui gravidade alta.
precisa_tecnico(Caso) :-
    caso_critico(Caso).
