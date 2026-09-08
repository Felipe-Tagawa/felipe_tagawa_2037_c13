%% Limpeza

clc; 
clear all; 
close all;

%% 1.Identificação de um sistema de primeira ordem a partir de um ensaio

K = 1.8; % Degrau Unitário
T = 1.2; % Resposta de 1 ordem

G = tf(K, [T 1]);

p = pole(G);

% Utilizando as fórmulas passadas em sala de aula
tr = 2.2*T; % Tempo de Subida
ta = 4*T; % Tempo de Acomodação

info = stepinfo(G); % Conferir

ganho_permanente = dcgain(G);

% Resposta ao degrau unitário de 8s

t = 0:0.01:8;

figure
step(G, t), grid
title("Resposta ao degrau unitario")
xlabel("Tempo (s)")
ylabel("Amplitude")

Amp = 2.5;

valor_final = Amp * ganho_permanente;

figure
step(Amp*G, t), grid
title("Resposta ao degrau de amplitude 2.5")
xlabel("Tempo (s)")
ylabel("Amplitude")

% Exibição dos Resultados
fprintf('Resultados\n');
fprintf('Ganho (K): %.2f\n', K);
fprintf('Constante de Tempo (T): %.2f s\n', T);
fprintf('Polo do Sistema: %.4f\n', p);
fprintf('Tempo de Subida (tr): %.2f s\n', tr);
fprintf('Tempo de Acomodação (ta): %.2f s\n', ta);
fprintf('Ganho em Regime Permanente: %.2f\n', ganho_permanente);
fprintf('Valor Final (Degrau de 2.5): %.2f\n', valor_final);
fprintf('\nFunção de Transferência G(s):\n');
disp(G);


% Comentarios finais

% Posição do polo: O polo do sistema é dado por -1/T. Quanto maior a constante de tempo T, mais próximo da origem fica o polo; quanto menor o T, mais ele se afasta para a esquerda no eixo real.

% Velocidade da resposta: Polos mais distantes da origem geram uma resposta rápida. Polos mais próximos da origem tornam a resposta lenta e exigem mais tempo para estabilizar.

%% 2. Escolha entre três sistemas de segunda ordem

% Sistema A

G_A = tf(25, [1 3 25]);
poleA = pole(G_A);
wn_A = sqrt(25); 
zeta_A = 3 / (2* wn_A);
K_A = dcgain(G_A);

% Sistema B

G_B = tf(25, [1 10 25]);
poleB = pole(G_B);
wn_B = sqrt(25); 
zeta_B = 10 / (2* wn_B); 
K_B = dcgain(G_B);

% Sistema C

G_C = tf(25, [1 16 25]);
poleC = pole(G_C);
wn_C = sqrt(25); 
zeta_C = 16 / (2* wn_C); 
K_C = dcgain(G_C);

t = 0:0.01:8;

figure;
step(G_A, t, 'r', 'LineWidth', 1.5); hold on;
step(G_B, t, 'g', 'LineWidth', 1.5);
step(G_C, t, 'b', 'LineWidth', 1.5);
grid on;
title('Resposta ao Degrau Unitário');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Sistema A', 'Sistema B', 'Sistema C', 'Location', 'best');

% Posição dos polos
figure;
pzmap(G_A, 'r', G_B, 'g', G_C, 'b');
grid on;
title('Mapa de Polos e Zeros');
legend('Sistema A', 'Sistema B', 'Sistema C', 'Location', 'best');

fprintf('Sistema A\n');
fprintf('Polos:\n');
disp(poleA);
fprintf('Frequência Natural (wn): %.2f rad/s\n', wn_A);
fprintf('Coeficiente de Amortecimento (zeta): %.2f\n', zeta_A);
if zeta_A > 0 && zeta_A < 1
    fprintf('Tipo de Resposta: Subamortecido\n');
elseif zeta_A == 1
    fprintf('Tipo de Resposta: Criticamente Amortecido\n');
else
    fprintf('Tipo de Resposta: Superamortecido\n');
end
fprintf('Ganho em Regime Permanente (K): %.2f\n', K_A);
fprintf('Função de Transferência G_A(s):\n');
disp(G_A);

fprintf('Sistema B\n');
fprintf('Polos:\n');
disp(poleB);
fprintf('Frequência Natural (wn): %.2f rad/s\n', wn_B);
fprintf('Coeficiente de Amortecimento (zeta): %.2f\n', zeta_B);
if zeta_B > 0 && zeta_B < 1
    fprintf('Tipo de Resposta: Subamortecido\n');
