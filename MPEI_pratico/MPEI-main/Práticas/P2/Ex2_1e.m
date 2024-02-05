clear;clc;
%% Exercício 1.e
N= 1e5;
pM = 0.5; %probabilidade de ser rapaz
n = 5; %número de filhos
fam = rand(n,N) < pM;

cfav1= sum(sum(fam)>=1); %probabilidade de pelo menos um filho ser rapaz
p1 = cfav1/N;

cfav2= sum(sum(fam)==2); % probabilidade de serem 2 rapazes

probSimulacao= cfav2/cfav1

%% Exercício 1.f

cfav2= sum(sum(fam)>=2); % probabilidade de pelo menos um dos outros filhos ser também rapaz,
% ou seja, serem 2 ou mais filhos
probSimulacao= cfav2/cfav1