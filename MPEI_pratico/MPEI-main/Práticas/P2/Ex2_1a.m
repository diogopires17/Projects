%% Código 1 - segunda versão
%% Exercício 1.a

N= 1e5; % número de experiências
pM = 0.5; %probabilidade de ser rapaz
k = 1; %ter pelo menos um filho
n = 2; %número de filhos
fam = rand(n,N) < pM;
sucessos= sum(fam)>=k;
probSimulacao= sum(sucessos)/N

%% Alínea 1.b- Valor Teórico

Probabilidade= 1/4 % MM; MF; FM; FF