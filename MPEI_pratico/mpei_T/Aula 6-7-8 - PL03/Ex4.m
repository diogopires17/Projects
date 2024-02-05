p = 0.4;
q = 0.6;


% Matriz de transição

matriz_transicao = [p^2, 0, 0, q^2 ; (1-p)^2, 0, 0, q*(1-q) ; p*(1-p), 0, 0, q*(1-q) ; p*(1-p), 1, 1, (1-q)^2];      %       A       B       C       D
                                                                                                                    %  A   p^2      0       0      q^2
                                                                                                                    %  B  (1-p)^2   0       0      q*(1-q)
                                                                                                                    %  C  p*(1-p)   0       0      q*(1-q)
                                                                                                                    %  D  p*(1-p)   1       1      (1-q)^2


sum(matriz_transicao)



num_transicoes = [5, 10, 100, 200];

for i = 1:length(num_transicoes)
    matriz_probabilidade = matriz_transicao ^ num_transicoes(i);
    for estado = 1:4
        probabilidade = matriz_probabilidade(estado, 1);
        fprintf('A probabilidade do sistema estar no estado %d após %d transições é %.5f%%\n', estado, num_transicoes(i), probabilidade * 100); 
    end
end

num_transicoes_limite = 10000;  % Um valor grande para se aproximar das probabilidades limite
matriz_probabilidade_limite = matriz_transicao ^ num_transicoes_limite;

probabilidade_limite_A = matriz_probabilidade_limite(1, 1);
probabilidade_limite_B = matriz_probabilidade_limite(2, 1);
probabilidade_limite_C = matriz_probabilidade_limite(3, 1);
probabilidade_limite_D = matriz_probabilidade_limite(4, 1);

fprintf('Probabilidade limite do estado A: %.5f\n', probabilidade_limite_A);
fprintf('Probabilidade limite do estado B: %.5f\n', probabilidade_limite_B);
fprintf('Probabilidade limite do estado C: %.5f\n', probabilidade_limite_C);
fprintf('Probabilidade limite do estado D: %.5f\n', probabilidade_limite_D);