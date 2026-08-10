% 2. Processamento de um vetor com for

A = [3, 8, 2, 10, 5, 7, 1, 6];

B = zeros(1, length(A));

for i = 1:length(A)
    if A(i) >= 6
        B(i) = A(i) * 2;
    else
        B(i) = A(i) + 3;
    end
end

fprintf('Vetor A original: \n');
disp(A);
fprintf('Vetor B resultante: \n');
disp(B);
fprintf('Soma dos elementos de B: %f\n', sum(B))
fprintf('Média dos elementos de B: %f\n', mean(B));
fprintf('Menor valor de B: %f\n', min(B));
fprintf('Maior valor de B: %f', max(B));