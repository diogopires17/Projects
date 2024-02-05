%% Codigo 2- ca´lculo analı´tico de probabilidade em se´ries experieˆncias de Bernoulli
% Dados relativos ao problema 1
p = 0.5;
k = 6;  % numero de caras
n = 15;  % numero de lançamentos
prob= nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!
disp([num2str(prob*100),'%'])