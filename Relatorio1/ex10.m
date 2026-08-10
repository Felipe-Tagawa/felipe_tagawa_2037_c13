% 10. Desafio integrador: análise de dados e escolha de gráfico

dados = [12, 18, 10, 25, 15];
contador = 0;

fprintf('Soma dos dados: %f\n', sum(dados));
fprintf('Média dos dados: %f\n', mean(dados));
fprintf('O maior valor: %i\n', max(dados));
fprintf('O menor valor: %i\n', min(dados));

for i = 1:length(dados)
    if dados(i) >= mean(dados)
        contador = contador + 1;
    end
end

fprintf('Número de elementos acima da média: %i\n', contador);

disp('1 - Gráfico de barras');
disp('2 - Gráfico de pizza');
opcao = input('Digite uma opção: ');

switch opcao
    case 1
        bar(dados);
        title('Dados em Barras');
    case 2
        pie(dados);
        title('Distribuição dos Dados');
    otherwise
        warning('Nenhum gráfico foi criado!');
end

if contador >= round(length(dados) / 2)
    disp('Maioria dos valores acima ou igual à média');
else
    disp('Menos da metade dos valores acima ou igual à média');
end