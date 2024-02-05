% Exemplo 4 - Simulação de Lançamento de Moedas
% Simule o lançamento de uma moeda justa (cara ou coroa) 500 vezes e calcule a proporção de caras.
% Número de simulações
num_simulacoes_moeda = 500;

% Simular o lançamento da moeda (1 para cara, 2 para coroa)
resultados_moeda = randi([1, 2], 1, num_simulacoes_moeda);

% Calcular a proporção de caras
proporcao_caras = sum(resultados_moeda == 1) / num_simulacoes_moeda;

disp('Proporção de Caras:');
disp(proporcao_caras);