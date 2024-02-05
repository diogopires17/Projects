%Miniteste 2017
clear; clc;
%% Ex 2
N=5; % número de estados
%a) 
%   C    D   E   F   G
H= [0   1/2  1/3 1/4 0 
    1/2  0   0   1/4 1/2
    1/2 1/2  1/3 1/4 0
    0    0   0   0   1/2
    0    0   1/3 1/4 0];

beta = 0.8;
HGoogle = beta * H + (1-beta) * ones(N) /N;

%Para verificar se é estocástica
sum(HGoogle)
HGoogle>=0 & HGoogle<=1
% Se a matriz der só 1, é porque é estocástica
HGoogle % Resposta à A

%b) 
n= 10;
pRank= ones(N,1)/N; % matriz onde vão ficar os valores de Page Rank
for i=1:n
    pRank = HGoogle*pRank;
end
pRank