clear; clc;
%% Ex 1
%a)
%  1     2  3     4     5     meta
T=[0     0  0     0     0      0
   0.2   0  0     0     0      0
   0     0  0     0.1   0.45   0
   0     0  0.3   0     1-0.45 0
   1-0.2 0  1-0.3 0     0      0
   0     1  0     1-0.1 0      1];

alfa = [0.2 0.3 0.1 0.45]';
v0= [1 0 0 0 0 0]';
%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1);
% Se a matriz der só 1, é porque é estocástica
%%
%b)
% Percurso com menos casas é ir do 1 para 5, 4 e depois meta
% P(Meta| 4 e 5)
T2 = (T^1) * v0;
v0= T2;

T3 = (T^2) *v0;
v0=T3;

TMeta= (T^3) *v0
fprintf("Prob %.04f\n",TMeta(6));

%c)
% Para calcular a média, é preciso a matriz fundamental, obtida antes
% através da matriz Q, que é a matriz dos estados trasientes.
% Como neste caso a matriz já vem na forma canonica (tivemos sorte),
% podemos obter Q através de 
Q = T(1:5,1:5);

% Cálculo da matriz fundamental
F= (eye(size(Q)) - Q)^-1
% temos de somar sempre a matriz
E= sum(F);
fprintf("O número médio de casas percorridas %.f.\n",E(1)) % E(1) pq começa na casa inicial

