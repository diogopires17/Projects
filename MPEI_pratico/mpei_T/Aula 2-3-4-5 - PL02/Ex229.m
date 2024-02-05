% Parâmetros da distribuição normal
media = 14;
desvio_padrao = 2;
num_simulacoes = 100000;

% Simulação de classificações dos alunos
classificacoes_simuladas = normrnd(media, desvio_padrao, [1, num_simulacoes]);

% (a) Probabilidade de uma classificação entre 12 e 16
prob_a_simulacao = sum(classificacoes_simuladas >= 12 & classificacoes_simuladas <= 16) / num_simulacoes;

disp(['Probabilidade simulada (a): ', num2str(prob_a_simulacao)]);

% (b) Probabilidade de classificações entre 10 e 18
prob_b_simulacao = sum(classificacoes_simuladas >= 10 & classificacoes_simuladas <= 18) / num_simulacoes;

disp(['Probabilidade simulada (b): ', num2str(prob_b_simulacao)]);

% (c) Probabilidade de um aluno passar (classificação maior ou igual a 10)
prob_c_simulacao = sum(classificacoes_simuladas >= 10) / num_simulacoes;

disp(['Probabilidade simulada (c): ', num2str(prob_c_simulacao)]);

% (d) Verificação usando normcdf()
prob_a_matlab = normcdf(16, media, desvio_padrao) - normcdf(12, media, desvio_padrao);
prob_b_matlab = normcdf(18, media, desvio_padrao) - normcdf(10, media, desvio_padrao);
prob_c_matlab = 1 - normcdf(10, media, desvio_padrao);

disp(['Probabilidade MATLAB (a): ', num2str(prob_a_matlab)]);
disp(['Probabilidade MATLAB (b): ', num2str(prob_b_matlab)]);
disp(['Probabilidade MATLAB (c): ', num2str(prob_c_matlab)]);
