lambda = 0.02; % média de erros por página
n_paginas = 100; % número de páginas

% Probabilidade de no máximo 1 erro (k = 0 ou k = 1)
prob_maximo_1_erro = poisscdf(1, lambda * n_paginas);

disp(['Probabilidade de no máximo 1 erro em 100 páginas: ', num2str(prob_maximo_1_erro)]);
