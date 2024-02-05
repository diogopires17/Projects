% Exercício 1 da parte 2.2
% Alínea A
%% Funcão de Massa Probabilidade
Sx = 1:6;

 % p(1)=1/6
probs= ones(6)/6;
stem(Sx,probs);
xlabel("x_i");
ylabel("Probabilidade  P[X =x_i]");
title("Funcao massa de probabilidade (aka FMP) de X");
axis([0 6.5 0 0.3]);

% Alínea B
%% Funcão de Distribuiçao Acumulada

pacusum1 = cumsum(probs);
stairs(Sx,pacusum1)