% Exercício 1,2,3 e 4 da parte 4.2
%% Dados
n=8000; % tamanho do BloomFilter
k=3; % nº de funcoes de dispersão
chavesOriginais=table2array(wordlistpreao20201103); % escolher as primeiras 1000 palavras
chaves=chavesOriginais(1:1000,1) ; % converter de table para matriz normal

%% Teste à função IniciarFiltro
F= IniciarFiltro(n);
sum(F);
max(F);
%stem(F); % Tem de dar um grafico de pontos todos no 0
size(F);

%% Exercício 1
filtro=IniciarFiltro(n); % usar  a função para inicializar o filtro

for i=1:length(chaves)
    filtro=AdicionarElementos(filtro,chaves{i},k,n);
end
%% Exercício 2
% Nunca há falsos negativos. Vamos ver se é verdade
falsosNegativos =0;

for i= 1:length(chaves)
    if ~PertencaAoConjunto(filtro,chaves{i},k,n) 
        falsosNegativos = falsosNegativos+1; %Contador de falsos Negativos. Para estar bem, deveria dar 0
    end
end

fprintf("Exercício 2 - Número de falsos negativos: %d\n", falsosNegativos);

%% Exercício 3
% Costuma haver falsos positivos. Vamos ver se existem ou não
% Vamos ver se alguma das chaves que não pertece ao conjunto, aparece como
% positivo.
% Nesse caso, o contador incrementa.
falsosPositivos =0;
chavesF= chavesOriginais(1001:11000,1);

% Não estava a funcionar, fiz com cell arrays
% for i= 1:length(chavesF)
%     if PertencaAoConjunto(filtro,chavesF{i},k,n) 
%         falsosPositivos= falsosPositivos + 1;% contador do número de falsos positivos
%     end
% end

membro2 = {zeros(1,1000)};
for i = 1:length(chavesF)
    membro2{i} = PertencaAoConjunto(filtro,chavesF{i},k,n);
    if membro2{i} == "true"
       falsosPositivos = falsosPositivos + 1;
    end
end

fprintf("Exercício 3 - Número de falsos positivos: %d\n", falsosPositivos);
fprintf("A percentagem de falsos positivos é %f%%\n",falsosPositivos/length(chavesF)*100);
%% Exercício 4
% Valor teórico
fprintf("Valor teorico da taxa de falsos positivos é %f%%\n", ...
    100*(1-exp(-k*length(chaves)/length(filtro)))^k);