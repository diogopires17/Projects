% Exercício 6 da parte 2.2
clear;clc;
%% Alínea A
N = 1e5;  % Número de Experiências
p = 1/1000; % Sabe-se que por cada 1000 chips, há um defeituoso

n = 8000; % Número de chips
k=7; % chips com defeito

% É a distribuição Binomial com p = 1/1000 e n= 8000
DBinomial = nchoosek(n,k)*p^k*(1-p)^(n-k)% nchoosek(n,k)= n!/(n-k)!/k!

%% Alínea B
lambda = n*p;
DPoisson= (lambda^k)/factorial(k) * exp(-lambda)

% A probabilidade pelas duas distribuições é a mesma