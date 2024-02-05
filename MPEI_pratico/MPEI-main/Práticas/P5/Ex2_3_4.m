% Exercício 4 da parte 2.3
%% Alínea A
clear;clc;

p1 = 0.2/100; % probabilidade do componente 1 vir com defeito
p2 = 0.5/100; % probabilidade do componente 2 vir com defeito
pa = 0.1/100; % probabilidade de haver defeito na montagem

n= 20; % número de brinquedos
N= 1e5;
ex= rand(n,N)<=p1 | rand(n,N)<=p2 | rand(n,N)<=pa;

m= 1; % processo de garantia de qualidade escolher um brinquedo da caixa
casos_fav= 0;
for i=1:N
  casos_fav= casos_fav+(~ex(randi(n),i));
end
fprintf('4a) Prob= %6f\n',casos_fav/N);