n = 8000; % número de tentativas
p = 1/1000; % probabilidade de sucesso
k = 7; % número de sucessos desejados

prob_binomial = binopdf(k, n, p);
disp(['Probabilidade (binomial): ', num2str(prob_binomial)]);


lambda = n * p;

prob_poisson = poisspdf(k, lambda);
disp(['Probabilidade (Poisson): ', num2str(prob_poisson)]);
