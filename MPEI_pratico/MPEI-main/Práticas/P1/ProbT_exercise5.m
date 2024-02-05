%% Codigo 2- cálculo analítico de probabilidade em séries experiências de Bernoulli
function pt = ProbT_exercise5(k,n,p)
% calc teorico
pt = nchoosek(n,k)*p^k*(1-p)^(n-k);% nchoosek(n,k)= n!/(n-k)!/k!