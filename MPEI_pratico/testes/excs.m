% EXERCÍCIO 1
% Considere um processo aleatório que gera dois números: o primeiro número
% de 1 a 4 (com todos os valores igualmente prováveis) e o segundo número
% de 4 a 8 (com todos os valores também igualmente prováveis).
% Seja X a variável aleatória que representa o segundo número menos o
% primeiro número.
% (a) (3.0 valores) Estime por simulação (usando 10000 simulações) a função
%     massa de probabilidade da variável aleatória X e apresente-a num
%     gráfico do tipo stem.
% (b) (2.0 valores) Com base na função massa de probabilidade estimada,
%     estime o valor esperado, a variância e o desvio padrão da variável
%     aleatória X.
% (c) (2.0 valores) Determine o valor teórico da probabilidade de X ser
%     maior que 3, sabendo que o primeiro número é 2.

% 1a)
N = 1e4;
x1 = randi([1 4],1,N);
x2 = randi([4 8],1,N);
X = x2 - x1;

ocorrencias = zeros(1,length(unique(X)));
% posicao 1 representa X=0 e assim adiante
for i = 1:N
    ocorrencias(X(i) + 1) = ocorrencias(X(i) + 1) + 1;
end
fX = ocorrencias/N;
X = unique(X);
%stem(X,fX),xlabel('X'),ylabel('fX(x)');

% 1b)

% EX = 0;
% EX2 = 0;
% for i = 1:length(fX)
%     EX = EX + (X(i)*fX(i));
%     EX2 = EX2 + (X(i)^2*fX(i));
% end
% varX = EX2 - EX.^2;

valor_esperado = X * fX';
variancia = X.^2 * fX' - valor_esperado.^2;

ro = sqrt(variancia);
fprintf('1b) Media: %.4f\n',valor_esperado);
fprintf('Variancia: %.4f\n',variancia);
fprintf('Desvio padrao: %.4f\n\n',ro);

% 1c) P(X > 3| X1 = 2)
% X1 = 2
% X2 = {4,5,6,7,8}
% X = {2,3,4,5,6} há 5 casos possiveis quando X = X2 - 2
% X>3 = {4, 5, 6} são 3 casos favoráveis.
% P(X > 3| X1 = 2) = casos fav/casos possiveis = 3/5
fprintf("1c) O valor teórico da probabilidade de X ser maior que 3, sabendo que o primeiro número é 2: 3/5.\n\n");

% EXERCÍCIO 2
% Considere um sistema com 4 estados (1, 2, 3 e 4) modelado por uma cadeia
% de Markov com a matriz de transição de estados T seguinte.

T= [0.2 0.4 0.1 0
    0.4 0.3 0.1 0.1
    0.3 0.3 0.8 0.1
    0.1 0   0   0.8];

% (a) (3.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, estar no estado 4 após 5 transições?
% (b) (2.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, manter-se no estado 2 nas 5 primeiras transições?

%a)
x0 = [0 1 0 0]';
x = T^5*x0;
fprintf('2a) A probabilidade de estar no estado 4 é %.4f\n',x(4));

%b)
% continuar sempre no estado 2
prob2 = 1*T(2,2)^5;

fprintf('2b) Prob manter-se no estado 2 nas 5 1ªs transicoes: %.4f\n\n',prob)

% EXERCÍCIO 3
% Considere um conjunto de 4 páginas web (A, B, C e D) com os hyperlinks
% seguintes entre eles:
% A -> B , A -> C , B -> C , C -> D
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.

%    a    b  c  d
H = [0    0  0  0   
     1/2  0  0  0
     1/2  1  0  0
     0    0  1  0];

% Resolver o dead end
Hsolved = [  0    0  0  1/4   
             1/2  0  0  1/4
             1/2  1  0  1/4
             0    0  1  1/4];

pagerank = [1/4 1/4 1/4 1/4]';  % rank inicial tem igual prob para todas as pags
beta = 0.8;
A = beta*Hsolved + (1 - beta)*(1/4*ones(4));

for i = 1:10
    pagerank = A*pagerank;
end
fprintf('3) Pagerank:\n');
disp(pagerank)

% EXERCÍCIO 4
% Considere as 2 funções no fim deste script que implementam duas das
% funcionalidades necessárias à implementação de um filtro de Bloom.
% Considere também os dois conjuntos de chaves seguintes:

CH1= {'Amelia','Emma','Damian','Joe','Madison','Megan','Susan','Thomas'};
CH2= {'George','Jack','Oscar','Sarah'};

% (a) (3.0 valores) Desenvolva a função que falta para, com as funções
%     fornecidas, ter todas as funcionalidades necessárias à implementação
%     de um filtro de Bloom.
% (b) (2.0 valores) Desenvolva um script que (i) crie um filtro de Bloom
%     de comprimento 100 baseado em 6 funções de dispersão com as
%     chaves de CH1, (ii) teste a pertença das chaves de CH1 no filtro de
%     Bloom criado e (iii) verifique se as chaves de CH2 pertencem ao
%     filtro de Bloom.

fprintf('4)\n');
k = 6;
n = 100;
BF = Init(n);
for i = 1:length(CH1)
    BF = AddElement(BF,CH1{i},k);
end
for i = 1:length(CH1)
    contem = IsMember(BF,CH1{i},k);
    if contem
        fprintf('%s é membro do BF\n',CH1{i});
    else
        fprintf('%s não é membro do BF\n',CH1{i});
    end
end
fprintf('\n');
for i = 1:length(CH2)
    contem = IsMember(BF,CH2{i},k);
    if contem
        fprintf('%s é membro do BF\n',CH2{i});
    else
        fprintf('%s não é membro do BF\n',CH2{i});
    end
end


% Funcoes dadas pelos professores
function BF= Init(n)
    BF= zeros(n,1);
end

function BF= AddElement(BF,chave,k)
    h= 127;
    chave= double(chave);
    nBF= length(BF);
    for i= 1:length(chave)
        h= mod(31*h+chave(i),2^32-1);
    end
    for i= k:-1:1
        h= mod(31*h+i,2^32-1);
        BF(mod(h,nBF)+1)= 1;
    end
end

function member= IsMember(BF,chave,k)
    member = true;
    h= 127;
    chave= double(chave);
    nBF= length(BF);
    for i= 1:length(chave)
        h= mod(31*h+chave(i),2^32-1);
    end
    for i= k:-1:1
        h= mod(31*h+i,2^32-1);
        % Se nas posições mapeadas pela fc de dispersao o valor for 0
        % entao o elemento nao pertence ao BF
        if(BF(mod(h,nBF)+1) == 0)
            member = false;
            break;
        end
    end
end