elseif zeta_B == 1
    fprintf('Tipo de Resposta: Criticamente Amortecido\n');
else
    fprintf('Tipo de Resposta: Superamortecido\n');
end
fprintf('Ganho em Regime Permanente (K): %.2f\n', K_B);
fprintf('Função de Transferência G_B(s):\n');
disp(G_B);

fprintf('Sistema C\n');
fprintf('Polos:\n');
disp(poleC);
fprintf('Frequência Natural (wn): %.2f rad/s\n', wn_C);
fprintf('Coeficiente de Amortecimento (zeta): %.2f\n', zeta_C);
if zeta_C > 0 && zeta_C < 1
    fprintf('Tipo de Resposta: Subamortecido\n');
elseif zeta_C == 1
    fprintf('Tipo de Resposta: Criticamente Amortecido\n');
else
    fprintf('Tipo de Resposta: Superamortecido\n');
end
fprintf('Ganho em Regime Permanente (K): %.2f\n', K_C);
fprintf('Função de Transferência G_C(s):\n');
disp(G_C);

% Comentários finais
% O Sistema B é o mais adequado. Ele é criticamente amortecido (zeta = 1), o que garante ausência total de sobressinal (diferente do Sistema A, que é subamortecido e possui sobressinal) e proporciona a resposta mais rápida possível entre os sistemas que não ultrapassam o valor final (sendo mais rápido que o Sistema C, que é superamortecido com zeta = 1.6).

%% 3. Avaliação de desempenho de dois sistemas de segunda ordem

t = 0:0.01:8;
limite =[0 1];
tol_acom = 0.02;

% Sistema 1

G_1 = tf(16, [1 2.8 16]);
[y1, t1v] = step(G_1, t);

vf1 = dcgain(G_1);
td1 = t1v(y1 >= 0.5*vf1);

info1 = stepinfo(y1, t1v, vf1, 'RiseTimeLimits', limite, 'SettlingTimeThreshold', tol_acom);

tr1 = info1.RiseTime;
tp1 = info1.PeakTime;
peak1 = info1.Peak;
sobres1 = info1.Overshoot;
ts1 = info1.SettlingTime;

wn1 = sqrt(16);
zeta1 = 2.8 / (2*wn1);
pole1 = pole(G_1);

% Exibição dos Resultados do Sistema 1
fprintf('Sistema 1\n');
fprintf('Polos:\n');
disp(pole1);
fprintf('Frequência Natural (wn): %.2f rad/s\n', wn1);
fprintf('Coeficiente de Amortecimento (zeta): %.2f\n', zeta1);
fprintf('Valor final da Resposta (vf1): %.2f\n', vf1);
fprintf('Tempo de Atraso (td1): %.4f s\n', td1(1));
fprintf('Tempo de Subida (tr1): %.4f s\n', tr1);
fprintf('Tempo de Pico (tp1): %.4f s\n', tp1);
fprintf('Valor de Pico: %.4f\n', peak1);
fprintf('Sobressinal (Overshoot): %.2f%%\n', sobres1);
fprintf('Tempo de Acomodação (ts1): %.4f s\n\n', ts1);

% Sistema 2

G_2 = tf(25, [1 6.5 25]);
[y2, t2v] = step(G_2, t);

vf2 = dcgain(G_2);
td2 = t2v(y2 >= 0.5*vf2);

info2 = stepinfo(y2, t2v, vf2, 'RiseTimeLimits', limite, 'SettlingTimeThreshold', tol_acom);

tr2 = info2.RiseTime;
tp2 = info2.PeakTime;
peak2 = info2.Peak;
sobres2 = info2.Overshoot;
ts2 = info2.SettlingTime;

wn2 = sqrt(25);
zeta2 = 6.5 / (2*wn2);
pole2 = pole(G_2);

% Exibição dos Resultados do Sistema 2
fprintf('Sistema 2\n');
fprintf('Polos:\n');
disp(pole2);
fprintf('Frequência Natural (wn): %.2f rad/s\n', wn2);
fprintf('Coeficiente de Amortecimento (zeta): %.2f\n', zeta2);
fprintf('Valor final da Resposta (vf2): %.2f\n', vf2);
fprintf('Tempo de Atraso (td2): %.4f s\n', td2(1));
fprintf('Tempo de Subida (tr2): %.4f s\n', tr2);
fprintf('Tempo de Pico (tp2): %.4f s\n', tp2);
fprintf('Valor de Pico: %.4f\n', peak2);
fprintf('Sobressinal (Overshoot): %.2f%%\n', sobres2);
fprintf('Tempo de Acomodação (ts2): %.4f s\n\n', ts2);

