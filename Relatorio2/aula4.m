% Este é um arquivo apenas para treino (não é a resolução)

clc; % Limpa command window
clear all; % Limpa workspace
close all; % Limpa os gráficos gerados

%% Sistema massa-atrito - Caixa Branca

M = 10;
B = 0.8;

num = 1; % Numerador função de transferência
den = [M B]; % Vetor representando o denominador

G1 = tf(num, den);

figure;
step(G1, 100); % Aplicar um degrau unitário na entrada do Sistema com tempo de 100s
grid on;

hold on;
plot([0 0 100], [0 1 1], 'r--', 'lineWidth', 1.5);


xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Sistema Massa-Atrito - Caixa Branca')
legend("Velocidade do Corpo", 'Força F aplicada', 'Location','east')

%% Sistema Circuito RC - Caixa Cinza

R = 1000;
tau = 1; % 1000 * 0.001 = 1 (R*C = 1)
C = tau/R;

num = 1;
den = [R*C 1]; 
G2 = tf(num, den); % Função de transferência do circuito RC

figure;
step(G2, 5), grid;
xlabel('Tempo (s)');
ylabel('Tensão na Saída (V)');
title("Circuito RC - Caixa Cinza")

%% Sistema Desconhecido - Caixa Preta

% Apenas dados de entrada e saída

t = (0:20)';
% Entrada u
u = [0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
% y = sinal de saida medido no experimento
y = [0.012 -0.008 0.006 0.015 0.452 0.786 1.061 1.245 1.398 1.512 1.584 1.649 1.688 1.719 1.742 1.751 1.768 1.761 1.779 1.772 1.781];

% Transformar em vetores coluna:

u = u(:);
y = y(:); 

figure;
subplot(2,1,1);
plot(t,u), grid;

ylabel("Entrada u");
title("Dados do Experimento");

subplot(2,1,2);
plot(t,y), grid;
ylabel("Saída y");
xlabel("Tempo (s)");

Ts = 1;
dados = iddata(y,u,Ts); % Objeto para armazenar e gerenciar dados entrada-saída em modelagem de sistemas.

% tfest(Entrada e Saída, #polos e #zeros)
G3 = tfest(dados, 1, 0); % Estimar FT

figure;
compare(dados,G3), grid;

% Utilizar de fato o modelo

figure;
step(G3, 20), grid;
xlabel("Tempo (s)");
ylabel("Saída");
title("Modelo Identificado - Caixa Preta");