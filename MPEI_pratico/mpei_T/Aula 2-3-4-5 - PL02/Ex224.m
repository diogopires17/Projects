% Parâmetros da simulação
num_simulacoes = 100000;

% Inicializar vetor para armazenar resultados
resultados = zeros(1, num_simulacoes);

% Simulação
for i = 1:num_simulacoes
    % Gere 5 números aleatórios representando defeituoso (1) ou não defeituoso (0)
    amostra = rand(1, 5) <= 0.3;
    
    % Calcule o número de peças defeituosas na amostra
    num_defeituosas = sum(amostra);
    
    % Armazene o resultado na matriz de resultados
    resultados(i) = num_defeituosas;
end

% Calcule a PMF estimada
pmf_estimada = histcounts(resultados, 0:5) / num_simulacoes;

% Certifique-se de que pmf_estimada tenha o mesmo número de elementos que o vetor de bins
pmf_estimada = [pmf_estimada, 0];

% Exiba a PMF estimada
bar(0:5, pmf_estimada);
xlabel('Número de Peças Defeituosas');
ylabel('Probabilidade');
title('PMF Estimada de X (Número de Peças Defeituosas em uma Amostra de 5)');

% Calcule a CDF estimada
cdf_estimada = cumsum(pmf_estimada);

% Exiba o gráfico da CDF estimada
stairs(0:5, cdf_estimada, 'LineWidth', 2);
xlabel('Número de Peças Defeituosas');
ylabel('Probabilidade Acumulada');
title('CDF Estimada de X (Número de Peças Defeituosas em uma Amostra de 5)');


% Calcule a probabilidade acumulada de no máximo 2 peças defeituosas
prob_maximo_2_defeituosas = sum(pmf_estimada(1:3));

% Exiba o resultado
fprintf('iii. Estimativa da probabilidade de no máximo 2 peças serem defeituosas: %.4f\n', prob_maximo_2_defeituosas);


% Parâmetros da distribuição binomial
n = 5; % tamanho da amostra
p = 0.3; % probabilidade de defeito

% Calcule a CDF analítica até 2 defeituosas
prob_maximo_2_defeituosas_analitica = binocdf(2, n, p);

% Exiba o resultado
fprintf('ii. Probabilidade analítica de no máximo 2 peças serem defeituosas: %.4f\n', prob_maximo_2_defeituosas_analitica);
