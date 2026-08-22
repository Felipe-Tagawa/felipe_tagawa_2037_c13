%% Exercício 1 - Sistema Massa-Mola-Amortecedor - Caixa Branca

M = 2;
B = 3;
K = 8;

% y(s) / u(s) = (Bs + K) / Ms² + Bs + K

num = [B K];
den = [M B K];

G1 = tf(num,den)

figure;
step(G1, 15), grid;
title('Sistema Massa-Mola-Amortecedor');
xlabel('Tempo (s)');
ylabel('Saída do Modelo');

%% Exercício 2 - Circuito RC - Caixa Cinza

R = 1000;
tau = 2;

C = tau / R;

num = 1;
den = [R*C 1];
G2 = tf(num, den)
fprintf('O valor encontrado para C (Capacitância) foi de: %.1f mF\n', C * 1000);

figure;
step(G2, 10), grid;
title('Sistema Circuito RC');
xlabel('Tempo (s)');
ylabel('Tensão na Saída (V)')

%% Exercício 3 - Sistema massa-atrito - Caixa Cinza

M = 4;
F = 1;

% B não conhecido
% v(s) / f(s) = 1 / (Ms + B)

v = 0.5;

% Para regime permanente --> (F = B*v)

B = F / v;
num = 1;
den = [M B];

G3 = tf(num, den)
fprintf('O valor do Coeficiente de Atrito é de: %i', B);

figure;
step(F * G3, 20), grid;
title('Sistema Massa-Atrito')
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');

