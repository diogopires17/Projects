esp_amost = [5, 50, 100];
prob = [0.9, 0.09, 0.01];

disp(esp_amost);
disp(['Espaço de amostragem: ', num2str(esp_amost)]);
disp(['Probabilidades (5€/50€/100€): ', num2str(prob)]);

% Crie o gráfico da PMF
subplot(2, 1, 1); % Crie um subplot (2 linhas, 1 coluna) e selecione o primeiro

% Crie o gráfico da PMF
stem(esp_amost, prob);
xlabel('Valores de X (Espaço de amostragem)');
ylabel('Probabilidade');
title('Função Massa de Probabilidade de X (Retirar nota da caixa)');
ylim([0, 1]);
grid on;

% Calcule a função de distribuição acumulada (CDF)
cdf = cumsum(prob);

% Crie o gráfico da CDF usando stairs
subplot(2, 1, 2); % Selecione o segundo subplot
stairs(esp_amost, cdf);
xlabel('Valores de X (Espaço de amostragem)');
ylabel('Probabilidade Acumulada');
title('Função de Distribuição Acumulada de X (Retirar nota da caixa)');
ylim([0, 2]);
grid on;


% Número de lançamentos
n_lancamentos = 4;

% Número de simulações
n_simulacoes = 10000;

% Inicialize um vetor para armazenar os resultados das simulações
resultados = zeros(1, n_simulacoes);

% Realize as simulações
for i = 1:n_simulacoes
    % Simule 4 lançamentos de uma moeda equilibrada (0 para cara, 1 para coroa)
    lancamentos = randi([0, 1], 1, n_lancamentos);
    
    % Calcule o número de coroas (somas dos 1s)
    num_coroas = sum(lancamentos);
    
    % Armazene o resultado da simulação
    resultados(i) = num_coroas;
end

% Calcule a PMF estimada contando as ocorrências de cada resultado
pmf_estimada = zeros(1, n_lancamentos + 1);
for i = 0:n_lancamentos
    pmf_estimada(i + 1) = sum(resultados == i) / n_simulacoes;
end

