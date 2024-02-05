% Exercício 3 - Simulação de Lançamento de Dados
% Simule o lançamento de um dado justo 1000 vezes e calcule a frequência de ocorrência de cada número.
% Número de simulações
num_simulacoes = 1000;

% Simular o lançamento do dado
resultados = randi([1, 6], 1, num_simulacoes);

% Calcular a frequência de cada número
frequencia = histogram(resultados, 1:6) / num_simulacoes;

disp('Frequência de Ocorrência de Cada Número:');
disp(frequencia);