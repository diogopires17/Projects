%%                              ex2

N= 1e5; %nu´mero de experieˆncias
p = 0.5; %probabilidade de cara
k = 2; %nu´mero de caras
n = 3; %nu´mero de lanc¸amentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N;

fprintf("A probilidade é: %.5f\n", probSimulacao);




