% Este é um arquivo apenas para treino (não é a resolução)

clc; % Limpa command window
clear all; % Limpa workspace
close all; % Limpa os gráficos gerados

%% Primeiro Gráfico

% Vetores precisam ser do mesmo tamanho
x = linspace(0, 10, 100);
y = cosh(sin(x));
z = 2*cos(3*t);

figure
plot(x, y);

%% Usando Hold on para mesclar gráficos

figure
plot(x, y);
hold on;
y2 = 2*sin(x);
plot(x, y2);

% Ou

figure
plot(x,y,x,y2)

%% Editar Figure

t = 0:0.1:10;
y = sin(3*t);

figure
subplot(2,1,1)
plot(t,y)
ylabel("Amplitude")

subplot(2,1,2)
plot(t, z)
xlabel("Tempo (s)")
ylabel("Amplitude")
title("Sine and Cosine Waves")

%% Vários gráficos juntos

subplot(4,1,1)
plot(t, y2, 'r')
ylabel("Amplitude")
title("Combined Sine and Cosine Waves")
subplot(4,1,2)
plot(t, z, 'b')
ylabel("Amplitude")
title("Cosine Wave")
subplot(4,1,3)
plot(t, y, 'g')
ylabel("Amplitude")
title("Sine Wave")
subplot(4,1,4)
plot(t, y2, 'm')
xlabel("Tempo (s)")
ylabel("Amplitude")
title("Sine Wave with Amplitude Scaling")

%% Função Afim

t = -10:0.1:10;
x = 2*t + 2;

figure
plot(t,x)
grid on

%% Parábola

t = -10:0.1:10;
x = 2*t.^2 + 5*t + 2;

figure
plot(t,x), grid

%% Customizar gráfico

t = -10:0.1:10;
x1 = 2*t.^2 + 5*t + 1;
x2 = 5*t + 1;

figure
subplot(1,2,1)
plot(t,x1, 'b', t, x2, 'b', 'LineWidth', 1), grid % Linha Azul
subplot(1,2,2)
plot(t, x1, 'r--', t, x2, 'g-.', 'LineWidth', 3), grid
xlabel("Tempo (s)");
ylabel("Amplitude");
title("Comparação Simples");
legend('x1','x2', 'Location','north')
% xlim([-10 6]) % Limitar o eixo x
% ylim([0 200])

axis([-10 6 0 200]); % xlim ylim 

%% Customizar gráfico  Parte 2

t = 0:0.1:10;
y = t.^3 + exp(3*t);

figure
plot(t,y,'g','LineWidth',1.5), grid;
% Customizing the plot further with annotations
xlabel('Time (s)');
ylabel('Amplitude');
title('Cubic and Exponential Functions');
grid on;
legend('y = t^3 + exp(3*t)', 'Location', 'northeast');

% [posicao horizontal, posicao vertical, largura e altura]
axes('Position', [0.2 0.3 0.2 0.4]);
box on % Habilitar para mexer
plot(t,y,'g','LineWidth',1.5), grid;
axis([9 10 2 4e12]);

%% Escalas Logarítmicas

t = 0.1:0.1:10; % Não pode iniciar em 0 (log)
y = 50000*exp(-0.05*t);

figure
subplot(2,2,1)
plot(t,y), grid
ylabel("Amplitude");
xlabel("Tempo (s)");
title("Escala Normal");

subplot(2,2,2)
semilogy(t,y), grid;
ylabel("Amplitude");
xlabel("Tempo (s)");
title("Escala log em Y");

subplot(2,2,3)
semilogx(t,y), grid;
ylabel("Amplitude");
xlabel("Tempo (s)");
title("Escala log em X");

subplot(2,2,4)
loglog(t,y), grid;
ylabel("Amplitude");
xlabel("Tempo (s)");
title("Escala log em X e Y");

%% Superfícies com mesh

z_peaks = peaks(25);

figure
mesh(z_peaks); % Malhas (grid em 3d)

xlabel('X');
ylabel('Y');
zlabel('Z');

%% Superfície com meshgrid e surf

[x, y] = meshgrid(1:0.5:10, 1:10);
z = sin(x) + cos(y);

figure
surf(x,y,z) % Preenchimento da superfície

xlabel('X');
ylabel('Y');
zlabel('Z');

colormap("summer")
shading interp % Suaviza as cores

%% Gráfico de Contorno

figure
contour(peaks(25), 5);

colormap default;

%% Curva 3D com plot3

t = 0:0.1:10*pi;
x = sin(t);
y = cos(t);

figure
plot3(x,y,t), grid

xlabel('x')
ylabel('y')
zlabel('z')

%% Esfera

[X,Y,Z] = sphere;

R = 10;

X2 = X*R;
Y2 = Y * R; 
Z2 = Z * R;

figure
surf(X2, Y2, Z2)
shading interp


