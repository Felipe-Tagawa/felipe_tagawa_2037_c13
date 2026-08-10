% 8. Função para transformar uma matriz

function B = transforma_matriz(A, B)
    [num_linhas, num_colunas] = size(A);
    for j = 1:num_linhas
        for i = 1:num_colunas
            if A(j, i) >= 5
                B(j, i) = A(j, i) * 2 * exp(1);
            else
                B(j, i) = A(j, i) * 2;
            end
        end
    end
end

A = [1, 5, 3, 8; 6, 2, 7, 4];
B = zeros(size(A));

B_resultante = transforma_matriz(A, B);
disp(B_resultante);