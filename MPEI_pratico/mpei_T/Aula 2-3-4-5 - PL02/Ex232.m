% Questão 2 (a)
n = 8; % Número de brinquedos por caixa
num_simulacoes = 10000; % Número de simulações

caixas_com_defeito = 0;

% Simulação
for i = 1:num_simulacoes
    % Gerar n brinquedos e verificar se pelo menos um tem defeito
    if any(rand(1, n) <= defeito_montagem | ...
           rand(1, n) <= defeito_componente1 | ...
           rand(1, n) <= defeito_componente2)
        caixas_com_defeito = caixas_com_defeito + 1;
    end
end

% Estimar a probabilidade do evento A
probabilidade_A = caixas_com_defeito / num_simulacoes;

disp(['Estimativa da Probabilidade do Evento A: ', num2str(probabilidade_A)]);

% Questão 2 (b)
% Valor teórico da probabilidade do evento B
probabilidade_B_teorica = (1 - defeito_montagem) * (1 - defeito_componente1) * (1 - defeito_componente2);

disp(['Valor Teórico da Probabilidade do Evento B: ', num2str(probabilidade_B_teorica)]);

% Questão 2 (c)
% Simulações para desenhar o gráfico
n_values = 2:20; % Valores de n de 2 a 20
num_simulacoes = 1000; % Número de simulações para cada valor de n

probabilidades_B = zeros(1, length(n_values));

for j = 1:length(n_values)
    caixas_sem_defeito = 0;

    % Simulação para cada valor de n
    for i = 1:num_simulacoes
        % Gerar n brinquedos e verificar se nenhum tem defeito
        if ~any(rand(1, n_values(j)) <= defeito_montagem | ...
                rand(1, n_values(j)) <= defeito_componente1 | ...
                rand(1, n_values(j)) <= defeito_componente2)
            caixas_sem_defeito = caixas_sem_defeito + 1;
        end
    end

    % Estimar a probabilidade do evento B para o valor atual de n
    probabilidades_B(j) = caixas_sem_defeito / num_simulacoes;
end

% Plot do gráfico
plot(n_values, probabilidades_B, '-o');
xlabel('Capacidade da Caixa (n)');
ylabel('Probabilidade do Evento B');
title('Probabilidade do Evento B em Função da Capacidade da Caixa');
