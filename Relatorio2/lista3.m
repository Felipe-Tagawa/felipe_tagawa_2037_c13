%% Questão 1 -- Funções e Gráficos 2D

tempo = 0:0.1:10;

senoide = 2*sin(3*tempo);
cossenoide = 2*cos(3*tempo);

figure;
plot(tempo, senoide, 'b-', 'LineWidth', 1.5);
hold on;
plot(tempo, cossenoide, 'r--', 'LineWidth', 1.5);
title('Ondas Senoidal e Cossenoidal');
xlabel('Tempo (segundos)');
ylabel('Amplitude');
legend('Senoide', 'Cossenoide');
grid on;

% Quantidade de elementos do vetor de tempo
fprintf('Quantidade de elementos do vetor de tempo: %i', length(tempo));

%% Questão 2 -- Entrada de Dados, Condição e Gráfico

coef_a = input('Digite um valor numérico para o coeficiente A: ');
x = -10:0.1:10;
y = coef_a * x + 2;

if coef_a < 0
    disp('O coeficiente A é negativo!')
elseif coef_a == 0
    disp('O coeficiente A é nulo!')
else
    disp('O coeficiente A é positivo!')
end

figure;
plot(x, y, 'r--', 'LineWidth', 1), grid
title('Gráfico da Função Solicitada');
xlabel('x');
ylabel('y');

axes('Position', [0.6 0.2 0.25 0.25]);
plot(x, y, 'r--', 'LineWidth', 1), grid
title('Zoom')
xlim([-2 2]);

%% Questão 3 -- Repetição e Organização de Gráficos

mult3 = zeros(1, 5);
for i = 1:5
    mult3(i) = 3 * i;
end

mult3_2 = mult3 * 2;

figure;

% Usar Stem é melhor para valores discretos (linha é ruim com plot)

% Múltiplos de 3
subplot(2,1,1)
stem(mult3, 'r', 'LineWidth', 1.5);
grid on;
ylabel('Valor');
xlabel('Índice');
title('Primeiros 5 Múltiplos de 3');

% Dobro dos Múltiplos de 3
subplot(2,1,2)
stem(mult3_2, 'g', 'LineWidth', 1.5);
grid on;
ylabel('Valor');
xlabel('Índice');
title('Dobro dos Múltiplos de 3');

%% Questão 4 - Comparação de Escalas

t = 0.1:0.1:1000; % Valores positivos até 1000
y = 50000*exp(-0.05*t);

figure;

subplot(1,2,1);
plot(t,y,'y', 'LineWidth', 1.5), grid;
title('Função com Escala Comum');
ylabel('Amplitude');
xlabel('Tempo (s)');
subplot(1,2,2);
semilogy(t, y, 'b', 'LineWidth', 1.5), grid;
title('Função com Escala Logarítmica no Eixo Vertical');
ylabel('Amplitude');
xlabel('Tempo (s)');

%% Questão 5 - Gráficos 3D

[x, y] = meshgrid(1:0.5:10, 1:0.5:20);

z = sin(x) + cos(y);

figure;
surf(x,y,z);
title('Superfície 3D');
xlabel('Eixo x');
ylabel('Eixo y');
zlabel('Eixo z');

colormap('summer')
shading interp;

figure
contour(x,y,z, 5);
xlabel('Eixo x');
ylabel('Eixo y');
title('Curvas de Nível');

colormap default;







