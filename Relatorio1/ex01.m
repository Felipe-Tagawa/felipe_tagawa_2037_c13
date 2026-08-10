% 1. Análise de 3 medições

vet = zeros(1, 3);

for i = 1:3
    vet(i) = input ("Digite um valor numérico: ");
end

media = mean(vet);
menor_valor = min(vet);
maior_valor = max(vet);

if media >= 8
    disp('Resultado alto');
elseif media >= 5 && media < 8
    disp('Resultado intermediário');
else
    disp('Resultado baixo');
end

fprintf('Média: %.2f\n', media);

