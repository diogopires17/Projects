%% Código 1 - segunda versão
%% Exercício 3

N= 1e5; %número de experiências
p = 0.5; %probabilidade de cara
k = 6; %número de caras
n = 15; %número de lançamentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)>=k;
probSimulacao= sum(sucessos)/N