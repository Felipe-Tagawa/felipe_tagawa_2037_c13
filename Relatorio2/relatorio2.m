clc;
clear all; 
close all; 

%% 1. Sistema Massa-Atrito e Comparação Básica - Caixa Branca

% Sistema 1

M1 = 2;
B1 = 3;

num1 = 1;
den1 = [M1 B1];

G1 = tf(num1, den1) % Sem ';' para mostrar no Command Window

% Sistema 2

M2 = 4;
B2 = 6;

num2 = 1;
den2 = [M2 B2];

G2 = tf(num2, den2) % Sem ';' para mostrar no Command Window

figure;
step(G1, G2, 20), grid;
hold on;
plot([0 20], [1 1], 'g--', 'LineWidth', 1.5);
ylim([0 1.2]);

title('Comparação de Sistemas Massa-Atrito');
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
legend('Sistema 1', 'Sistema 2', 'Força Unitária', 'Location', 'east');

axes('Position', [0.2 0.4 0.3 0.4]);
box on;
step(G1, G2, 5), grid;
hold on;
plot([0 5], [1 1], 'g--', 'LineWidth', 1.5);
title('Zoom');
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');

% Figura 2 com gráficos separados:

figure;
subplot(2,1,1);
step(G1, 20), grid;
title('Sistema 1 (M=2, B=3)');
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');

subplot(2,1,2);
step(G2, 20), grid;
title('Sistema 2 (M=4, B=6)');
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');

%% 2. Circuito RC e comparação de escalas - Caixa Cinza

R = 2000;
tau = 2.5;

C = tau / R;

fprintf('O valor encontrado para C (Capacitância) foi de: %.2f mF\n', C * 1000);

num_rc = 1;
den_rc = [R*C 1];

G_RC = tf(num_rc, den_rc) % Sem ';' para mostrar no Command Window

figure;
step(G_RC, 15), grid;
title('Sistema Circuito RC');
xlabel('Tempo (s)');
ylabel('Tensão na Saída (V)');

Rteste = 100:100:10000; % Vetor de Resistências
tau_teste = Rteste * C;

figure;
subplot(2,2,1);
plot(tau_teste, Rteste), grid; % Escala Comum
title('Relação R x τ (Escala Comum)');
ylabel('Resistência (Ω)');
xlabel('Constante de Tempo(s)');
subplot(2,2,2);
semilogy(tau_teste, Rteste), grid; % Escala Logarítmica em y
title('Relação R x τ (Escala Log em Y)');
ylabel('Resistência (Ω)');
xlabel('Constante de Tempo(s)');
subplot(2,2,3);
semilogx(tau_teste, Rteste), grid; % Escala Logarítmica em x
title('Relação R x τ (Escala Log em X)');
ylabel('Resistência (Ω)');
xlabel('Constante de Tempo(s)');
subplot(2,2,4);
loglog(tau_teste, Rteste), grid; % Escala Logarítmica em x e y
title('Relação R x τ (Escala Log em X e Y)');
ylabel('Resistência (Ω)');
xlabel('Constante de Tempo(s)');

%% 3. Identificação e Visualização de Dados Experimentais - Caixa Preta

t = (0:25)';

