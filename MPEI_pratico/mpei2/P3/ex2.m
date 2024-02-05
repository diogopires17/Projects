clear;
clc;

%% Alinea a)
T = [1/3 1/4 0;
     1/3 11/20 1/2;
     1/3 1/5 1/2];
% trata-se de uma matriz estocastica pois todoas as entradas sao não
% negativas e os valores em cada coluna somados dão sempre resultado 1
sum(T);
%% Alinea b)

v = [60/90; 15/90; 15/90];

%% Alinea c)

c = T^30 * v;

disp("Alinea c)")
disp("Alunos A: " + c(1)*90)
disp("Alunos B: " + c(2)*90)
disp("Alunos c: " + c(3)*90)

%% Alinea d)
v = [30/90; 30/90; 30/90];
d = T^30 * v;

disp("Alinea d)")
disp("Alunos A: " + d(1)*90)
disp("Alunos B: " + d(2)*90)
disp("Alunos c: " + d(3)*90)



