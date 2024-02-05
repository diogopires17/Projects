% CODE: 491

% NOME: 
% NO. MEC.: 

% EXERCÍCIO 1
% Considere um processo aleatório que gera dois números: o primeiro número
% de 2 a 5 (com todos os valores igualmente prováveis) e o segundo número
% de 1 a 6 (com todos os valores também igualmente prováveis).
% Seja X a variável aleatória que representa a soma dos dois números.
% (a) (3.0 valores) Estime por simulação (usando 10000 simulações) a função
%     massa de probabilidade da variável aleatória X e apresente-a num
%     gráfico do tipo stem.
% (b) (2.0 valores) Com base na função massa de probabilidade estimada,
%     estime o valor esperado, a variância e o desvio padrão da variável
%     aleatória X.
% (c) (2.0 valores) Determine o valor teórico da probabilidade de X ser
%     maior ou igual a 6, sabendo que o primeiro número é 2.
N=10000;
Var1=randi([2,5],1,N);
Var2=randi([1,6],1,N);
X=Var1+Var2;
xi=3:11;
p=zeros(1,length(xi));
for i=3:11
    p(i-2)=sum(i==X)/N; 
end
stem(xi,p);
%B
Esp=xi*p';
variancia=((xi-Esp).^2)*p';
desvio=sqrt(variancia);
%C
A='X>=6';
B='Var1=2';
%Answer=A sabendo B
casostotais=4*6;
Pb=1/4;
Pintersec=3/24;%existem 3 casos pra var1=2 4 casos para var1=3 5 casos para var1=4 e 6 casos para var1=5
Answer=Pintersec/Pb;


% EXERCÍCIO 2
% Considere um sistema com 3 estados (1, 2 e 3) modelado por uma cadeia de
% Markov com a matriz de transição de estados T seguinte.

T= [0.2 0.4 0.1
    0.4 0   0.1
    0.4 0.6 0.8];

% (a) (3.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, estar no estado 1 após 4 transições?
% (b) (2.0 valores) Qual a probabilidade de o sistema, começando ou no
%     estado 1 ou no estado 2 com igual probabilidade, não estar no
%     estado 1 após 10 transições?
%(a)
EstadoIa=[0 1 0]';
After4= T^4 * EstadoIa;
Proba=After4(1);
%(b)
EstadoIb=[0.5 0.5 0]';
After10= T^10 * EstadoIb;
Probb=1-After10(1);



% EXERCÍCIO 3
% Considere um conjunto de 5 páginas web (A, B, C, D e E) com os hyperlinks
% seguintes entre eles:
% A -> B , A -> C , B -> D , C -> E
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.

H=[0    0   0   0   0
   0.5  0   0   0   0
   0.5  0   0   0   0
   0    1   0   0   0
   0    0   1   0   0];
b=0.8;
A=b*H+(1-b)*ones(5)/5;
A(isnan(A))=1/5;
xinit=[1/5 1/5 1/5 1/5 1/5]';
PageAfter10=A^10 * xinit;
pages=['A' 'B' 'C' 'D' 'E'];
for k=1:length(pages)
    disp("Page"+pages(k)+"->"+ PageAfter10(k));
end



% EXERCÍCIO 4
% Considere as 2 funções no fim deste script que implementam duas das
% funcionalidades necessárias à implementação de um filtro de Bloom.
% Considere também os dois conjuntos de chaves seguintes:

CH1= {'Ana','António','Bernardo','Carlos','Fernando','Luisa','Maria','Xavier'};
CH2= {'Francisco','Mário','Nuno','Paula','Raquel'};

% (a) (3.0 valores) Desenvolva a função que falta para, com as funções
%     fornecidas, ter todas as funcionalidades necessárias à implementação
%     de um filtro de Bloom.
% (b) (2.0 valores) Desenvolva um script que (i) crie um filtro de Bloom
%     de comprimento 100 baseado em 4 funções de dispersão com as
%     chaves de CH1, (ii) teste a pertença das chaves de CH1 no filtro de
%     Bloom criado e (iii) verifique se as chaves de CH2 pertencem ao
%     filtro de Bloom.

%(b)
BF=Init(100);
for i=1:length(CH1)
    BF= AddElement(BF,CH1{i},4);
end
for i=1:length(CH1)
    Check = CheckElement(BF,CH1{i},4);
    if Check==1
        fprintf('Pertence %s\n',CH1{i})
    else
        fprintf('Não Pertence %s\n',CH1{i})
    end
end
for i=1:length(CH2)
    Check = CheckElement(BF,CH2{i},4);
    if Check==1
        fprintf('Pertence %s\n',CH2{i})
    else
        fprintf('Não Pertence %s\n',CH2{i})
    end
end


function BF= Init(n)
    BF= zeros(1,n);
end

function BF= AddElement(BF,chave,k)
    n= length(BF);
    key= double(chave);
    h= 127;
    for i= 1:length(key)
        h= mod(31*h+key(i),2^32-1);
    end
    for i= 1:k
        h= mod(31*h+i,2^32-1);
        BF(mod(h,n)+1)= 1;
    end
end

function Check= CheckElement(BF,chave,k)
    n= length(BF);
    key= double(chave);
    h= 127;
    Check=1;
    for i= 1:length(key)
        h= mod(31*h+key(i),2^32-1);
    end
    for i= 1:k
        h= mod(31*h+i,2^32-1);
        if (BF(mod(h,n)+1)== 0)
            Check=0;
            break;
        end
    end
end
