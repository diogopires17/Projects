% Exercício 1 da parte 3.2
%% Alinea A-> Confirme os valores calculados nas alínas (f) e (g) através de simulacao 
H = [0.8 0.2 0 0 0; 0 0.6 0.3 0.1 0; 0 0 1 0 0; 0.3 0.2 0 0.4 0.1; 0 0 0 0 1]';

N = 1e4; %Nº experiencias (aumentar eleva drasticamente o tempo de execução, daí ser um valor baixo)
N_X1 = zeros(N,1); %vetor para guardar o nº de passos ate absorcao, com X0 = 1
N_X2 = zeros(N,1); %vetor para guardar o nº de passos ate absorcao, com X0 = 2
N_X4 = zeros(N,1); %vetor para guardar o nº de passos ate absorcao, com X0 = 4

E1_ab3 = 0; %Nº absorções no estado 3, com X0 = 1
E1_ab5 = 0; %Nº absorções no estado 5

for i= 1: N
    aux = crawl(H,1,[3 5]); % começa no estado 1 e acaba no 3 ou 5, pois esses são estados absorventes
    if aux(1,end) == 3
        E1_ab3 = E1_ab3 +1;
    else
        E1_ab5 = E1_ab5 +1;
    end

    N_X1(i) = length(aux)-1;       %Nº passos = length-1
    N_X2(i) = length(crawl(H,2,[3 5]))-1;
    N_X4(i) = length(crawl(H,4,[3 5]))-1;
end

Media_X1 = sum(N_X1)/N; %6 f) ~=9.47   Com N =10e4, ~= 9.5094
Media_X2 = sum(N_X2)/N; %6 f) ~=4.47   Com N =10e4, ~= 4.4153
Media_X4 = sum(N_X4)/N; %6 f) ~=7.89   Com N =10e4, ~= 7.8881

Prob_Abs3 = E1_ab3/N; %6 g) 3 = 0.94737  5 = 0.05263
Prob_Abs5 = E1_ab5/N; % ou então 1 - Prob_Abs3

fprintf("--------a)--------\n");
fprintf("(6f) Nº médio de passos até absorção começando no estado: 1 = %f  2 = %f  4 = %f\n",Media_X1,Media_X2,Media_X4);
fprintf("(6g) Probabilidade de absorção (começando no estado 1) nos estados: 3 = %f  5 = %f\n",Prob_Abs3,Prob_Abs5);

%% Alinea B-> Guarde numa variável do tipo cell array do Matlab 10000 sequências que começam num dos estados 

N = 10000; % tamanho do cell array
Estados = [1,2,4]; %estados não absorventes
E = datasample(Estados,N); %Estados escolhidos aleatoriamente equivalente a Estados(randi(length(Estados)))

a = cell(1,N);

for i= 1: N
    a{i} = crawl(H,1,[3 5]); %Gerar sequência
end

TamSeq = cellfun('length',a)   %Tamanho das sequências do cell array. Cellfun aplica a função a cada cell do cell array
maxSeq = max(TamSeq);   %Sequência de tamanho máximo
minSeq = min(TamSeq);   %Sequência de tamanho mínimo

fprintf("--------b)--------\n");
fprintf("Comprimento das sequências geradas    mín: %d    máx: %d\n",minSeq,maxSeq);
