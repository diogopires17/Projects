% B)
T = [0.1, 0.3, 0.25, 0.5;
     0.3, 0.1, 0.25, 0.3;
     0.3, 0.3, 0.1, 0.1;
     0.3, 0.3, 0.4, 0.1];

% C)
T_n_transicoes = T^5;

probabilidade_B = T_n_transicoes(2, 2);

disp(['Probabilidade de escolher a publicidade da empresa B às 7:10: ', num2str(probabilidade_B)]);

% D)
% Encontrar o vetor estacionário (probabilidades limite)
pi = null(T' - eye(size(T)));

% Normalizar o vetor estacionário para obter probabilidades
pi = pi / sum(pi);

% Mostrar o resultado
disp('Probabilidades limite:');
disp(pi);

% E)
% Matriz de transição T
T = [0.1, 0.3, 0.25, 0.5; 
     0.3, 0.1, 0.25, 0.3; 
     0.3, 0.3, 0.1, 0.1; 
     0.3, 0.3, 0.4, 0.1];

% Estados correspondentes às publicidades
A = 1;
B = 2;

% Probabilidade de transição de A para B
prob_AB = T(A, B);

% Probabilidade de transição de B para qualquer estado (X)
prob_BX = T(B, :);

% Probabilidade de transição de X para qualquer estado (X)
prob_XX = T(:, :);

% Probabilidade de transição de X para B
prob_XB = T(:, B);

% Probabilidade de transição de B para A
prob_BA = T(B, A);

% Calcular a probabilidade da sequência ABXXXBA
prob_sequencia = prob_AB * prod(prob_BX) * prod(prob_XX * prob_XX) * prob_XB * prob_BA;

% Mostrar o resultado
disp(['Probabilidade da sequência ABXXXBA nos primeiros 7 períodos de 2 minutos: ', num2str(prob_sequencia)]);

