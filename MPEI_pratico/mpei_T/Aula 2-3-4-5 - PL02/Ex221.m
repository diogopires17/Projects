% Defina os valores de X e suas probabilidades
valores_X = [1, 2, 3, 4, 5, 6];
probabilidades = [1/6, 1/6, 1/6, 1/6, 1/6, 1/6];

% Crie o gráfico da PMF
subplot(2, 1, 1); % Crie um subplot (2 linhas, 1 coluna) e selecione o primeiro
% Crie o gráfico da PMF
stem(valores_X, probabilidades);
xlabel('Valores de X (Face do dado)');
ylabel('Probabilidade');
title('Função Massa de Probabilidade de X (Lançamento de um Dado)');
ylim([0, 1]);
grid on;

% Calcule a função de distribuição acumulada (CDF)
cdf = cumsum(probabilidades);

% Crie o gráfico da CDF usando stairs
subplot(2, 1, 2); % Selecione o segundo subplot
stairs(valores_X, cdf);
xlabel('Valores de X (Face do dado)');
ylabel('Probabilidade Acumulada');
title('Função de Distribuição Acumulada de X (Lançamento de um Dado)');
ylim([0, 1]);
grid on;
