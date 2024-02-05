% Exercício 4 da parte 3.1
clear;clc;
%% Alínea a
p= 0.4;
q=0.6;
T= [(p)^2 0 0 (q)^2;(1-p)^2 0 0 q*(1-q); p*(1-p) 0 0 q*(1-q);p*(1-p) 1 1 (1-q)^2]
%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1);
% Se a matriz der só 1, é porque é estocástica

%% Alínea b
v= [1 0 0 0]'; %vetor de estado inicial, que começa no estado A
t5 = 5;
t10 = 10;
t100 = 100;
t200=200; % número de transiçoes

T5 = (T^t5) *v; % matriz ao final de 5 transições
P5 =[T5(1) T5(2) T5(3) T5(4)]

T10 = (T^t10) *v; % matriz ao final de 10 transições
P10 =[T10(1) T10(2) T10(3) T10(4)]

T100 = (T^t100) *v; % matriz ao final de 100 transições
P100 =[T100(1) T100(2) T100(3) T100(4)]

T200 = (T^t200) *v; % matriz ao final de 200 transições
P200 =[T200(1) T200(2) T200(3) T200(4)]

%% Alínea C

b = [zeros(4,1);1];
M = [T - eye(size(T)) ; ones(1,4)];

u = M\b % Probabilidades limite. Atenção que a divisão é com \



