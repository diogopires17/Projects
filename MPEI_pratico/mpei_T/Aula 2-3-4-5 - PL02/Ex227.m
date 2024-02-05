lambda = 15; % média de mensagens por segundo
k = 0; % número de eventos desejados

prob_zero_mensagem = poisspdf(k, lambda);
disp(['Probabilidade (nenhuma mensagem): ', num2str(prob_zero_mensagem)]);

k_limite = 10; % limite superior
prob_mais_de_10_mensagens = 1 - poisscdf(k_limite, lambda);
disp(['Probabilidade (mais de 10 mensagens): ', num2str(prob_mais_de_10_mensagens)]);
