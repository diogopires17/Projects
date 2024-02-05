% Definir a matriz de transição de estados
P = [0.7, 0.8; % Presente Presente
     0.3, 0.2]; % Ausente Ausente

% (a) Probabilidade de estar presente na aula de quarta-feira na semana seguinte se o aluno estiver presente na aula de quarta-feira na semana atual.
% Inicialização
prob_inicial = [1; 0]; % Começa na aula presente
num_semanas = 1; % Número de semanas

% Iteração para 1 semana
for semana = 1:num_semanas
    prob_inicial = P * prob_inicial;
end

fprintf('(a) Probabilidade de estar presente na aula de quarta-feira na semana seguinte: %.2f\n', prob_inicial(1));

% (b) Probabilidade de estar presente na aula de quarta-feira na semana seguinte se o aluno estiver ausente na aula de quarta-feira na semana atual.
% Inicialização
prob_inicial = [0; 1]; % Começa na aula ausente
num_semanas = 1; % Número de semanas

% Iteração para 1 semana
for semana = 1:num_semanas
    prob_inicial = P * prob_inicial;
end

fprintf('(b) Probabilidade de estar presente na aula de quarta-feira na semana seguinte se ausente na semana atual: %.2f\n', prob_inicial(1));

% (c) Probabilidade de estar presente na última aula após 15 semanas, assumindo que esteve presente na primeira aula.
% Inicialização
prob_inicial = [1; 0]; % Começa na aula presente
num_semanas = 15; % Número de semanas

% Iteração para 15 semanas
for semana = 1:num_semanas
    prob_inicial = P * prob_inicial;
end

fprintf('(c) Probabilidade de estar presente na última aula após 15 semanas: %.2f\n', prob_inicial(1));

% (d) Representação gráfica da probabilidade de faltar a cada uma das 30 aulas, assumindo que a probabilidade de estar presente na primeira aula é de 85%.
num_aulas = 30;
prob_inicial = [0.85; 0.15]; % Começa na aula presente
prob_ausente = zeros(1, num_aulas);

% Iteração para 30 aulas
for aula = 1:num_aulas
    prob_ausente(aula) = 1 - prob_inicial(1);
    prob_inicial = P * prob_inicial;
end

% Plotagem das probabilidades
aulas = 1:num_aulas;
figure;
plot(aulas, prob_ausente, 'b');
xlabel('Aulas');
ylabel('Probabilidade de estar ausente');
title('(d) Probabilidade de faltar a cada uma das 30 aulas');
