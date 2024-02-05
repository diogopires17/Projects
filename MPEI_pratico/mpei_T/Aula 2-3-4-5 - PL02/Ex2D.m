% Parâmetros
n_dardos = 100;   % Número de dardos
m_alvos = [200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];   % Número de alvos

% Simulação
num_simulacoes = 10000;  % Número de simulações para estimar a probabilidade

% Inicialize o contador para o número de vezes que nenhum alvo foi atingido mais de uma vez
probabilidades = zeros(1,length(m_alvos));

for k = 1:length(m_alvos)
    contador = 0;
    for i = 1:num_simulacoes
    
        % Inicialize um vetor para representar quantas vezes cada alvo foi atingido
        contagem_alvos = zeros(1, m_alvos(k));
        
        % Simule o lançamento de n dardos
        for j = 1:n_dardos
            % Escolha aleatoriamente um alvo para o dardo
            alvo_atingido = randi(m_alvos(k));
            
            % Atualize a contagem para o alvo atingido
            contagem_alvos(alvo_atingido) = contagem_alvos(alvo_atingido) + 1;
        end
        
        % Verifique um alvo foi atingido 2 ou mais vezes
        if any(contagem_alvos >= 2)
            contador = contador + 1;
        end
    end
    % Calcule a probabilidade
    probabilidade = contador / num_simulacoes;
    probabilidades(k) = probabilidade;
end
    
% Plote o gráfico
plot(m_alvos, probabilidades, '-o', 'LineWidth', 2);
title(['Probabilidade de pelo menos 1 alvo ter sido atingido 2 ou mais vezes para (m = ' num2str(m_alvos) ')']);
xlabel('Número de Alvos (m)');
ylabel('Probabilidades');
grid on;
