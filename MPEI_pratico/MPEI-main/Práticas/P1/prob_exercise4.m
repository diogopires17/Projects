function [probSimulacao] = prob_exercise4(k,n,p,N)
%calc prob k caras em n moedas
% se escrevermos help exercise4 no command window, aparece os comentários
% que escrevemos aqui
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N;
end