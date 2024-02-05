%% Codigo 2- cálculo analítico de probabilidade em séries experieˆncias de Bernoulli
% Dados relativos ao problema 1

p = 0.5; % probabilidade de sair cara
k = 6;   % Número de caras
n = 15;   % nr lancamentos
proba = nchoosek(n,k) * p^k * (1-p)^(n-k);  % nchoosek(n,k)= n!/(n-k)!/k!

disp(proba)