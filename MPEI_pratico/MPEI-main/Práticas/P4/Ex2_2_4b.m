% Exercício 4 da parte 2.2
clear;clc;
%% Alínea B i
clear;clc;
p =0.5; % probabilidade de vir defeituosa.
n = 5; % numero de peças
% É a distribuição Binomial com p = 0.5 e n= 5
for k=0:n
    pt(k+1) = nchoosek(n,k)*p^k*(1-p)^(n-k);% nchoosek(n,k)= n!/(n-k)!/k!
end
pt

% Gráfico da Distribuição Acumulada
Sx= 0:5;
pacusum1 = cumsum(pt);
stairs(Sx,pacusum1)
title("Funcao Distribuição Acumulada de SX");
%% Alínea B ii
% probabilidade de, no máximo, 2 das peças de uma amostra serem defeituosas
P = pt(1,1)+ pt(1,2) + pt(1,2)