% 3. Identificação de números pares em um vetor

A = [12, 7, 20, 9, 6, 11, 18, 5];
B = zeros(1, length(A));
contador_pares = 0;

for i = 1:length(A)
    if mod(A(i), 2) == 0
        B(i) = A(i);
        contador_pares = contador_pares + 1;
    else
        B(i) = 0;
    end
end

fprintf('Vetor B: \n');
disp(B);
fprintf('Total de números pares: %d\n', contador_pares);
