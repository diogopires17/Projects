% Exercício 3 da parte 3.1
clear;clc;
T= rand(20); % gera uma matriz 20 por 20
x = sum(T);

T = T./repmat(x,20,1); % método para garantir que a soma das colunas é 1, por causa
% de ser uma matriz de transição de estados

%% Alínea a
%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1)
% Se a matriz der só 1, é porque é estocástica

%% Alínea B
v= zeros(20,1); %vetor de estado inicial, que começa no estado 1
v(1)=1;
t2 = 2;
t5 = 5;
t10=10; % número de transiçoes
t100=100; % número de transiçoes

P2 = (T^t2) *v;
P5 = (T^t5) *v;
P10 = (T^t10) *v;
P100 = (T^t100) *v;
fprintf("A probabilidade para estar no estado 20, começando no estado 1, após 2,5,10 e 100 transições, \nrespetivamente são, em precentagem e com 5 casas decimais, %0.5f %% %0.5f %% %0.5f %% %0.5f %% %0.5f %%\n",P2(20)*100,P5(20)*100,P10(20)*100,P100(20)*100);
% Se fizermos 2 vezes o símbolo de percentagem seguidas dentro do fprintf,
% conseguimos que ele seja printado