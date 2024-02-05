% Exercício 1 da parte 3.1
clear;clc;

% 2 estados: faltar(F) ou não Faltar (NF)
T= [0.2 0.3;
    0.8 0.7];

%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1);

%% Alínea a
%  Probablilidade de esta na aula da quarta seguinte,
% sabendo que esteve na quarta
v= [0 1]';

v2 = T *v; % probabilidades de estar na sexta
v3 = T *v2; % probabilidade de estar na quarta
% Também podemos fazer isto a fazer T^2  ou seja o número de transiçoes a
% levantar a T

fprintf("Alinea A %f\n",v3(2))

%% Alínea b
%  Probablilidade de esta na aula da quarta seguinte,
% sabendo que esteve na quarta
v= [1 0]';

v2 = T *v; % probabilidades de estar na sexta
v3 = T *v2; % probabilidade de estar na quarta
fprintf("Alinea B %0.4f\n",v3(2))

%% Alínea c
v= [0 1]';

Vc = (T^29) * v;% é levantado a 29, porque a primeira aula já está definida
fprintf("Alinea C %0.4f\n",v3(2))

%% Alínea d
n= 30; % numero de aulas
v= [0.15 0.85]';
VEF= zeros(1,n);
VEF(1) = v(1);

for i=1:(n-1)
    v = T^i * v;
    VEF(i+1) = v(1);
end
plot(1:n,VEF)
axis([0 31 0.1 0.3])

