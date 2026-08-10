% 5. Acumulador com while

soma = 0;
contador = 0;

while soma <= 4
    valor_aleatorio = rand;
    soma = soma + valor_aleatorio;
    contador = contador + 1;
    fprintf('Valor sorteado: %f\n', valor_aleatorio);
    fprintf('Soma atual: %f\n', soma)
end

if contador > 8
    disp('Muitas repetições');
else
    disp('Poucas repetições');
end