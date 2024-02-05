% Exercício 3 da parte 2.2
clear;clc;
%% Alínea A
Sx = 0:4;
N = 1e5;
m= 4;

experiencias = rand(m,N); % usa-se o rand para ver se sai cara ou coroa
moedas = experiencias <0.5;
sucessos = sum(moedas);

px= [sum(sucessos==0)/N,sum(sucessos==1)/N,sum(sucessos==2)/N,sum(sucessos==3)/N,sum(sucessos==4)/N]

% Funcão de Massa Probabilidade
stem(Sx,px);
xlabel("Núemro de coroas");
ylabel("Probabilidade  P[X =x_i]");
title("Funcao massa de probabilidade (aka FMP) de SX");

%% Alínea B
% Média ou Valor Esperado
media = sum(Sx.*px)

%variancia
aux = (Sx-media).^2
variancia = sum(aux.*px)

% desvio padrão
dp = sqrt(variancia)