% Resposta ao degrau unitário por 8s

figure;
step(G_1, t, 'r', 'LineWidth', 1.5); hold on;
step(G_2, t, 'g', 'LineWidth', 1.5);
grid on;
title('Resposta ao Degrau Unitário');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Sistema 1', 'Sistema 2', 'Location', 'best');

% Verificação dos requisitos: sobressinal < 10% e acomodação < 1,5 s
if sobres1 < 10 && ts1 < 1.5
    disp('Sistema 1 atende aos requisitos')
else
    disp('Sistema 1 não atende aos requisitos')
end
if sobres2 < 10 && ts2 < 1.5
    disp('Sistema 2 atende aos requisitos')
else
    disp('Sistema 2 não atende aos requisitos')
end
fprintf('\n')

% Comentários:
% O Sistema 1, com menor coeficiente de amortecimento, apresenta maior
% sobressinal e leva mais tempo para se acomodar em torno do valor final.
% O Sistema 2, mais amortecido, responde de forma mais suave e se acomoda
% mais rapidamente.
% Considerando os requisitos da aplicação (sobressinal inferior a 10% e
% tempo de acomodação inferior a 1,5 s), apenas o Sistema 2 atende
% simultaneamente às duas condições, sendo portanto o mais indicado.

%% 4. Seleção de parâmetros para um sistema de segunda ordem
zetas = [0.35 0.55 0.70 0.80];
wns = [6 5 4 3.2];
configs = {'A', 'B', 'C', 'D'};
n = length(zetas);
t = 0:0.01:8;

sobres_val = zeros(1, n);
tr_val = zeros(1, n);
tp_val = zeros(1, n);
ts_val = zeros(1, n);
vf_vals = zeros(1, n);

figure
hold on
for k = 1:n
    G = tf(wns(k)^2, [1 2*zetas(k)*wns(k) wns(k)^2]);
    fprintf('Configuração %s (zeta = %.2f, wn = %.1f rad/s)\n', configs{k}, zetas(k), wns(k));
    polos_k = pole(G);
    [y, tt] = step(G, t);
    vf = dcgain(G);
    info = stepinfo(y, tt, vf, 'RiseTimeLimits', [0 1], 'SettlingTimeThreshold', 0.02);
    
    sobres_val(k) = info.Overshoot;
    tr_val(k) = info.RiseTime;
    tp_val(k) = info.PeakTime;
    ts_val(k) = info.SettlingTime;
    vf_vals(k) = vf;

    fprintf('Polos:\n'); disp(polos_k);
    
    fprintf('Sobressinal: %.2f %% | Tr: %.3f s | Tp: %.3f s | Ts(2%%): %.3f s | Valor final: %.3f\n\n', ...
        sobres_val(k), tr_val(k), tp_val(k), ts_val(k), vf_vals(k));
    plot(tt, y, 'LineWidth', 1.5);
end
grid on
title('Exercício 4 - Resposta ao degrau das configurações A, B, C e D')
xlabel('Tempo (s)')
ylabel('Amplitude')
legend('Configuração A', 'Configuração B', 'Configuração C', 'Configuração D', 'Location', 'best')
hold off

% Requisitos: sobressinal < 10% e tempo de acomodação < 1,5 s
disp('Verificação dos Requisitos:')
for k = 1:length(configs)
    if sobres_val(k) < 10 && ts_val(k) < 1.5
        fprintf('Configuração %s (Atende aos requisitos)\n', configs{k});
    else
        fprintf('Configuração %s (NÃO atende aos requisitos)\n', configs{k});
    end
end

% Seleciona a de menor tempo de subida entre as válidas
menor_tr = Inf;
melhor = '';

for k = 1:length(configs)
    if sobres_val(k) < 10 && ts_val(k) < 1.5
        if tr_val(k) < menor_tr
            menor_tr = tr_val(k);
            melhor = configs{k};
        end
    end
end

fprintf('\nConfiguração escolhida: %s (menor tempo de subida entre as válidas)\n', melhor);
fprintf('Tempo de subida associado: %.4f s\n\n', menor_tr);

% Comentários:
% As configurações com menor coeficiente de amortecimento (A e B)
% apresentam sobressinal superior a 10%, sendo descartadas mesmo quando o
% tempo de acomodação é adequado.
% Entre as configurações que atendem simultaneamente aos dois requisitos,
% escolhe-se aquela com o menor tempo de subida, garantindo a resposta
% mais rápida possível sem violar a restrição de sobressinal.

