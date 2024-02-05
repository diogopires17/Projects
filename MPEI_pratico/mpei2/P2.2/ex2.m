% a) espaço de amostragem sao os casos de retirares uma das
% 90notas de 5€, 9 de 50€ ou 1 de 100€, num total de 100 notas.
% A probabilidade dos acontecimentos elementares é 1/100


% b) espaco amostragem {5,50,100}
px = [90 9 1]/100;


% c)
x = [5,50,100];


y = cumsum(px);

stairs(x,y);
xlim([0,110]);
ylim([0.85,1.05]);

