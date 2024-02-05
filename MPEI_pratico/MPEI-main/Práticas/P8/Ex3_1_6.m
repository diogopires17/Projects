% Exercício 6 da parte 3.1
clear;clc;
T= [0.8 0 0 0.3 0;
    0.2 0.6 0 0.2 0;
    0 0.3 1 0 0;
    0 0.1 0 0.4 0
    0 0 0 0.1 1]
%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1);
% Se a matriz der só 1, é porque é estocástica

%% Alínea B
v = [1 0 0 0 0]'; %vetor de estado inicial, que começa no estado 1. Transposta para ser uma coluna
% Não é utilizado, mas podia sê-lo multiplicando este vetor por um
% semelhante a "prob" e depois retirando o valor v(2)

prob = zeros(1,100); % probabilidade
T2 = T; % cópia da matriz T
for n= 1:100
    prob(n)= T2(2,1); % começamos com esta linha, e assim temos o 1º valor, não é preciso definir fora
    T2 = T2*T;
    % outra maneira de fazer seria
    % v = T * v
    % prob(n) = v(2)
end
figure(1)
plot(1:100,prob);

%% Alínea C

prob3 = zeros(1,100); % probabilidade de estar no estado 3
prob5 = zeros(1,100); % probabilidade de estar no estado 3

TC = T; 
for n= 1:100
    prob3(n)= TC(3,1); % começamos com esta linha, e assim temos o 1º valor
    prob5(n)= TC(5,1); 
    TC = TC*T;
end
figure(2)
plot(1:100,prob3);
hold on
plot(1:100,prob5,"r");
hold off
grid on
% Em ambos os casos, o gráfico atinge um regime estacionário de
% probabilidade, a partir de n =30

%% Alínea D
% A matriz Q é a matriz dos estados transientes, pelo que a mesma é tirada
% da matriz T, quando esta está na forma canónica
% Contas feitas no papel. A matriz tem de continuar a ser estocástica
% Trocar também as linhas!!

Q= [0.8 0 0.3;0.2 0.6 0.2; 0 0.1 0.4];
% Se a matriz T estivesse na forma canonica, podiamos fazer a submatriz da
% matriz T fazendo Q= T(1:nena,1:nena) sendo nena o numero de estados não
% absorventes
%Para verificar se é estocástica
sum(Q);
(Q >=0) & (Q <=1);
% Se a matriz der só 1, é porque é estocástica

%% Alínea E
% Para calcular a matriz fundamental F, fazemos
%F = (I -Q)^-1
% Matriz identidade faz-se fazendo eye(size(Q))
% o significado de cada valor de F é o numero medio de transiçoes começando
% num estado e a passar no outro estado
F= (eye(size(Q)) - Q)^-1
% outra maneira de calcular
F = inv(eye(size(Q))-Q);

%% Alínea F
% A matriz fundamental dá as médias para X=n (Para entender melhor, ver
% slide 95 das Cadeias de Markov), pelo que para calcular o número de passos dos estados pedidos (estados transientes)
% basta somar a matriz F (fundamental)
E= sum(F)
fprintf("O número médio de passos até à absorção são %0.0f começando no estado 1,\n",E(1))
fprintf("%0.0f começando no estado 2 e %0.0f começando no estado 4\n",E(2),E(3))

%% Alínea G
% Para calcular as probabilidades de absorção, faz-se a matriz resto,
% proveniente da matriz T na forma canónica a multiplicar pela matriz F,
% Fundamental
% Explicação no Slide 104
R= [0 0.3 0;0 0 0.1];
% Se tivesses a matriz T na forma canonica, também podíamos calcular R da
% maneira R = T(nena+1:end; 1:nena)
B = R * F;
B(:,1)% é a coluna 1, porque a 2 e a 3 eram as probabilidade se começasse nesses estados