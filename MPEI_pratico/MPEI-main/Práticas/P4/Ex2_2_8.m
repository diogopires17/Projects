% Exercício 8 da parte 2.2
clear;clc;
lambda= 0.02 *100;

% Probabilidadede que exista no máximo 1 erro num livro de 100 páginas
%Vamos ter de somar a probabilidade de ocorrer 0 erros + a probabilidade de
%ocorrer 1 erro

prob= 0;
%Distribuição de Poisson
for k=0:1
    prob = prob + ((lambda^k)/factorial(k))*exp(-lambda);
end

fprintf("Probabilidade de existir no máximo um erro num livro de 100 páginas = %0.4f \n", prob)