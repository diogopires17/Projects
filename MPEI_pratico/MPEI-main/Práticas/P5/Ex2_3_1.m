% Exercício 1 da parte 2.3
clear;clc;
p1 = 0.2/100; % probabilidade do componente 1 vir com defeito
p2 = 0.5/100; % probabilidade do componente 2 vir com defeito
pa = 1/100; % probabilidade de haver defeito na mensagem

%% Alínea A
n= 8; % número de brinquedos
N= 1e5;
exp1= rand(n,N)< p1;
exp2= rand(n,N)< p2;

exp_montagem = rand(n,N)< pa;
ex= exp1 | exp2 | exp_montagem;
casosfav= sum(ex)>0;   %identifica as caixas com pelo menos 1 brinquedo com defeito
probabilidade= sum(casosfav)/N

%% Alínea B
% A média de uma ditribuição Binomial é dada por n*p

casosfav = sum(sum(exp_montagem) > 0);
E_A = casosfav / N