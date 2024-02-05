% Questão 3
% Análise da variável aleatória X (número de brinquedos defeituosos numa caixa)

% Parâmetros
n_values = [8, 16]; % Valores de n para análise
num_simulacoes = 10000; % Número de simulações para cada valor de n

% Inicialização de variáveis
defeitos_por_caixa = zeros(num_simulacoes, length(n_values));

for j = 1:length(n_values)
    n = n_values(j);

    % Simulações para cada valor de n
    for i = 1:num_simulacoes
        % Gerar n brinquedos e contar o número de defeituosos
        defeitos_por_caixa(i, j) = sum(rand(1, n) <= defeito_montagem | ...
                                        rand(1, n) <= defeito_componente1 | ...
                                        rand(1, n) <= defeito_componente2);
    end
end

% Parte (a) - Estimar a função massa de probabilidade pX(x) de X para n = 8 brinquedos
figure;
hist(defeitos_por_caixa(:, 1), unique(defeitos_por_caixa(:, 1)) - 0.5, 'FaceColor', 'b', 'EdgeColor', 'b', 'LineWidth', 1.5);
xlabel('Número de Brinquedos Defeituosos (X)');
ylabel('Frequência Relativa');
title('Histograma de X para n = 8');
xticks(unique(defeitos_por_caixa(:, 1)));
grid on;

% Parte (b) - Calcular a probabilidade de X >= 2 para n = 8 brinquedos
prob_X_maior_ou_igual_a_2_n8 = sum(defeitos_por_caixa(:, 1) >= 2) / num_simulacoes;
fprintf('Probabilidade de X >= 2 para n = 8: %.4f\n', prob_X_maior_ou_igual_a_2_n8);

% Parte (c) - Calcular média, variância e desvio padrão de X para n = 8 brinquedos
media_X_n8 = mean(defeitos_por_caixa(:, 1));
variancia_X_n8 = var(defeitos_por_caixa(:, 1));
desvio_padrao_X_n8 = std(defeitos_por_caixa(:, 1));
fprintf('Média de X para n = 8: %.4f\n', media_X_n8);
fprintf('Variância de X para n = 8: %.4f\n', variancia_X_n8);
fprintf('Desvio Padrão de X para n = 8: %.4f\n', desvio_padrao_X_n8);

% Parte (d) - Repetir para n = 16 brinquedos
figure;
hist(defeitos_por_caixa(:, 2), unique(defeitos_por_caixa(:, 2)) - 0.5, 'FaceColor', 'r', 'EdgeColor', 'r', 'LineWidth', 1.5);
xlabel('Número de Brinquedos Defeituosos (X)');
ylabel('Frequência Relativa');
title('Histograma de X para n = 16');
xticks(unique(defeitos_por_caixa(:, 2)));
grid on;

prob_X_maior_ou_igual_a_2_n16 = sum(defeitos_por_caixa(:, 2) >= 2) / num_simulacoes;
fprintf('Probabilidade de X >= 2 para n = 16: %.4f\n', prob_X_maior_ou_igual_a_2_n16);

media_X_n16 = mean(defeitos_por_caixa(:, 2));
variancia_X_n16 = var(defeitos_por_caixa(:, 2));
desvio_padrao_X_n16 = std(defeitos_por_caixa(:, 2));
fprintf('Média de X para n = 16: %.4f\n', media_X_n16);
fprintf('Variância de X para n = 16: %.4f\n', variancia_X_n16);
fprintf('Desvio Padrão de X para n = 16: %.4f\n', desvio_padrao_X_n16);
