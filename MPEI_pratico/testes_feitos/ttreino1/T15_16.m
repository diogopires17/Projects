%Considere a comunicac¸ao sem fios entre um terminal e o seu ponto de acesso ˜ a rede. Cada pacote `
%de dados e enviado pelo emissor com informac¸ ´ ao adicional (dado por um c ˜ odigo corretor de erros) que ´
% permite ao recetor corrigir ate um erro por pacote. Consequentemente, designa-se por pacote perdido cada ´
%pacote que chegue ao destino com 2 ou mais erros. Devido a poss´ıveis interferencias eletromagn ˆ eticas, a ´
%probabilidade de haver erros num pacote e dada pela exist ´ encia de erros no pacote anterior, da seguinte ˆ
%forma:
%• se o pacote anterior nao cont ˜ em erros, o pacote seguinte contem um erro com probabilidade de 0,09 ´
%e contem dois ou mais erros com probabilidade de 0,01; ˆ
%• se o pacote anterior contem erros, o pacote seguinte contem um erro com probabilidade de 0,4 e ´
%contem dois ou mais erros com probabilidade de 0,1. ˆ
%Considere uma cadeia de Markov com 3 estados: 1 – pacote sem erros, 2 – pacote com 1 erro, 3
%– pacote com 2 ou mais erros. Considere ainda em todas as al´ıneas que o
%primeiro pacote transmitido %contem 3 erros. 


T = [0.9 0.09 0.01; 0  1 0  ; 0.5 0.4 0.1]';
x0 = [0 0 1]';
sum(T)



%% 1.b) Determine a probabilidade do quarto pacote ser recebido sem erros, com 1 erro ou com 2 ou mais erros

prob = T^3*x0;
fprintf("A probabilidade de:\n sem erros %.5f\n 1 erro: %.5f\n 2 ou mais erros: %.5f\n", prob(1), prob(2), prob(3));


%% Determine a probabilidade estacionaria dos estados calculando a probabilidade de cada estado at ´ e´
%% ao pacote em que a diferenc¸a de cada probabilidade entre esse pacote e o anterior seja nao superior a 0.001. ˜
%% Com base no resultado obtido, qual a probabilidade de perda de pacote? Qual seria a probabilidade de
%% perda de pacote sem o codigo corretor de erros?


while 1
    x0_old = x0;
    x0 = T * x0;
    if max(abs(x0 - x0_old)) < 0.01
        break
    end

end

%% 2) Considere que tem um pequeno conjunto de paginas web identificadas pelas letras C a G com as ´
%% seguintes ligac¸oes entre si no dia 1 de janeiro de 2017: a p ˜ agina C tem links para as p ´ aginas D e E; D ´
%% apenas tem links para E e C; E tem links para C, E e G; a pagina G tem links para D e F; F possui links ´
%% para todas as outras paginas, exceto para ela pr ´ opria:

%% Defina em Matlab a matriz da Google A = βH + (1 − β)[1N]N×N , em que: Hji e matriz de hyperlinks e representa 
%% as probabilidades de transic¸ao entre p ˜ aginas (da ´ i para a j);[1N]N×N e uma matriz de N por N com todas
%% as entradas iguais a 1/N; N representa o numero de p ´ aginas. Assuma ´ β = 0.8


T = [ 0 1/2 1/2 0 0; 1/2 0 1/2 0 0; 1/3 0 1/3 0 1/3; 1/4 1/4 1/4 0 1/4; 0 1/2 0 1/2 0]';
B = 0.8;
A = 0.8*T + (1-B)*(ones(5)/5);
%% 2.b) Usando a matriz A, qual o valor da estimativa do pagerank de cada pagina ao fim de 10 iterac¸ ´ oes ˜
%% do processo de calculo? Considere que se inicializa esse valor com um valor igual para todas as p ´ aginas ´
%% e igual a 1/N. 
x0 = (ones(1,5)/5)';

for i = 1:10
    x0 = A*x0;
end

%% 3) Considere o conjunto de caracteres C={’a’,’b’,’c’,’d’,’.’,’?’}, constitu´ıdo por 2 sinais de pontuac¸ao e ˜
%% 4 letras, e a probabilidade do caracter ´ j se seguir ao caracter ´ i, P[charj |chari], representadas na figura
%% seguinte:

%% 3.a) Represente em Matlab a matriz de transic¸ao˜ T, com Tji sendo a probabilidade de ao caracter ´ i se
%% seguir o caracter ´ j. Preencha a tabela a esquerda com o n ` umero da linha da matriz ´ T correspondente a
%% cada caracter. ´
T = [   0.7     0.2     0       0       0       0
        0.2     0       0.3     0       0       0
        0       0.6     0.3     0       0       0
        0.1     0.2     0.3     0.1     0       0
        0       0       0.1     0.5     1       0
        0       0       0       0.4     0       1   ];
vi = [ 1   0   0   0   0   0 ]';

prob10 = T^9*x0;
prob15 = T^14*x0;

Q = T(1:4, 1:4);
F = inv(eye(size(Q))-Q);
Comprimento = sum(F);
fprintf('Média do comprimento das cadeias começadas em C e terminam em ? ou . : %d\n', Comprimento(3));


