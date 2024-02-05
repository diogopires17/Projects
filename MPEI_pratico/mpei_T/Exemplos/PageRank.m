% Exercício 2 - Implementação Simples do PageRank
% Implemente uma versão simplificada do algoritmo PageRank para um grafo com 4 páginas.
% Definir a matriz de transição do grafo
G = [0, 1/2, 1/3, 0; 
     1/3, 0, 0, 1/2; 
     1/3, 1/2, 0, 1/2; 
     1/3, 0, 2/3, 0];

% Inicializar vetor de PageRank
pr = ones(1, 4) / 4;

% Iterações para calcular PageRank
num_iteracoes = 20;
for iteracao = 1:num_iteracoes
    pr = pr * G;
end

disp('PageRank:');
disp(pr);