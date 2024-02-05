% EXERCÍCIO 1
% Considere um processo aleatório que gera dois números: o primeiro número
% de 1 a 4 (com todos os valores igualmente prováveis) e o segundo número
% de 4 a 8 (com todos os valores também igualmente prováveis).
% Seja X a variável aleatória que representa o segundo número menos o
% primeiro número.
% (a) (3.0 valores) Estime por simulação (usando 10000 simulações) a função
%     massa de probabilidade da variável aleatória X e apresente-a num
%     gráfico do tipo stem.

fprintf("Exercicio 1:\n");
N = 10000;
X1 = randi([1 4], 1, N);
X2 = randi([4 8], 1, N);
X = X2 - X1;

resultados = zeros(1, length(unique(X)));
for i = 1:N
    resultados(X(i) + 1) = resultados(X(i) + 1) + 1;  % contador++ sendo que a posiçao 1 representa X=0 e assim adiante
end
fX = resultados/N;  % Variavel que detem as probabilidades de cada evento (valor de X) acontecer nesta experiencia

X = unique(X);  % Usado para os valores do grafico
stem(X, fX),xlabel('X'),ylabel('fX(x)');  % Fazer um grafico do tipo massa de probabilidade da variavel X
title("1a)");
axis([-1 8 0 0.3]);  % Acertar os eixos do grafico para melhor ver o resultado
fprintf("1a) Gráfico que apresenta a massa de probabilidade da variável X tem o nome de Figure 1.\n");

%%
% (b) (2.0 valores) Com base na função massa de probabilidade estimada,
%     estime o valor esperado, a variância e o desvio padrão da variável
%     aleatória X.

media = sum(fX.* X); 
variancia = sum(fX.*(X.^2)) - media^2;
dp = sqrt(variancia);

%%
% EXERCÍCIO 2
% Considere um sistema com 4 estados (1, 2, 3 e 4) modelado por uma cadeia
% de Markov com a matriz de transição de estados T seguinte.

T= [0.2 0.4 0.1 0
    0.4 0.3 0.1 0.1
    0.3 0.3 0.8 0.1
    0.1 0   0   0.8];

% (a) (3.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, estar no estado 4 após 5 transições?
x0  = [ 0 1 0 0]';
prob = T^5 * x0;
fprintf("prob pedida 1a): %.5f\n", prob(4));

% (b) (2.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, manter-se no estado 2 nas 5 primeiras transições?

fprintf("prob pedida 1b): %.5f\n", prob(2));

% EXERCÍCIO 3
% Considere um conjunto de 4 páginas web (A, B, C e D) com os hyperlinks
% seguintes entre eles:
% A -> B , A -> C , B -> C , C -> D
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.


T = [ 0 1/2 1/2 0; 0 0 1 0; 0 0 0 1; 0 0 0 0]';
B = 0.8;
Tsolved  = [ 0 1/2 1/2 0; 0 0 1 0; 0 0 0 1; 1/4 1/4 1/4 1/4]';
H  = B*Tsolved + (1-B) * (ones(4,4)/4); 
x0 = [1/4 1/4 1/4 1/4]';

pr = H^10*x0;
fprintf("pagerank A: %.5f\n, B: %.5f\n, C: %.5f\n, D: %.5f\n", pr(1), pr(2), pr(3), pr(4));

