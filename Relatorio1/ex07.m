% 7. Função com duas saídas para analisar um vetor

function [soma_elementos, media_elementos] = analisa_vetor(vet_entrada)
    soma_elementos = sum(vet_entrada);
    media_elementos = mean(vet_entrada);
end

A = [5, 12, 7, 3, 9, 14];

[soma_elementos, media_elementos] = analisa_vetor(A);

if media_elementos >= 8
    disp('Média elevada');
else
    disp('Média abaixo de 8.');
end

fprintf('O valor da soma foi de: %f\n', soma_elementos);
fprintf('A média dos elementos é: %f', media_elementos);

