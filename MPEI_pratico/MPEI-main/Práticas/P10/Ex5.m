% Exercício 5 da parte 4.2
%% Criar os filtros de Bloom
n=8000; % tamanho do BloomFilter
s= 20; % número limite maximo de hash functions
nHF = 1:s; %nº de funcoes de dispersão

chavesOriginais=table2array(wordlistpreao20201103); % escolher as primeiras 1000 palavras
chaves=chavesOriginais(1:1000,1) ; % converter de table para matriz normal
m= length(chaves); % Teve de ser definido aqui, para ser utilizado no final
count= 1;

percentagemFP = zeros(1,s);
percentagemFPTeorico = zeros(1,s);
for k=1:s
    B = IniciarFiltro(n);
    for i = 1:length(chaves)
        B = AdicionarElementos(B, chaves{i}, k,n);
    end

    membro = {zeros(1,1000)};
    for i = 1:length(chaves)
        membro{i} = PertencaAoConjunto(B, chaves{i}, k,n);
    end
    
    falsosPositivos = 0;
    membro2 = {zeros(1,1000)};

    for i = 1:length(c2)
        membro2{i} = PertencaAoConjunto(B, c2{i}, k,n);
        if membro2{i} == "true"
            falsosPositivos = falsosPositivos + 1;
        end
    end
    percentagemFP(count) = (falsosPositivos/size(c2,2))*100;
    percentagemFPTeorico(count) = ((1-exp(-k*m/n))^k)*100;
   count = count+1;

end
%% A resposta à pergunta 5 é esta. A figura 3 serve para ver toda a curva
figure(2)
plot(nHF,percentagemFP, "b-o")
hold on
plot(nHF,percentagemFPTeorico,"r-*")
xlabel("Número de funções de dispersão --> k");
xlim([4 10])
ylabel("Percentagem de falsos positivos (%)");
legend('Computacional','Teórico')

figure(3)
plot(nHF,percentagemFP, "b-o")
hold on
plot(nHF,percentagemFPTeorico,"r-*")
xlabel("Número de funções de dispersão --> k");
ylabel("Percentagem de falsos positivos (%)");
legend('Computacional','Teórico')


fprintf("K ótimo: %d; percentagem de falsos positivos: %0.3f%%\n",nHF(percentagemFP==min(percentagemFP)),min(percentagemFP));

% K otimo teorico
% ver slides 49 ou 51 dos Filtros de Bloom
fprintf("K ótimo teórico é %0.3f\n",(0.693*n) /m);