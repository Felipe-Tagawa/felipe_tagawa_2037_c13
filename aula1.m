% Operações Básicas
a = 12;
b = 5;
soma = a + b;
subtr = a - b;
mult = a * b;
div = a / b;
expo = a^b;

% Raiz, arredondamento e resto

raiz = sqrt(144);
arredondado = round(7.6);
arredondado_cima = ceil(4.01);
resto_div = mod(250, 17);

% MDC e MMC

mdc = gcd(24, 36);
mmc = lcm(12, 18);

% Exponencial e Trigonometria

expo_2 = exp(2);
seno_30 = sin(pi / 6);
cosseno_60 = cos(pi / 3);
tang45 = tan(pi / 4);

% Criando Vetores

vetor_1_10 = 1:10;
vetor_10_1 = 10:-1:1;
pares_0_20 = 0:2:20;
valores_5_espacados = linspace(0, 100, 5);

% Acessando posições de um vetor

v = [4, 8, 15, 16, 23, 42];

primeiro_elemento = v(1);
ultimo_elemento = v(end);
posit_2_4 = v([2,3,4]);
posit_1_3_6 = v([1, 3, 6]);

% Informações sobre um vetor

vet = [5, 10, 15, 20, 25];
qnt_vet = length(vet);
dim_vet = size(vet);
soma_elem = sum(vet);
media_vet = mean(vet);
maior_valor = max(vet);
menor_valor = min(vet);

% Vetor linha e vetor coluna

vetor_8 = [10, 20, 30, 40];
vetor_coluna = [vetor_8].';
vetor_8_size_antes = size(vetor_8);
vetor_8_size_depois = size(vetor_coluna);

% Operações com Matrizes

A = [1,2;3,4];
B = [2,0;1,5];

soma_mat = A + B;
produto_mat = A * B;
A_transp = A.';

mat_3x3_zeros = zeros(3,3);
mat_2x4_uns = ones(2,4);
mat_ident_4x4 = eye(4);
mat_random = rand(3,3);
