% Parâmetros
n_dardos = 20;   % Número de dardos
m_alvos = 100;   % Número de alvos

% Simulação
num_simulacoes = 10000;  % Número de simulações para estimar a probabilidade

% Inicialize o contador para o número de vezes que nenhum alvo foi atingido mais de uma vez
contador = 0;

for i = 1:num_simulacoes
    % Inicialize um vetor para representar quantas vezes cada alvo foi atingido
    contagem_alvos = zeros(1, m_alvos);
    
    % Simule o lançamento de n dardos
    for j = 1:n_dardos
        % Escolha aleatoriamente um alvo para o dardo
        alvo_atingido = randi(m_alvos);
        
        % Atualize a contagem para o alvo atingido
        contagem_alvos(alvo_atingido) = contagem_alvos(alvo_atingido) + 1;
    end
    
    % Verifique se nenhum alvo foi atingido mais de uma vez
    if all(contagem_alvos <= 1)
        contador = contador + 1;
    end
end

% Calcule a probabilidade
probabilidade = contador / num_simulacoes;

% Exiba o resultado
fprintf('Probabilidade de nenhum alvo ter sido atingido mais de uma vez: %.4f\n', probabilidade);