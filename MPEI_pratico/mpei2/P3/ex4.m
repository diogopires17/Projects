clear;
clc;

%% Alinea a)

p = 0.4;
q = 0.6;

T = [ p^2     0 0 q^2;
      (1-p)^2 0 0 q*(1-q);
      p*(1-p) 0 0 q*(1-q)
      p*(1-p) 1 1 (1-q)^2];

%% Alinea b)
sum(T); % Soma das colunas dá 1
T>=0 & T<=1;

v = [1 0 0 0]';

%T5 = T^5

v5 = (T^5)*v
v10 = (T^10)*v
v100 = (T^100)*v
v200 = (T^200)*v

%% Alinea c)
M = [T - eye(4,4); 1 1 1 1] ;
b = [0; 0; 0; 0; 1];

u = M\b
% x = A\B solves the system of linear equations A*x = B.

% O vetor estado estacionario tera os mesmos valores de qualquer uma das
% colunas a matriz resultante de T^x * v para valores de x muito elevados.