% Entradas
u = [0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

% Saídas
y = [0.008 0.012 0.006 0.010 0.020 0.382 0.671 0.903 1.082 1.226 1.335 1.425 1.492 1.547 1.587 1.618 1.642 1.660 1.674 1.684 1.692 1.698 1.702 1.706 1.709 1.711];

u = u(:);
y = y(:); 

figure;
subplot(2,1,1);
plot(t, u, 'g'), grid;
title('Dados do Experimento');
ylabel('Entrada u');
xlabel('Tempo (s)');
subplot(2,1,2);
plot(t, y, 'r'), grid;
xlabel('Tempo (s)');
ylabel('Saída y');

figure;
plot3(t,u,y), grid;
xlabel('Tempo(s)');
ylabel('Entrada u');
zlabel('Saída y');

Ts = 1; % 1 segundo de amostragem
dados = iddata(y,u,Ts);

G_BB = tfest(dados, 1, 0) % FT estimada

figure;
compare(dados, G_BB), grid;
title('Comparação: Dados Experimentais x Modelo Estimado');

% Utilizando o modelo

figure;
step(G_BB, 25), grid;
xlabel("Tempo (s)");
ylabel("Saída");
title("Modelo Identificado - Caixa Preta");

%% 4. Análise de Diferentes Circuitos RC - Caixa Cinza

% Experimento 1

R1 = 1000;
tau1 = 1.2;

C1 = tau1 / R1;

fprintf('O valor encontrado para C1 (Capacitância) foi de: %.2f mF\n', C1 * 1000);

% Experimento 2

R2 = 2000;
tau2 = 2.8;

C2 = tau2 / R2;

fprintf('O valor encontrado para C2 (Capacitância) foi de: %.2f mF\n', C2 * 1000);

% Experimento 3

R3 = 3000;
tau3 = 3.9;

C3 = tau3 / R3;

fprintf('O valor encontrado para C3 (Capacitância) foi de: %.2f mF\n', C3 * 1000);

% Experimento 4

R4 = 5000;
tau4 = 7;

C4 = tau4 / R4;

fprintf('O valor encontrado para C4 (Capacitância) foi de: %.2f mF\n', C4 * 1000);

R = [R1 R2 R3 R4];
tau = [tau1 tau2 tau3 tau4];
C = [C1 C2 C3 C4];

figure;
plot3(R, tau, C),grid;
xlabel('Resistência (Ω)');
ylabel('Constante de Tempo (s)');
zlabel('Capacitância (F)');

num_rc3 = 1;
den_rc3 = [R3*C3 1];

G_RC3 = tf(num_rc3, den_rc3);
figure;
step(G_RC3, 20), grid;
title('Sistema Circuito RC - Experimento 3');
xlabel('Tempo (s)');
ylabel('Tensão na Saída (V)');

axes('Position', [0.55 0.2 0.3 0.4]);
box on;
step(G_RC3, 5), grid;
hold on;
plot([0 5], [1 1], 'g--', 'LineWidth', 1.5);
title('Zoom');
xlabel('Tempo (s)');
ylabel('Tensão na Saída (V)');

%% 5. Análise Completa de Três Tipos de Modelagem

% Sistema A - Caixa Branca

M = 3;
B = 5;

num = 1;
den = [M B];

G_A = tf(num, den) % Sem ';' para mostrar no Command Window

% Sistema B - Caixa Cinza

R_B = 1500;
tau_B = 3;

C_B = tau_B / R_B;

num_B = 1;
den_B = [R_B*C_B 1];

fprintf('O valor encontrado para C (Capacitância) foi de: %.2f mF\n', C_B * 1000);

G_B = tf(num_B, den_B) % Sem ';' para mostrar no Command Window

% Sistema C - Caixa Preta

t = (0:20)';

u = [0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

y = [0.010 0.006 0.012 0.018 0.408 0.706 0.934 1.103 1.229 1.322 1.391 1.441 1.479 1.505 1.526 1.540 1.551 1.558 1.564 1.568 1.571];

u = u(:);
y = y(:); 

Ts = 1;

dados = iddata(y,u,Ts);

G_C = tfest(dados, 1, 0) % Sem ';' para mostrar no Command Window

figure;
subplot(3,1,1);
step(G_A, 20), grid;
title('Resposta ao Degrau do Sistema A')
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(3,1,2);
step(G_B, 20), grid;
title('Resposta ao Degrau do Sistema B');
xlabel('Tempo (s)');
ylabel('Tensão na Saída (V)');

subplot(3,1,3);
step(G_C, 20), grid;
title('Resposta ao Degrau do Sistema C');
xlabel('Tempo (s)');
ylabel('Amplitude');

figure;
subplot(2,1,1);
plot(t,u, 'g'), grid;
title('Dados Experimentais');
xlabel('Tempo (s)');
ylabel('Entrada u');

subplot(2,1,2);
plot(t,y, 'r'), grid;
xlabel('Tempo (s)');
ylabel('Saída y');

figure;
compare(dados, G_C), grid;
title('Comparação entre a Estimativa e os Dados');

%% Comentários finais
% Sistema A - Caixa Branca: o modelo foi obtido diretamente das equações
% físicas conhecidas do sistema massa-atrito, sem necessidade de dados
% experimentais.
% Sistema B - Caixa Cinza: parte do modelo é conhecida (estrutura RC de
% primeira ordem), mas o parâmetro C precisou ser calculado a partir de
% um dado experimental (tau).
% Sistema C - Caixa Preta: não há conhecimento da estrutura interna do
% sistema; a função de transferência foi estimada inteiramente a partir
% dos dados de entrada e saída, usando tfest.




