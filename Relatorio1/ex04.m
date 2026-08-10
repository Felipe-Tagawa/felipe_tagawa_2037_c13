% 4. Calculadora com menu usando switch

disp('Bem vindo à calculadora do Felipe!')
num1 = input('Digite o primeiro número: ');
num2 = input('Digite o segundo número: ');

disp('Escolha uma operação matemática');
disp('1 - Soma');
disp('2 - Subtração');
disp('3 - Multiplicação');
disp('4 - Divisão');
opcao = input('Digite sua opção: ');

switch opcao
    case 1
        fprintf('Resultado: %f', num1 + num2);
    case 2
        fprintf('Resultado: %f', num1 - num2);
    case 3
        fprintf('Resultado: %f', num1 * num2);
    case 4
        if num2 ~= 0 % Diferente
            fprintf('Resultado: %f', num1 / num2);
        else
            disp('Erro: Divisão por zero!');
        end
    otherwise
        disp('Opção inválida');
end