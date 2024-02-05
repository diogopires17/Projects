%% Código 1 - segunda versão

N= 1e5; %número de experieˆncias
p = 0.5; %probabilidade de cara
k = 2; %número de caras
n = 3; %número de lançamentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao = sum(sucessos)/N;
disp(['A percentagem de sair cara em 2 dos 3 lançamentos é ',num2str(probSimulacao*100),'%']);