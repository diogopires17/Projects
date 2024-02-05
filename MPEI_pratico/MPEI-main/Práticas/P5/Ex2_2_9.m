% Exercício 9 da parte 2.2
clear;clc;

E_X = 14; % média
DesP = 2; % desvio padrão
N= 1e6;
sigma= 2;
miu= 14;
X = randn(1,N)*sigma+miu;
m = mean(X);  % calcula a média
s = std(X); % calcula o desvio padrao
fprintf(1,"\n\nmedia= %.3f\ndesvio padrao = %.3f",m,s)
clf
hist(X,100);
%% Alínea A
cf = sum(X>12 & X<16);
pA = cf/N % um aluno do curso ter uma classificação entre 12 e 16;

%% Alínea B
cf = sum(X>10 & X<18);
pB = cf/N % os alunos terem classificação entre 10 e 18;

%% Alínea C
cf = sum(X>=10);
pC = cf/N % ter classificação maior ou igual a 10);
%% Alínea D
p_aT = normcdf(16,14,2)-normcdf(12,14,2) % verificar teoricamente a alinea a
fprintf("\tprobA = "+ probA);
probB = normcdf(18,14, 2) - normcdf(10,14, 2);
fprintf("\n\tprobB = "+ probB);
probC = normcdf(20,14, 2) - normcdf(10,14, 2);
fprintf("\n\tprobC = "+ probC + "\n");