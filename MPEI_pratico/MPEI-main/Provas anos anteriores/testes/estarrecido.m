% CODE: 483

% NOME: 
% NO. MEC.: 

% EXERCÍCIO 1
% Considere um processo aleatório que gera dois números: o primeiro número
% de 3 a 6 (com todos os valores igualmente prováveis) e o segundo número
% de 1 a 6 (com todos os valores também igualmente prováveis).
% Seja X a variável aleatória que representa a soma dos dois números.
% (a) (3.0 valores) Estime por simulação (usando 10000 simulações) a função
%     massa de probabilidade da variável aleatória X e apresente-a num
%     gráfico do tipo stem.
% (b) (2.0 valores) Com base na função massa de probabilidade estimada,
%     estime o valor esperado, a variância e o desvio padrão da variável
%     aleatória X.
% (c) (2.0 valores) Determine o valor teórico da probabilidade de X ser
%     maior que 5, sabendo que o segundo número é 1.

%% a)

N = 10000;
vetor = zeros(1,N);
for n = 1 : N
    x = randi([3,6]) + randi([1 6]);
    vetor(n) = x;
end
X = [4:12];
px = zeros(1,length(X));
for x = X
    px(x-3) = sum(vetor == x)/N;
end
stem(X,px);


%% b)

valEsp = X*px'
variancia = ((X - valEsp).^2)*px'
dp = sqrt(variancia)

%% c)

% A - soma ser maior que 5 / primeiro valor ser maior que 4 -> P(A) = 2/4 =
% p(A) = 1/2
% B - segundo valor é 1 -> P(B) = 1/6
% P(A|B) = P(AB)/P(B)

prob = ((1/2)*(1/6)) / (1/6)

%% EXERCÍCIO 2
% Considere um sistema com 4 estados (1, 2, 3 e 4) modelado por uma cadeia
% de Markov com a matriz de transição de estados T seguinte.

T= [0.2 0.4 0.1 0
    0.4 0.3 0.1 0.1
    0.3 0.3 0.8 0.1
    0.1 0   0   0.8];

% (a) (3.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 3, estar no estado 1 após 4 transições?
% (b) (2.0 valores) Qual a probabilidade de o sistema, começando ou no
%     estado 1 ou no estado 2 com igual probabilidade, não estar no
%     estado 4 após 10 transições?

%% a)

x0 = [0 0 1 0]';
x4 = T^4 * x0;
prob3 = x4(1)

%% b)

x0 = [1/2 1/2 0 0]';
x10 = T^10 * x0;
probNo4 = 1 - x10(4)

%% EXERCÍCIO 3
% Considere um conjunto de 4 páginas web (A, B, C e D) com os hyperlinks
% seguintes entre eles:
% A -> B , B -> C , B -> D , C -> D
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.

H = [0 0 0 0;
    1 0 0 0;
    0 1/2 0 0;
    0 1/2 1 0];

b = 0.8;

A = b*H + (1-b)*ones(4)/4;
A(isnan(A)) = 1/4;
x0 = [1/4 1/4 1/4 1/4]';
x10 = A^10 * x0;
pages = ['A' 'B' 'C' 'D'];
for k = 1 : length(pages)
   disp("Page " + pages(k) + ": " + x10(k));
end

%% EXERCÍCIO 4
% Considere as 2 funções no fim deste script que implementam duas das
% funcionalidades necessárias à implementação de um filtro de Bloom.
% Considere também os dois conjuntos de chaves seguintes:

CH1= {'Agatha','Anthony','Charles','John','Francis','Jessica','Lewis','Mario'};
CH2= {'Candy','Claire','Debbie','James','William'};

% (a) (3.0 valores) Desenvolva a função que falta para, com as funções
%     fornecidas, ter todas as funcionalidades necessárias à implementação
%     de um filtro de Bloom.
% (b) (2.0 valores) Desenvolva um script que (i) crie um filtro de Bloom
%     de comprimento 200 baseado em 5 funções de dispersão com as
%     chaves de CH1, (ii) teste a pertença das chaves de CH1 no filtro de
%     Bloom criado e (iii) verifique se as chaves de CH2 pertencem ao
%     filtro de Bloom.

n = 200;
k = 5;
BF = Init(n);
for c = 1 : length(CH1)
    BF = AddElement(BF,CH1{c},k);
end

existentes = zeros(1,length(CH1));
for c = 1 : length(CH1)
    exists = ContainsElement(BF,CH1{c},k);
    existentes(c) = exists;
end

disp("0 - Não existe | 1 - Existe");

for c = 1 : length(CH1)
   disp(CH1{c} + " --> " + existentes(c)); 
end

existentes2 = zeros(1,length(CH2));
for c = 1 : length(CH2)
    exists = ContainsElement(BF,CH2{c},k);
    existentes2(c) = exists;
end
fprintf("----------------------------------------------------");
for c = 1 : length(CH2)
   disp(CH2{c} + " --> " + existentes2(c)); 
end

function BF= Init(n)
    BF= zeros(n,1);
end

function BF= AddElement(BF,key,k)
    nBF= length(BF);
    key= double(key);
    h= 127;
    for i= 1:length(key)
        h= mod(31*h+key(i),2^32-1);
    end
    for i= 1:k
        h= mod(31*h+i,2^32-1);
        BF(mod(h,nBF)+1)= 1;
    end
end

function exists = ContainsElement(BF,key,k)
    nBF= length(BF);
    key= double(key);
    h= 127;
    for i= 1:length(key)
        h = mod(31*h+key(i),2^32-1);
    end
    exists = 1;
    for i= 1:k
        h= mod(31*h+i,2^32-1);
        if (BF(mod(h,nBF)+1) == 0)
            exists = 0;
            break;
        end
    end
end