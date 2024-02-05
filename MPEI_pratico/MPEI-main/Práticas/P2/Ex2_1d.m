clear;clc;
%% Exercício 1.d
N= 1e5; % número de experiências
pM = 0.5; %probabilidade de ser rapaz
n = 2; %número de filhos
fam = rand(n,N) < pM;

% O segundo também ser rapaz
PAB = sum(sum(fam) ==2);
%sabendo que o primeiro é rapaz
PA= sum(fam(1,:));
prob= PAB/PA % P(B|A)

% Valor Teorico
pTeorico = 0.5
