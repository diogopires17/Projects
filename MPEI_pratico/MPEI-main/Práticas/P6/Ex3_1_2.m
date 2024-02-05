% Exercício 2 da parte 3.1
clear;clc;

% 2 estados: faltar(F) ou não Faltar (NF)
T= [1/3 0.25 0;
    1/3 11/20 0.5;
    1/3 1/5 0.5];
%% Alínea a
%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1);
% Se a matriz der só 1, é porque é estocástica

%% Alínea B
n= 90; % nº de alunos
v = [60 15 15]' /n;

%% Alínea C
Vc = (T^30) *v;
format short

NalunosA= Vc(1) *90;
NalunosB= Vc(2) *90;
NalunosC= Vc(3) *90;

fprintf("Grupo A %0.0f\n",NalunosA)
fprintf("Grupo B %0.0f\n",NalunosB)
fprintf("Grupo C %0.0f\n",NalunosC)

%% Alínea D
n= 90; % nº de alunos
v = [30 30 30]' /n;

Vc = (T^30) *v;
format short

NalunosA= Vc(1) *90;
NalunosB= Vc(2) *90;
NalunosC= Vc(3) *90;

fprintf("Grupo A com %0.0f\n",NalunosA)
fprintf("Grupo B %0.0f\n",NalunosB)
fprintf("Grupo C %0.0f\n",NalunosC)