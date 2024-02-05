% Exercício 7 da parte 3.1
%% Alinea A
clear;clc;
N=6; % número de estados
H= [0  0  0  0  1/3  0 
    1  0  0  0  1/3  0
    0  1/2 0 1   0   0
    0  0  1  0   0   0
    0  1/2 0 0   0   0
    0  0  0  0  1/3  1];
%Para verificar se é estocástica
sum(H);
(H >=0) & (H <=1);
% Se a matriz der só 1, é porque é estocástica

pRank = ones(N,1)/N;  % page rank

n=10;
for i=1:n
    pRank= H * pRank;
end
pRank
%% Alinea B
% Identifique a "spider trap"e o "dead-end” contidos neste conjunto de páginas.
disp("O dead end é a pagina F e spider-trap são as paginas C e D\n")

%% Alinea C
H2=H;
H2(:,6) = 1/N; % Para resolver os problemas de "dead-end", divide-se 1 pelo número de estados

%Para verificar se é estocástica
sum(H2);
(H2 >=0) & (H2 <=1);
% Se a matriz der só 1, é porque é estocástica

pRank2 = ones(6,1)/6;  % page rank
n=10; % nº de iteraçoes
for i=1:n
    pRank2= H2 * pRank2;
end
pRank2

%% Alinea D
beta = 0.8;
HwithTP = beta * H2 + (1-beta) * ones(N) /N;

%Para verificar se é estocástica
sum(HwithTP);
HwithTP>=0 & HwithTP<=1;
% Se a matriz der só 1, é porque é estocástica

r= ones(N,1)/N;
for i=1:10
    r = HwithTP*r;
end
r

%% Alinea E
rElast = ones(1,6)'*1/6;
rEnew = rElast;
n = 0;
while true
    rEnew = HwithTP*rElast;
    n = n + 1;
    testMat = rEnew - rElast;
    if testMat<=10^-4
        break
    end
    rElast = rEnew;
    
end

rEnew % Os valores da nova matriz do page rank são parecidos 
% com os da alíena anterior,porque já tínhamos resolvido os problemas de
% "dead-end" e "spider-trap"
fprintf("São necessárias %0.f iterações\n",n);