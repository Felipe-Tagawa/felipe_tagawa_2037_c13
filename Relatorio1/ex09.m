% 9. Entrada como texto e conversão numérica

texto1 = input('Digite um valor: ', 's');
texto2 = input('Digite outro valor: ', 's');

disp(texto1);
disp(texto2);

valor1 = str2num(texto1);
valor2 = str2num(texto2);

soma = valor1 + valor2;
mult = valor1 * valor2;
fprintf('A soma é: %.2f\n', soma);
fprintf('A multiplicação é: %.2f\n', mult);

if soma > 20
    disp('Soma alta');
elseif soma == 20
    disp('Soma igual a 20');
elseif soma <= 20
    disp('Soma baixa');
end