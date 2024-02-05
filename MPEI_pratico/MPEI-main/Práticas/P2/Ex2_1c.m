%% Código 1 - segunda versão
%% Exercício 1.c

%Probabilidade de pelo menos um filho ser rapaz- vem da outra alinea
N= 1e5; % número de experiências
pM = 0.5; %probabilidade de ser rapaz
k = 1; %ter pelo menos um filho
n = 2; %número de filhos
fam = rand(n,N) < pM;

% Os dois rapazes
PAB = sum(fam) ==2;

%Em vez de de dividir por N, vamos dividir pela probabilidade de A (Calculada na alínea anterior)
pA = sum(fam) >=1;
probSimulacao2= PAB /pA % P(B|A)

