% Exercício 7 da parte 2.2
clear;clc;
%% Alínea A
lambda = 15; % média de 15 mensagens por segundo

%Pela Lei de Poisson    
% Probabilidade do servidor não receber nenhuma mensagem
k=0; % não receber qualquer mensagem
p_a= (lambda^k)/factorial(k) * exp(-lambda)

%% Alínea B
% Probabilidade do servidor receber mais de 10 mensagens
%Como não sabemos qual é o número máximo de mensagens  que podem ser
%recebidas num segundo, vamos calcular a probabilidade de receber menos/ou
%10 mensagens e depois fazer o complementar

prob= 0;
for k=0:10
    prob = prob + ((lambda^k)/factorial(k))*exp(-lambda);
end
prob_b = 1-prob