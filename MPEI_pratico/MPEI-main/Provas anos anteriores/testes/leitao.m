clear
clc
% CODE: 184

% NOME: DIOGO CRUZ
% NO. MEC.: 98595

%% EXERCÍCIO 1
% Considere um processo aleatório que gera dois números: 
% o primeiro número de 1 a 4 (com todos os valores igualmente prováveis) 
% o segundo número de 4 a 8 (com todos os valores também igualmente prováveis)

% Seja X a variável aleatória que representa o segundo número menos o
% primeiro número.

% (a) (3.0 valores) Estime por simulação (usando 10000 simulações) a função
%     massa de probabilidade da variável aleatória X e apresente-a num
%     gráfico do tipo stem.

% RESPOSTA:
N = 10000;  % nº de experiencias
first = randi([1 4],1, N);   % generate first number between 1 and 4
second = randi([4 8],1, N);  % generate second number between 4 and 8

sub = second - first;        
X = 0:7;

pX = zeros(1,8);
for i=0 : 7
    pX(i+1) = sum(sub == i)/N;
end

figure(1);
stem(X,pX);             % funçao massa de probabilidade
title("1a)");

% (b) (2.0 valores) Com base na função massa de probabilidade estimada, estime o valor esperado, a variância e o desvio padrão da variável aleatória X.

% RESPOSTA:
media = sum(X .* pX);                     % valor esperado
variancia = sum(pX .* X.^2) - media^2;    % variancia
desvioPadrao = sqrt(variancia);           % desvio padrao
fprintf("1b) Valor esperado: %.4f\n    Variância: %.4f\n    Desvio Padrão: %.4f\n", media, variancia, desvioPadrao);


% (c) (2.0 valores) Determine o valor teórico da probabilidade de X ser maior que 3, sabendo que o primeiro número é 2.

% RESPOSTA:
%
%  first/second | 4 | 5 | 6 | 7 | 8 |
%             1 | 3 | 4 | 5 | 6 | 7 |
%             2 | 2 | 3 | 4 | 5 | 6 |
%             3 | 1 | 2 | 3 | 4 | 5 |
%             4 | 0 | 1 | 2 | 3 | 4 |

% P( X>3 | first==2 ) = P( second > 5 ) = 3/5 

fprintf("\n1c) P( X>3 | first==2 ) = 3/5\n")

%% EXERCÍCIO 2
% Considere um sistema com 4 estados (1, 2, 3 e 4) modelado por uma cadeia
% de Markov com a matriz de transição de estados T seguinte.
%     1     2    3    4
T= [ 0.2   0.4  0.1   0     % 1
     0.4   0.3  0.1  0.1    % 2
     0.3   0.3  0.8  0.1    % 3
     0.1    0    0   0.8 ]; % 4

% (a) (3.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, estar no estado 4 após 5 transições?

% RESPOSTA: 
v = [0;0;0;1];

v5 = (T^5)*v;
fprintf("\n2a) Probabilidade de estar no estado 4 após 5 transições: %.4f\n", v5(4));

% (b) (2.0 valores) Qual a probabilidade de o sistema, começando no estado 2, manter-se no estado 2 nas 5 primeiras transições?

%v2 = [0;1;0;0];

v5b = 1*T(2,2)^5;        %  2  *   2->2   *  2->2   *  2->2  *  2->2  * 2->2
                         %  1º *  1º->2º  *  2º->3º * 3º->4º * 4º->5º * 5º->6º
                         
fprintf("2b) Probabilidade de começar e manter-se no estado 2 após 5 transições: %.4f\n", v5b);
                                
                                

%% EXERCÍCIO 3
% Considere um conjunto de 4 páginas web (A, B, C e D) com os hyperlinks
% seguintes entre eles:
% A -> B , A -> C , B -> C , C -> D
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.
    
%      A   B   C   D 
H = [  0   0   0   0    % A
      1/2  0   0   0    % B
      1/2  1   0   0    % C
       0   0   1   0 ]; % D
   
beta = 0.8;
A = beta*H + (1-beta)*ones(4)/4;   % matriz da Google
A(:,4)=1/4;                        % resolver dead ends

v = ones(4)*1/4;
v10 = (A^10)*v';

pag = ["A" "B" "C" "D"];

fprintf("\n3)\n");
for i=1 : length(pag)
    fprintf("Pagerank da página %s: %.4f\n", pag(i), v10(i));
end
       
%% EXERCÍCIO 4
% Considere as 2 funções no fim deste script que implementam duas das funcionalidades necessárias à implementação de um filtro de Bloom.
% Considere também os dois conjuntos de chaves seguintes:

CH1= {'Amelia','Emma','Damian','Joe','Madison','Megan','Susan','Thomas'};
CH2= {'George','Jack','Oscar','Sarah'};

% (a) (3.0 valores) Desenvolva a função que falta para, com as funções
%     fornecidas, ter todas as funcionalidades necessárias à implementação
%     de um filtro de Bloom.

% RESPOSTA EM BAIXO:

% function check = Verificar(BF,key,k)
%     check=true;
%     h= 127;
%     chave= double(key);
%     n= length(BF);
%     for i= 1:length(chave)
%         h= mod(31*h+chave(i),2^32-1);
%     end
%     for i= k:-1:1
%         h= mod(31*h+i,2^32-1);
%         if BF(mod(h,n)+1) == 0
%             check=false;
%             break;
%         end
%     end
% end

% (b) (2.0 valores) Desenvolva um script que 
% (i) crie um filtro de Bloom de comprimento 100 baseado em 6 funções de dispersão com as chaves de CH1
% (ii) teste a pertença das chaves de CH1 no filtro de Bloom criado
% (iii) verifique se as chaves de CH2 pertencem ao filtro de Bloom

% RESPOSTA:
fprintf("\n4b)\n");
BF = Init(100);

for i=1 : length(CH1)
    BF = AddElement(BF, CH1{i}, 6);     %(i)
    fprintf("%s foi adicionado ao BF\n", CH1{i});
end

for i=1 : length(CH1)
    BF_check = Verificar(BF, CH1{i}, 6);      % (ii)
    
    if BF_check == 1
        fprintf("%s pertence ao BF\n", CH1{i});
    else
        fprintf("%s não pertence ao BF\n", CH1{i});
    end
end

for i=1 : length(CH2)
    BF_check = Verificar(BF, CH2{i}, 6);      % (iii)
    
    if BF_check == 1
        fprintf("%s pertence ao BF\n", CH2{i});
    else
        fprintf("%s não pertence ao BF\n", CH2{i});
    end
end


% dados da 4 abaixo
function BF= Init(n)  % inicializar
    BF= zeros(n,1);
end

function BF= AddElement(BF,key,k) % adicionar
    h= 127;
    chave= double(key);
    nBF= length(BF);
    
    for i= 1:length(key)
        h= mod(31*h+chave(i),2^32-1);
    end
    
    for i= k:-1:1
        h= mod(31*h+i,2^32-1);
        BF(mod(h,nBF)+1)= 1;
    end
end

% RESPOSTA 4A)
function check = Verificar(BF,key,k)
    check=true;
    h= 127;
    chave= double(key);
    n= length(BF);
    for i= 1:length(chave)
        h= mod(31*h+chave(i),2^32-1);
    end
    for i= k:-1:1
        h= mod(31*h+i,2^32-1);
        if BF(mod(h,n)+1) == 0
            check=false;
            break;
        end
    end
end

