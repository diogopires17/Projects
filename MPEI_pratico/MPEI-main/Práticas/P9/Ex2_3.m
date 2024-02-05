% Exercício 2 e 3 da parte 4.1
clear;clc;
%% Alinea 2 a) 
alfabetoLower= 'a':'z';
alfabetoUpper= 'A':'Z';
alfabetoNums= '0':'9';

alfabeto= [alfabetoLower,alfabetoUpper]; % alfabeto das letras minusculas e maiusculas sem numeros
N=1e5;
imin=6;
imax=20;

% gerar as palavras
words =generate_unif(N,imin,imax,alfabeto);

%criar a tabela

for T= [5e5 1e6 5e6]
tic;% inicializa o tempo de execução
tabela= zeros(1,T);

% processar as palavras 1 a 1
hashCodes=zeros(1,N);
atribuicoes=zeros(1,T);
for i=1:N
    %aplicar hash function
    hash= string2hash(words{i});
    hash= rem(hash, T)+1;
    hashCodes(i)=hash;
    atribuicoes(hash)= atribuicoes(hash)+1;
end
figure(1)
histogram(hashCodes,100)
%% Alinea 2 b) Registe o número de atribuições a cada uma das posições de cada Hash Table.
% hist das atribuições
figure(2)
histogram(atribuicoes,0:5) % Alínea i do 3a

%% Alinea 2 c) número de colisões
ncol= sum(atribuicoes>1);
perc= ncol/T*100;
fprintf(1,"T=%d, ncol= %d, percent = %.3f\n",T, ncol, perc)
toc % finaliza o tempo de execução. Também é a 2 d
end