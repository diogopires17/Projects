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


% (b) (2.0 valores) Com base na função massa de probabilidade estimada,
%     estime o valor esperado, a variância e o desvio padrão da variável
%     aleatória X.

media = sum(fX.*X);
variancia = sum(fX.*(X.^2)) - media^2;
desvioPadrao = sqrt(variancia);
fprintf('Media: %f || Variancia: %f || Desvio Padrão: %f\n', media, variancia, desvioPadrao);

% (c) (2.0 valores) Determine o valor teórico da probabilidade de X ser
%     maior que 3, sabendo que o primeiro número é 2.
% X1 = 2
% X2 = {4, 5, 6, 7, 8}
% X = {2, 3, 4, 5, 6} há 5 casos possiveis quando X = X2 - 2
% X>3 = {4, 5, 6} são 3 casos favoráveis.
% Pela Lei de Laplace
% P(X > 3 | X1 = 2) =  Casos favoráveis / Casos possíveis = 3/5
fprintf("1c) O valor teórico da probabilidade de X ser maior que 3, sabendo que o primeiro número é 2: 3/5.\n\n");

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

fprintf("Exercicio 2:\n");
vi = [0 1 0 0]';
v5 = T^5 * vi;
fprintf('A probabilidade de após 5 transiçoes estar no estado 4 é: %f\n', v5(4));

% (b) (2.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, manter-se no estado 2 nas 5 primeiras transições?
fprintf('A probabilidade de após 5 transiçoes estar no estado 2 é: %f\n', v5(2));
%%
% EXERCÍCIO 3
% Considere um conjunto de 4 páginas web (A, B, C e D) com os hyperlinks
% seguintes entre eles:
% A -> B , A -> C , B -> C , C -> D
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.
fprintf("Exercicio 3:\n");
    %a   b  c  d
H = [0   0  0  0   % a
     1/2 0  0  0   % b
     1/2 1  0  0   % c
     0   0  1  0]; % d
% H é meramente uma matriz de auxilio que representa o que foi dadao no
% enunciado

H1 = [0   0  0 1/4   % a
     1/2 0  0  1/4   % b
     1/2 1  0  1/4   % c
     0   0  1  1/4]; % d Problemas de dead-end resolvido

Beta = 0.8;
A = Beta*H1 - (1 - Beta)*ones(4)/4; % matriz funça da google para resolver spider tracks
PRInicial = ones(4,1)/4

PRankF = A^10 * PRInicial;

fprintf('O pagerank de cada pagina é:\nA - %f\nB - %f\nC - %f\nD - %f\n',PRankF(1),PRankF(2),PRankF(3),PRankF(4));











