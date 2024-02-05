
N = 100000;

%% Simula em MATLAB resultado de 1 experiencias (cara = 1)
M = rand(3,N);

lancamentos = M > 0.5;
%disp(lancamentos);

%% Casos favoraveis são os com 2 caras

sucessos = sum(lancamentos) == 2;

%fprintf("Numero de caras == 2: \n");
%disp(sucessos)
%fprintf("Casos Favoraveis: %d \n", cfav);

probSimulacao = sum(sucessos)/N;
fprintf("ProbSimulacao %.10f \n", probSimulacao);


%% VALOR TEORICO 0.375
