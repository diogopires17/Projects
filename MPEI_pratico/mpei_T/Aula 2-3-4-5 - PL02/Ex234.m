% Questão 4
% Simulações para avaliar o impacto da melhoria no processo de montagem e garantia de qualidade

% Parâmetros
n = 20; % Capacidade da caixa
m_values = 1:n-1; % Valores de m para teste

% Probabilidades de defeitos nos componentes e no processo de montagem
defeito_componente1 = 0.002;
defeito_componente2 = 0.005;
defeito_montagem = 0.001;

% Número de simulações para cada valor de m
num_simulacoes = 10000;

% Inicialização de variáveis
caixas_comerciabilizadas = zeros(num_simulacoes, length(m_values));

% Simulações para cada valor de m
for j = 1:length(m_values)
    m = m_values(j);

    % Simulações para cada valor de m
    for i = 1:num_simulacoes
        % Gerar n brinquedos e contar o número de defeituosos
        defeitos = sum(rand(1, n) <= defeito_montagem | ...
                       rand(1, n) <= defeito_componente1 | ...
                       rand(1, n) <= defeito_componente2);

        % Testar m brinquedos selecionados
        defeitos_testados = sum(randperm(n, m) <= defeitos);
        
        % Caixa comercializável se nenhum brinquedo testado estiver defeituoso
        caixas_comerciabilizadas(i, j) = (defeitos_testados == 0);
    end
end

% Parte (a) - Estimar a probabilidade de uma caixa ser comercializada para cada valor de m
prob_comercializacao = mean(caixas_comerciabilizadas);
figure;
plot(m_values, prob_comercializacao, 'o-', 'LineWidth', 1.5);
xlabel('Número de Brinquedos Testados (m)');
ylabel('Probabilidade de Comercialização');
title('Impacto da Garantia de Qualidade na Comercialização de Caixas');
grid on;

% Parte (b) - Estimar o menor valor de m necessário para garantir 90% de probabilidade de comercialização
indice_m_90_percent = find(prob_comercializacao >= 0.9, 1, 'first');
m_90_percent = m_values(indice_m_90_percent);
fprintf('Menor valor de m para 90%% de probabilidade de comercialização: %d\n', m_90_percent);
