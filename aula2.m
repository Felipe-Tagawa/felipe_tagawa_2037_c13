% Entrada e Saída

nome_cidade = input('Escreva o nome da cidade: ', 's');
disp(nome_cidade);
fprintf('Cidade escolhida: %s!', nome_cidade);

% If, elseif e else
x = 15;
if x > 10
    disp('O valor de x é maior que 10.');
elseif x == 10
    disp('O valor de x é 10 ou menor.');
else
    disp('O valor é menor do que 10.');
end

% for

for i = 1:1:5
    i = i * 3;
    disp(i)
end

% while

valor = 0;
cont = 0;

% Troquei x por valor e i por cont para não sobrescrever.
while cont < 5
    valor = valor + 1;
    cont = cont + 1;
    disp(valor);
end

% Switch e Função

opcao = 2;

switch opcao
    case 1
        disp('Escolheu a Opcao A');
    case 2
        disp('Escolheu a Opcao B');
    case 3
        disp('Escolheu a Opcao C');
    otherwise
        disp('Opcao Invalida');
end

function resultado = funcao_triplo(valor_func)
    resultado = valor_func * 3;
end

resultado = funcao_triplo(10);
