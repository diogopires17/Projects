%Miniteste 2017
clear; clc;
%% Ex 3
%a)
%  a   b   c   d   ? .
T=[0.7 0.2  0   0  0 0
   0.2  0  0.3  0  0 0
   0.1 0.6 0.3  0  0 0
   0   0.2 0.3 0.1 0 0
   0    0   0  0.4 1 0
   0    0  0.1 0.5 0 1];


%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1);
% Se a matriz der só 1, é porque é estocástica

%b)
% Carater 10 ser c
v0 = [1 0 0 0 0 0]';
P10 = (T^10) *v0; % 10 transições
fprintf("A probabilidade do primeiro caráter ser um 'c' é %.3f.\n",P10(3));

% Carater 15 ser d
P15 = (T^15) *v0; % 10 transições
fprintf("A probabilidade do primeiro caráter ser um 'c' é %.3f.\n",P15(4));

%c)
% Para calcular a média, é preciso a matriz fundamental, obtida antes
% através da matriz Q, que é a matriz dos estados trasientes.
% Como neste caso a matriz já vem na forma canonica (tivemos sorte),
% podemos obter Q através de 
Q = T(1:4,1:4);

% Cálculo da matriz fundamental
F= (eye(size(Q)) - Q)^-1;
% temos de somar sempre a matriz
E= sum(F);
fprintf("O número médio do comprimento das cadeias de carateres começando no estado c é %.0f.\n",E(3))