%% 5. Comparação entre sistemas de primeira e segunda ordem

GA5 = tf(2, [1.2 1]);       % Equipamento A - Primeira Ordem
GB5 = tf(32, [1 5.6 16]);   % Equipamento B - Segunda Ordem

% Equipamento A 
polo_A5 = pole(GA5);
Kdc_A5 = dcgain(GA5);
T_A5 = 1.2;
Tr_A5_teorico = 2.2 * T_A5; 
Ta_A5_teorico = 4 * T_A5;   

% Equipamento B 
polos_B5 = pole(GB5);
Kdc_B5 = dcgain(GB5);
wn_B5 = sqrt(16);
zeta_B5 = 5.6 / (2 * wn_B5);

t5 = 0:0.001:8;
[yA5, tA5] = step(GA5, t5);
[yB5, tB5] = step(GB5, t5);

infoA5 = stepinfo(yA5, tA5, Kdc_A5);  
infoB5 = stepinfo(yB5, tB5, Kdc_B5, 'RiseTimeLimits', [0 1], 'SettlingTimeThreshold', 0.02);

Tr_A5_calc = infoA5.RiseTime;
Ta_A5_calc = infoA5.SettlingTime;

Tr_B5 = infoB5.RiseTime;
Tp_B5 = infoB5.PeakTime;
Pico_B5 = infoB5.Peak;
Mp_B5 = infoB5.Overshoot;
Ta_B5 = infoB5.SettlingTime;

fprintf('Equipamento A\n');
fprintf('Polo: %.4f\n', polo_A5);
fprintf('Ganho Estático (Kdc): %.2f\n', Kdc_A5);
fprintf('Constante de Tempo (T): %.2f s\n', T_A5);
fprintf('Tempo de Subida (Calculado): %.4f s (Teórico: %.4f s)\n', Tr_A5_calc, Tr_A5_teorico);
fprintf('Tempo de Acomodação (Calculado): %.4f s (Teórico: %.4f s)\n\n', Ta_A5_calc, Ta_A5_teorico);

fprintf('Equipamento B\n');
fprintf('Polos:\n');
disp(polos_B5);
fprintf('Ganho Estático (Kdc): %.2f\n', Kdc_B5);
fprintf('Frequência Natural (wn): %.2f rad/s\n', wn_B5);
fprintf('Coeficiente de Amortecimento (zeta): %.2f\n', zeta_B5);
fprintf('Tempo de Subida (0-100%%): %.4f s\n', Tr_B5);
fprintf('Tempo de Pico (Tp): %.4f s\n', Tp_B5);
fprintf('Valor de Pico: %.4f\n', Pico_B5);
fprintf('Sobressinal (Overshoot): %.2f %%\n', Mp_B5);
fprintf('Tempo de Acomodação (2%%): %.4f s\n\n', Ta_B5);

% Resposta ao Degrau Unitário
figure;
plot(tA5, yA5, 'r', 'LineWidth', 1.5); hold on;
plot(tB5, yB5, 'b', 'LineWidth', 1.5);
grid on;
title('Exercício 5 - Resposta ao Degrau Unitário');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Equipamento A (1ª ordem)', 'Equipamento B (2ª ordem)', 'Location', 'best');

% Entrada em degrau de amplitude 1,5
A5 = 1.5;
valor_final_A5_1_5 = A5 * Kdc_A5;
valor_final_B5_1_5 = A5 * Kdc_B5;

fprintf('Valor Final do Equipamento A: %.2f\n', valor_final_A5_1_5);
fprintf('Valor Final do Equipamento B: %.2f\n\n', valor_final_B5_1_5);

figure;
step(A5*GA5, 'r', t5); hold on;
step(A5*GB5, 'b', t5);
grid on;
title('Exercício 5 - Resposta ao Degrau de Amplitude 1,5');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Equipamento A (1ª ordem)', 'Equipamento B (2ª ordem)', 'Location', 'best');

% Comentários:
% Rapidez: O Equipamento B, embora de segunda ordem, possui um tempo de
% subida inferior ao do Equipamento A, respondendo mais rapidamente às variações.
% Sobressinal: O Equipamento A não possui sobressinal por ser de primeira ordem, 
% enquanto o Equipamento B (subamortecido) apresenta um pico transitório.
% Regime Permanente: Ambos atingem o mesmo valor final (K = 2 para degrau unitário
% e valor 3.0 para degrau de amplitude 1.5), diferenciando-se apenas no transitório.
