% Exemplo 5 - Distribuição Binomial
% Simule 1000 experimentos de lançamento de uma moeda justa (cara ou coroa) 10 vezes em cada experimento. Calcule a frequência de obter exatamente 5 caras em cada experimento.
% Número de experimentos
num_experimentos_binomial = 1000;
% Número de lançamentos em cada experimento
num_lancamentos_binomial = 10;

% Simular os experimentos
resultados_experimentos = randi([1, 2], num_experimentos_binomial, num_lancamentos_binomial);

% Contar o número de caras em cada experimento
num_caras_por_experimento = sum(resultados_experimentos == 1, 2);

% Calcular a frequência de obter exatamente 5 caras
frequencia_5_caras = sum(num_caras_por_experimento == 5) / num_experimentos_binomial;

disp('Frequência de Obter Exatamente 5 Caras:');
disp(frequencia_5_caras);