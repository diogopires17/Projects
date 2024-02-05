% Número de simulações
num_simulacoes = 100000;

% Inicialize o vetor para armazenar os resultados
resultados = zeros(1, num_simulacoes);

% Simulação
for i = 1:num_simulacoes
    % Gere 4 lançamentos aleatórios (1 para cara, 2 para coroa)
    lancamentos = randi([1, 2], 1, 4);
    
    % Calcule o número de coroas (2s) nos lançamentos
    num_coroas = sum(lancamentos == 2);
    
    % Armazene o resultado na matriz de resultados
    resultados(i) = num_coroas;
end

% Calcule a PMF estimada
pmf_estimada = histcounts(resultados, 0:5) / num_simulacoes;

% Exiba a PMF estimada
bar(0:4, pmf_estimada);
xlabel('Número de Coroas');
ylabel('Probabilidade');
title('PMF Estimada de X (Número de Coroas em 4 Lançamentos)');


% Alinea B)
% Números possíveis de coroas (0 a 4)
num_coroas = 0:4;

% Calcule o valor esperado (E[X])
valor_esperado = sum(num_coroas .* pmf_estimada);

% Calcule a variância (Var(X))
variancia = sum((num_coroas - valor_esperado).^2 .* pmf_estimada);

% Calcule o desvio padrão (sigma)
desvio_padrao = sqrt(variancia);

% Exiba os resultados
fprintf('Valor Esperado (E[X]): %.2f\n', valor_esperado);
fprintf('Variância (Var(X)): %.2f\n', variancia);
fprintf('Desvio Padrão (sigma): %.2f\n', desvio_padrao);

% Alinea D)
% Números possíveis de coroas (0 a 4)
num_coroas = 0:4;

% Parâmetros da distribuição binomial
n = 4; % número de tentativas (lançamentos)
p = 0.5; % probabilidade de sucesso (coroa)

% Calcule os valores teóricos da PMF
pmf_teorica = zeros(size(num_coroas));

for x = num_coroas
    pmf_teorica(x+1) = nchoosek(n, x) * p^x * (1-p)^(n - x);
end

% Exiba os resultados teóricos e estimados
disp('Valores Teóricos:');
disp(pmf_teorica);

disp('Valores Estimados por Simulação:');
disp(pmf_estimada);

% Alinea E)
% Parâmetros da distribuição binomial
n = 4; % número de tentativas (lançamentos)
p = 0.5; % probabilidade de sucesso (coroa)

% Calcula os valores teóricos de E[X] e Var(X)
valor_esperado_teorico = n * p;
variancia_teorica = n * p * (1 - p);

% Exibe os resultados teóricos e estimados
fprintf('Valor Esperado Teórico (E[X]): %.2f\n', valor_esperado_teorico);
fprintf('Variância Teórica (Var(X)): %.2f\n', variancia_teorica);


% Aline F)
% Parâmetros da distribuição binomial
n = 4; % número de tentativas (lançamentos)
p = 0.5; % probabilidade de sucesso (coroa)

% Probabilidade de obter pelo menos 2 coroas (1 - P(X <= 1))
prob_pelo_menos_2_coroas = 1 - (nchoosek(n, 0) * p^0 * (1-p)^(n-0) + nchoosek(n, 1) * p^1 * (1-p)^(n-1));

% Probabilidade de obter até 1 coroa (P(X <= 1))
prob_ate_1_coroa = nchoosek(n, 0) * p^0 * (1-p)^(n-0) + nchoosek(n, 1) * p^1 * (1-p)^(n-1);

% Probabilidade de obter entre 1 e 3 coroas (P(1 <= X <= 3))
prob_entre_1_e_3_coroas = nchoosek(n, 1) * p^1 * (1-p)^(n-1) + nchoosek(n, 2) * p^2 * (1-p)^(n-2) + nchoosek(n, 3) * p^3 * (1-p)^(n-3);

% Exiba os resultados
fprintf('i. Probabilidade de obter pelo menos 2 coroas: %.4f\n', prob_pelo_menos_2_coroas);
fprintf('ii. Probabilidade de obter até 1 coroa: %.4f\n', prob_ate_1_coroa);
fprintf('iii. Probabilidade de obter entre 1 e 3 coroas: %.4f\n', prob_entre_1_e_3_coroas);


function result = nchoosek(n, k)
    result = factorial(n) / (factorial(k) * factorial(n - k));
end