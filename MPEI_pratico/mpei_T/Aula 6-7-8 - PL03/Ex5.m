P = [0.7 0.2 0.3; 
     0.2 0.3 0.3; 
     0.1 0.5 0.4];

% B)
x = [1; 0; 0];
matriz_transicao = P*x;
% Qual a probabilidade de estar sol no segundo dia e no terceiro dia de janeiro quando o primeiro dia é de sol
prob_sol_segundo_dia = matriz_transicao(1, 1);

% Probabilidade de estar em sol no terceiro dia, dado que o primeiro dia é de sol
prob_sol_terceiro_dia = matriz_transicao(1, 1) * matriz_transicao(1, 1);
fprintf('B) Probabilidade de estar sol no segundo dia e no terceiro dia de janeiro quando o primeiro dia é de sol: %.2f\n', prob_sol_terceiro_dia);

% C)
% Calcule a probabilidade de não chover no segundo dia
x = [1; 0; 0];
P2 = P*x;
p_sol_2 = P2(1,1);

% Calcule a probabilidade de não chover no terceiro dia
P3 = P*P2;
p_sol_3 = P3(1,1);

% Calcule a probabilidade de não chover nem no segundo dia nem no terceiro dia
p_sol_2_3 = p_sol_2 * p_sol_3;

% Probabilidade de não chover nem no segundo dia nem no terceiro dia de janeiro quando o primeiro dia e de sol

disp(['C) Probabilidade de não chover nem no segundo dia nem no terceiro dia de janeiro quando o primeiro dia e de sol: ', num2str(p_sol_2_3)]);

% D)

P_initial = [1 0 0];  % Condição inicial (primeiro dia de janeiro é sol)
num_days = 31;  % Janeiro tem 31 dias

P_total = P_initial;
for i = 2:num_days
    P_total = P_total * P;
end

% Número médio de dias de sol, nuvens e chuva em janeiro
avg_days_sol = sum(P_total(1, :));
avg_days_cloudy = sum(P_total(2, :));
avg_days_rain = sum(P_total(3, :));

disp(['Número médio de dias de sol em janeiro: ', num2str(avg_days_sol)]);
disp(['Número médio de dias nublados em janeiro: ', num2str(avg_days_cloudy)]);
disp(['Número médio de dias de chuva em janeiro: ', num2str(avg_days_rain)]);

% E)

P_initial = [0 0 1];  % Condição inicial primeiro dia de chuva
num_days = 31;  % Janeiro tem 31 dias

P_total = P_initial;
for i = 2:num_days
    P_total = P_total * P;
end

% Número médio de dias de sol, nuvens e chuva em janeiro
avg_days_sol = sum(P_total(1, :));
avg_days_cloudy = sum(P_total(2, :));
avg_days_rain = sum(P_total(3, :));

disp(['Número médio de dias de sol em janeiro: ', num2str(avg_days_sol)]);
disp(['Número médio de dias nublados em janeiro: ', num2str(avg_days_cloudy)]);
disp(['Número médio de dias de chuva em janeiro: ', num2str(avg_days_rain)]);

% F_1)

P_initial_sol = [1 0 0];  % Condição inicial (primeiro dia de janeiro é sol)
P_total_sol = P_initial_sol;
num_days = 31;  % Janeiro tem 31 dias

% Probabilidades de dores reumáticas em cada estado do tempo
pain_probabilities = [0.1 0.3 0.5];

for i = 2:num_days
    P_total_sol = P_total_sol * P;
end

% Número esperado de dias com dores reumáticas em janeiro (primeiro dia de sol)
expected_pain_days_sol = sum(P_total_sol * pain_probabilities');

disp(['Número esperado de dias com dores reumáticas em janeiro (primeiro dia de sol): ', num2str(expected_pain_days_sol)]);

% F_2)

P_initial_sol = [0 0 1];  % Condição inicial (primeiro dia de janeiro é chuva)
P_total_sol = P_initial_sol;
num_days = 31;  % Janeiro tem 31 dias

% Probabilidades de dores reumáticas em cada estado do tempo
pain_probabilities = [0.1 0.3 0.5];

for i = 2:num_days
    P_total_sol = P_total_sol * P;
end

% Número esperado de dias com dores reumáticas em janeiro (primeiro dia de sol)
expected_pain_days_sol = sum(P_total_sol * pain_probabilities');

disp(['Número esperado de dias com dores reumáticas em janeiro (primeiro dia de sol): ', num2str(expected_pain_days_sol)]);




