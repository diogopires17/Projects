% Exercício 1 - Simulação de uma Cadeia de Markov
% Considere uma cadeia de Markov com três estados. Crie uma matriz de transição de estado e simule a evolução da cadeia de Markov por 5 passos.
% Definir a matriz de transição de estado
P = [0.4, 0.3, 0.3; 
     0.2, 0.5, 0.3;
     0.1, 0.2, 0.7];

% Estado inicial
estado_atual = 1;

% Simular a evolução da cadeia por 5 passos
num_passos = 5;
caminho = zeros(1, num_passos);

for i = 1:num_passos
    caminho(i) = estado_atual;
    % Escolher próximo estado de acordo com a matriz de transição
    estado_atual = randsample(1:3, 1, true, P(estado_atual, :));
end

disp('Caminho da Cadeia de Markov:');
disp(caminho);