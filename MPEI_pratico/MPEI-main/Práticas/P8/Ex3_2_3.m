% Exercício 3 da parte 3.2
%% Alinea A- Por um processo supostamente iterativo
clear;clc;
N= 6; % nº de estados
%a.pt   b.es  c.fr  d.br  e.com  f.nl || Porque é por ordem alfabética
H= [0 0.5 0.5 0 1/4 0;
    1 0 0 0 1/4 0;
    0 0 0 1 1/4 0;
    0 0 0.5 0 1/4 1;
    0 0 0 0 0 0;
    0 0.5 0 0 0 0]

%Para verificar se é estocástica
sum(H);
(H >=0) & (H <=1);
% Se a matriz der só 1, é porque é estocástica

beta = 0.85;
saidas = sum(H);
H = H./saidas;
H(isnan(H)) = 0;

AGoogle = beta * H + (1-beta) * ones(N) /N;

pRank= ones(N,1)/N;
NewPRank = AGoogle * pRank;
while (sum(abs(NewPRank - pRank)) > 0.0001) % diferença de pagerank entre duas iterações não exceda 0.01 em valor absoluto para todas as páginas
    pRank= NewPRank;
    NewPRank = AGoogle * NewPRank;
end
NewPRank
disp("A melhor página é a D e a pior é a E");

%% Alinea B-Maneira feita pelo Miguel- Fez através do cálculo das probabilidades limite
% (A-I)u aumentada com u1+u2+u3+u4+u5+u6
M = [AGoogle-eye(6); ones(1,6)]; % 6 -> length(T)
x = [0 0 0 0 0 0 1]';
u = M\x;
fprintf("b) Probabilidades limite dos estados:\n" + ...
    "\ta.pt (%.5f), b.es (%.5f), c.fr (%.5f), d.br (%.5f), e.com (%.5f) e f.nl (%.5f)\n",u(1),u(2),u(3),u(4),u(5),u(6));