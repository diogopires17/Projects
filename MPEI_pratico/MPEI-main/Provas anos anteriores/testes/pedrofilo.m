% CODE: 322

% NOME: 
% NO. MEC.: 

% EXERCÍCIO 1
% Considere um processo aleatório que gera dois números: o primeiro número
% de 1 a 4 (com todos os valores igualmente prováveis) e o segundo número
% de 5 a 8 (com todos os valores também igualmente prováveis).
% Seja X a variável aleatória que representa o segundo número menos o
% primeiro número.
% (a) (3.0 valores) Estime por simulação (usando 10000 simulações) a função
%     massa de probabilidade da variável aleatória X e apresente-a num
%     gráfico do tipo stem.

N = 10000;
X1 = randi(4, [1, N]);
X2 = randi(4, [1, N])+4;
X = X2-X1;

labels = 1:7;
massa_prob = zeros(1, length(labels));
for i=labels
    massa_prob(i) = sum(X == i)/N;
end

stem(labels, massa_prob)

% (b) (2.0 valores) Com base na função massa de probabilidade estimada,
%     estime o valor esperado, a variância e o desvio padrão da variável
%     aleatória X.

valor_esperado = sum(labels*massa_prob');
var = sum((labels.^2).*massa_prob) - valor_esperado^2;
despadr = sqrt(var);
fprintf("1. b) E[X] = %d; Var(X) = %d; desvio padrão = %d\n", valor_esperado, var, despadr)

% (c) (2.0 valores) Determine o valor teórico da probabilidade de X ser
%     menor que 2, sabendo que o segundo número é 5.

% P("X < 2" | "X2 == 5") = P("X == 1" | "X2 == 5")
% X = X2-X1 <=> 5-1 = X1 <=> X1 = 4 (apenas um caso em 4)
fprintf("1. c) 1/4\n")

% EXERCÍCIO 2
% Considere um sistema com 3 estados (1, 2 e 3) modelado por uma cadeia de
% Markov com a matriz de transição de estados T seguinte.

T= [0.2 0.4 0.1
    0.4 0   0.1
    0.4 0.6 0.8];

% (a) (3.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 3, estar no estado 2 após 5 transições?
T5 = T^5;
fprintf("2 a) %d\n", T5(2,3))

% (b) (2.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 1, manter-se no estado 1 nas 3 primeiras transições?
prob1 = 1;
Ttemp = T;
for i=1:3
    prob1 = prob1 * Ttemp(1, 1);
    Ttemp = Ttemp * T;
end
fprintf("2 b) %d\n", prob1)





% EXERCÍCIO 3
% Considere um conjunto de 5 páginas web (A, B, C, D e E) com os hyperlinks
% seguintes entre eles:
% A -> B , B -> C , B -> D , D -> E
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.


H= [0   0   1/5 0   1/5
    1   0   1/5 0   1/5
    0   1/2 1/5 0   1/5
    0   1/2 1/5 0   1/5
    0   0   1/5 1   1/5];

b = .8;
N = length(H);
ranks = ones(N, 1)*1/N;

A = b*H + (1-b)*(1/N);

for i=1:10
    ranks = A*ranks;
end

% EXERCÍCIO 4
% Considere as 2 funções no fim deste script que implementam duas das
% funcionalidades necessárias à implementação de um filtro de Bloom.
% Considere também os dois conjuntos de chaves seguintes:

CH1= {'Aníbal','Carlota','Eduardo','Francisco','Luis','Mário','Vera'};
CH2= {'Bernardo','Daniel','Orlando','Paulo'};

% (a) (3.0 valores) Desenvolva a função que falta para, com as funções
%     fornecidas, ter todas as funcionalidades necessárias à implementação
%     de um filtro de Bloom.
% (b) (2.0 valores) Desenvolva um script que (i) crie um filtro de Bloom
%     de comprimento 50 baseado em 5 funções de dispersão com as
%     chaves de CH1, (ii) teste a pertença das chaves de CH1 no filtro de
%     Bloom criado e (iii) verifique se as chaves de CH2 pertencem ao
%     filtro de Bloom. 

k=5;
BF = Init(50);
for i=1:length(CH1)
    BF = AddElement(BF, CH1{i}, k);
    fprintf("%s adicionado\n", CH1{i})
end
for i=1:length(CH1)
    fprintf("%s pertence: %d\n", CH1{i},  VerifyElementBelongs(BF, CH1{i}, k))
end
for i=1:length(CH2)
    fprintf("%s pertence: %d\n", CH2{i},  VerifyElementBelongs(BF, CH2{i}, k))
end

function BF= Init(n)
    BF= zeros(1,n);
end

function BF= AddElement(BF,key,k)
    h= 127;
    chave= double(key);
    n= length(BF);
    for i= 1:length(chave)
        h= mod(31*h+chave(i),2^32-1);
    end
    for i= k:-1:1
        h= mod(31*h+i,2^32-1);
        BF(mod(h,n)+1)= 1;
    end
end

function belongs= VerifyElementBelongs(BF,key,k)
    h= 127;
    chave= double(key);
    n= length(BF);
    for i= 1:length(chave)
        h= mod(31*h+chave(i),2^32-1);
    end
    belongs = 1;
    for i=k:-1:1
        h= mod(31*h+i,2^32-1);
        
        if BF(mod(h,n)+1) ~= 1
            belongs = 0;
            break;
        end
    end
end
