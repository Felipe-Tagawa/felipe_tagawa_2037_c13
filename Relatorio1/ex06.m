% 6. Processamento de uma matriz com dois laços for

A = [2, 7, 4, 9; 6, 1, 8, 3];
B = zeros(2, length(A));

[num_linhas, num_colunas] = size(A);

for j = 1:num_linhas
    for i = 1:num_colunas
        if(A(j,i) > 5)
            B(j, i) = A(j, i) * 2;
        else
            B(j, i) = A(j, i) + 5;
        end
    end
end

fprintf('Matriz A: \n')
disp(A);
fprintf('Matriz B: \n');
disp(B);
fprintf('Transposta de B: \n');
disp(B');
fprintf('Primeira linha de B: \n')
disp(B(1, :));
fprintf('Terceira coluna de B: \n')
disp(B(:, 3));


