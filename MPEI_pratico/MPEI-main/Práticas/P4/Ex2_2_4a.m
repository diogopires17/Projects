% Exercício 4 da parte 2.2
clear;clc;
%% Alínea A i
Sx = 0:5;
N = 1e5;
m= 5; % n º de peças
experiencia = rand(m,N); % usa-se o rand para ver se sai com defeito ou não
Pdefeito= 0.3;
defeito = experiencia< Pdefeito;
sucesso= sum(defeito);

px= [sum(sucesso==0)/N,sum(sucesso==1)/N,sum(sucesso==2)/N,sum(sucesso==3)/N,sum(sucesso==4)/N,sum(sucesso==5)/N]

% Funcão de Massa Probabilidade
stem(Sx,px);
xlabel("Número de peças defeituosas");
ylabel("Probabilidade  P[X =x_i]");
title("Funcao massa de probabilidade (aka FMP) de SX");

%% Alínea A ii
pacusum1 = cumsum(px);
stairs(Sx,pacusum1)

%% Alínea A iii
p2defeito = px(1,1) + px(1,2)+ px(1,3)

