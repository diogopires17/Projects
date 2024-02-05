% Questão 1 (a)
n = 8; % Número de brinquedos por caixa
num_simulacoes = 10000; % Número de simulações

defeito_montagem = 0.01; % Probabilidade de defeito devido ao processo de montagem
defeito_componente1 = 0.002; % Probabilidade de defeito no componente 1
defeito_componente2 = 0.005; % Probabilidade de defeito no componente 2

% Simulação
caixas_com_defeito = 0;
for i = 1:num_simulacoes
    % Gerar n brinquedos e verificar se pelo menos 1 tem defeito
    brinquedos_defeituosos = sum(rand(1, n) <= defeito_montagem | rand(1, n) <= defeito_componente1 | rand(1, n) <= defeito_componente2) > 0;
    
    % Se pelo menos 1 brinquedo tem defeito, contabilizar a caixa
    if any(brinquedos_defeituosos)
        caixas_com_defeito = caixas_com_defeito + 1;
    end
end

% Estimar a probabilidade do evento A
prob_A = caixas_com_defeito / num_simulacoes;

disp(['Estimativa da Probabilidade do Evento A: ', num2str(prob_A)]);

% Questão 1 (b)
n = 8; % Número de brinquedos por caixa
num_simulacoes = 10000; % Número de simulações

defeito_montagem = 0.01; % Probabilidade de defeito devido ao processo de montagem
defeito_componente1 = 0.002; % Probabilidade de defeito no componente 1
defeito_componente2 = 0.005; % Probabilidade de defeito no componente 2

defeitos_apenas_montagem = zeros(1, num_simulacoes);

% Simulação
for i = 1:num_simulacoes
    % Gerar n brinquedos e contar quantos têm defeito apenas devido ao processo de montagem
    defeitos_apenas_montagem(i) = sum(rand(1, n) <= defeito_montagem & ...
                                       rand(1, n) > defeito_componente1 & ...
                                       rand(1, n) > defeito_componente2);
end

% Estimar o número médio de brinquedos defeituosos apenas devido ao processo de montagem
media_defeitos_montagem = mean(defeitos_apenas_montagem);

disp(['Estimativa do Número Médio de Brinquedos Defeituosos (Montagem): ', num2str(media_defeitos_montagem)]);

