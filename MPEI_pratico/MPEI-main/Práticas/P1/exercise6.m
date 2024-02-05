%% Exercício 6
clear; clc
%% alinea a'

%Cálculo Simulado

N= 1e5; %número de experiências
p = 0.3; %probabilidade de ser defeituosa
k = 3; %número de peças defeituosas
n = 5; %amostra de peças
lancamentos = rand(n,N) > (1-p); % é preciso colocar (1-p) porque a probabilidade não é 50%!
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N

%Cálculo Teórico
probTeorico = ProbT_exercise5(k,n,p)

%% alínea b'

display("--------------------------------------------------------------------------------------")

%Cálculo Simulado

k = 2; %número de peças defeituosas
lancamentos = rand(n,N) > (1-p); % é preciso colocar (1-p) porque a probabilidade não é 50%!
sucessos= sum(lancamentos)<=k;
probSimulacao= sum(sucessos)/N

%Cálculo Teórico
probTeorico=0;
for k= 0:2
    probTeorico = probTeorico + ProbT_exercise5(k,n,p);% soma das probabilidades para quando o k é 0,1 ou 2 pois o valor teorico apenas funciona para k= um valor 
    % e não para a probabilidade de um suposto máximo
end
probTeorico

%% alínea c'
% Histograma representativo da distribuicao de probabilidades do numero de peças defeituosas da amostra

p= 0.7; %probabilidade de ser bem feita. Não é a prob. de ser defeituosa porque a funcao prob_exercise4(...) não está feita para tal
N= 1e6; %número de experiências
n=5; % numero de amostras
vp = zeros(1,5);
for k=0:n %faz-se k+1 porque os indices têm de ser inteiro, mas positivos.
    vp(k+1) = prob_exercise4(k,n,p,N);
end

stem(0:n,vp)
title("Alinea c")
xlabel("nº de amostras")
ylabel("Probabilidade")