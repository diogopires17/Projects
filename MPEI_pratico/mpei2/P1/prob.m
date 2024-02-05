function [probSimulacao] = prob(k, n, p , N)
% calc prob k cartas em n moedas
% Uso prob(nr caras, nr lancamentos, prob de cara, nr experiencias)

% mais comentários

lancamentos = rand(n, N) > p;

sucessos = sum(lancamentos)==k;

probSimulacao = sum(sucessos)/N;

end