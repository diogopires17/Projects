% Parâmetros
p_values = 0.01:0.01:0.5; % Probabilidades de falha variando de 1% a 50%

% Calcule as probabilidades para 2 e 4 motores diretamente
prob_falha_2_motores = zeros(size(p_values));
prob_falha_4_motores = zeros(size(p_values));

for i = 1:length(p_values)
    p = p_values(i);
    prob_falha_2_motores(i) = sum(binopdf(ceil(2/2):2, 2, p));
    prob_falha_4_motores(i) = sum(binopdf(ceil(4/2):4, 4, p));
end

% Exiba os resultados
figure;
plot(p_values, prob_falha_2_motores, 'LineWidth', 2, 'DisplayName', '2 motores');
hold on;
plot(p_values, prob_falha_4_motores, 'LineWidth', 2, 'DisplayName', '4 motores');
xlabel('Probabilidade de Falha (p)');
ylabel('Probabilidade de Falha com Mais da Metade dos Motores');
title('Comparação de Configurações de Motores');
legend;
grid on;
