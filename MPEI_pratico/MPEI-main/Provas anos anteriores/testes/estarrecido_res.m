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
for n = 1 : N % fazer o for para arranjar 2 números, entre 3 e 6, e 1 e 6 
    x = randi([3,6]) + randi([1 6]);
    vetor(n) = x;
end
Sx=4:12; % O valor mínimo da VA é 4 e o máximo 12 
px= zeros(1,length(Sx));
for i=Sx % vamos calcular a prob. para cada valor de X 
    px(i-3)= sum(vetor == i)/N; % o i-3 é para começar a preencher o px no índice 1
end
stem(Sx,px)
%% b)
% Média ou Valor Esperado
media = sum(Sx.*px)

%variancia
aux = (Sx-media).^2;
variancia = sum(aux.*px)

% desvio padrão
dp = sqrt(variancia)
%% c)
% Vai ser uma probabilidade Condicionada
% P(A|B) = P (AB) / P(B)
% P(B) =  prob. do 2º numero ser 1 ->1/6, já que a prob. é igual para todos os números
% P(AB)= prob. de ser maior que 5 e 2º ser 1 -> 1/2
ProbCond= (1/2) /(1/6)

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
v0= [0 0 1 0]';
T4= T^4 *v0;
fprintf("A probabilidade de o sistema, começando no estado 3,\nestar no estado 1 após 4 transições é %.3f.\n",T4(1));
%% b)
v0= [0.5 0.5 0 0]';
T10= T^10 *v0;
fprintf("A probabilidade de o sistema, começando ou no estado 1 ou no estado 2,\n" + ...
"não estar no estado 4 após 10 transições é %.3f.\n",sum(T10(1:3)));% também dá para fazer pelo acontimen. complementar

%% EXERCÍCIO 3
% Considere um conjunto de 4 páginas web (A, B, C e D) com os hyperlinks
% seguintes entre eles:
% A -> B , B -> C , B -> D , C -> D
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.

%a) 
N=4; % número de estados
%   A  B  C D
H= [0  0  0 0
    1  0  0 0
    1 1/2 0 0
    0 1/2 1 0];
% D é um dead-end, logo temos de dividir todas as suas casas pelo número de
% estados
D= ones(4,1)/N;
H2 = H;
H2(:,4) = D; % Nova matriz com o dead-end resolvido
beta = 0.8;
HGoogle = beta * H2 + (1-beta) * ones(N) /N;

%Para verificar se é estocástica
sum(HGoogle);
HGoogle>=0 & HGoogle<=1;
% Se a matriz der só 1, é porque é estocástica

n= 10; % nº de iterações
pRank= ones(N,1)/N; % matriz onde vão ficar os valores de Page Rank
for i=1:n
    pRank = HGoogle*pRank;
end
pRank

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

% Não sei qual a função a completar
n=200;%Tamanho do Bloom Filter
k=5; % nº de funcs de dispersão
filtro= Init(n);

for i=1:length(CH1)
    filtro=AddElement(filtro,CH1{i},k);
end

existentes = zeros(1,length(CH1));
for c = 1 : length(CH1)
    existsCH1=ContainsElement(filtro,CH1{i},k);
    existentes(c) = existsCH1;
end

disp("0 - Não existe | 1 - Existe");
for c = 1 : length(CH1)
   disp(CH1{c} + " --> " + existentes(c)); 
end
% Agora para CH2
fprintf("---------------------------------------------------------------\n");
existentes = zeros(1,length(CH2));
for c = 1 : length(CH2)
    existsCH2=ContainsElement(filtro,CH2{c},k);
    existentes(c) = existsCH2;
end

disp("0 - Não existe | 1 - Existe");
for c = 1 : length(CH2)
   disp(CH2{c} + " --> " + existentes(c)); 
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