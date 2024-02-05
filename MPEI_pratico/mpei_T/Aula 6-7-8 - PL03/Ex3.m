% Matriz de transição
num_Exp = 2e5;

counter = 0;

matriz_transicao = rand(20, 20);

for coluna=1:20
    matriz_transicao(:, coluna) = matriz_transicao(:, coluna) / sum(matriz_transicao(:,coluna));
end


% Calcule a probabilidade do sistema estar no estado 20 após um certo número de transições
num_transicoes = [2, 5, 10, 100];
for i = 1:length(num_transicoes)
    matriz_probabilidade = matriz_transicao ^ num_transicoes(i);
    probabilidade = matriz_probabilidade(20, 1);
    fprintf('A probabilidade do sistema estar no estado 20 após %d transições é %.5f%%\n', num_transicoes(i), probabilidade * 100);
end
