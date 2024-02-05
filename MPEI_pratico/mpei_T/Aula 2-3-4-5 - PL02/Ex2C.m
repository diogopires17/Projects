% Parâmetros
m_values = [1000, 100000];
n_values = 10:10:100;
num_simulacoes = 1000;

% Inicialize a figura
figure;

% Loop sobre os valores de m
for i = 1:length(m_values)
    m_alvos = m_values(i);
    
    % Inicialize vetores para armazenar as probabilidades
    probabilidades = zeros(size(n_values));
    
    % Loop sobre os valores de n
    for j = 1:length(n_values)
        n_dardos = n_values(j);
        contador = 0;
        
        % Simule o experimento 'num_simulacoes' vezes
        for k = 1:num_simulacoes
            contagem_alvos = zeros(1, m_alvos);
            
            % Simule o lançamento de n dardos
            for l = 1:n_dardos
                alvo_atingido = randi(m_alvos);
                contagem_alvos(alvo_atingido) = contagem_alvos(alvo_atingido) + 1;
            end
            
            % Verifique se pelo menos um alvo foi atingido mais de uma vez
            if any(contagem_alvos > 1)
                contador = contador + 1;
            end
        end
        
        % Calcule a probabilidade média
        probabilidades(j) = contador / num_simulacoes;
    end
    
    % Subplot
    subplot(length(m_values), 1, i);
    
    % Plote o gráfico
    plot(n_values, probabilidades, '-o', 'LineWidth', 2);
    title(['Probabilidade de pelo menos um alvo atingido mais de uma vez (m = ' num2str(m_alvos) ')']);
    xlabel('Número de Dardos (n)');
    ylabel('Probabilidade');
    grid on;
end

% Ajuste o layout da figura
sgtitle('Comparação da Probabilidade para Diferentes Números de Alvos (m)'); % 2.2.c