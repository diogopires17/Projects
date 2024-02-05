% Exercício 2 da parte 2.2
%% Alínea A
clear;clc;
N = 1e5;  % Número de Experiências
m = 100;
n=1;

n5 =90; %  notas de 5 euros
n50 =9;
n100 =1;
NumProgramasTotal = 100; % numero de notas totais

experiencias   =  randi(m, n, N);

aux5 = 0;
aux50 = 0;
aux100 = 0;

for col=1:N
    % A – a soma dos dois valores é igual a 9
    if experiencias(1,col) <= n5
        aux5 = aux5 +1; % notas de 5€
    elseif experiencias(1,col) == 100
        aux100 = aux100 +1; % notas de 100€
    else
        aux50 = aux50 +1; % notas de 50€
    end
end
prob5 = aux5 / N
prob50 = aux50 / N
prob100 = aux100 / N

%% Alínea B
% Funcão de Massa Probabilidade

Sx = [5 50 100];

probs= [prob5 prob50 prob100];
subplot(1,2,2)
stem(Sx,probs);
xlabel("x_i");
ylabel("Probabilidade  P[X =x_i]");
title("Funcao massa de probabilidade (aka FMP) de SX");
axis([5 101 0 1]);

%% Alínea C
% Funcão de Distribuiçao Acumulada

pacusum1 = cumsum(probs);
stairs([0 Sx 100],[0 pacusum1 1]) % maneira que o amorim disse para dar certo
subplot(1,2,1)

% o primeiro subplot está mal nos eixos, por causa da janela