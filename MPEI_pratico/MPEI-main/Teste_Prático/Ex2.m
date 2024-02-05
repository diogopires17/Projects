%a)
k=1; % nº de HF
m=300; % nº de palavras a adicionar
FP= 0.03;
n= round((k*m)/log(2)) % tamanho do Bloom Filter

% Gerar as palavras aleatorias
alfabeto= 'a':'z';
N=300;
imin=8;
imax=8;

words =generate_unif(N,imin,imax,alfabeto); % gerar todas as palavras de comp 8
length(unique(words))
words5carateres = 0.4 * height(words);
for i= 120
    palabvra= words{i};
    words{i}=palabvra(1:5);
    i= i+1;
end
words
%% Teste à função IniciarFiltro
F= IniciarFiltro(n);
sum(F);
max(F);
%stem(F); % Tem de dar um grafico de pontos todos no 0
size(F);


filtro=IniciarFiltro(n); % usar  a função para inicializar o filtro

for i=1:height(words)
    filtro=AdicionarElementos(filtro,words{i},k,n);
end

%% Exercício 3
% Costuma haver falsos positivos. Vamos ver se existem ou não
% Vamos ver se alguma das chaves que não pertece ao conjunto, aparece como
% positivo.
% Nesse caso, o contador incrementa.
falsosPositivos =0;
N=100000;
wordsCompare =generate_unif(N,imin,imax,alfabeto); % gerar todas as palavras de comp 8
membro2 = {zeros(1,1000)};
for i = 1:length(wordsCompare)
    membro2{i} = PertencaAoConjunto(filtro,wordsCompare{i},k,n);
    if membro2{i} == "true"
       falsosPositivos = falsosPositivos + 1;
    end
end

fprintf("Exercício 3 - Número de falsos positivos: %d\n", falsosPositivos);
fprintf("A percentagem de falsos positivos é %f%%\n",falsosPositivos/height(wordsCompare)*100);