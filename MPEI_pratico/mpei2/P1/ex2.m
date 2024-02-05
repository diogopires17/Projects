
N = 1e6; %nr experiencias
p = 0.5;%prob cara
k = 6;  %nr de caras
n = 15;  %nr lancamentos

%% Simula em MATLAB resultado de 1 experiencias (cara = 1)

lancamentos = rand(n,N) > p;


sucessos = sum(lancamentos) == k;

probSimulacao = sum(sucessos)/N;
fprintf("ProbSimulacao -> %.10f \n", probSimulacao);
