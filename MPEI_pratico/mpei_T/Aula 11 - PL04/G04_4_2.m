clear;
clc;

%% Exercício 1

% Bloom Filter

n = 8000;
k = 3;

file = fopen("wordlist-preao-20201103.txt", "r");
c1 = {zeros(1,1000)};
c2 = {zeros(1,10000)};

palavras = {zeros(1,11005)};

for i = 1:11005
    palavras{i} = fgetl(file); 
end


for i = 1: 1000
    c1{i} = palavras{i};
end

B = Inicializar_FiltroBloom(n);
%Verificação
%sum(B) % = 0
%max(B) % = 0
%stem(B) %= 0 
%size(B) %= n

for i = 1:length(c1)
    B = Adicionar_FiltroBloom(B, c1{i}, k,n);
end

membro = {zeros(1,1000)};
falsos = 0;
for i = 1:length(c1)
    membro{i} = Membro_FiltroBloom(B, c1{i}, k,n);
    if membro{i} == "false"
       falsos = falsos + 1;
    end
end

fprintf("Exercício 2 - Número de falsos negativos: %d\n", falsos);

%% Exercício 3

for i = 1:10000
    c2{i} = palavras{i+1000};
end

positivos = 0;
membro2 = {zeros(1,1000)};

for i = 1:length(c2)
    membro2{i} = Membro_FiltroBloom(B, c2{i}, k,n);
    if membro2{i} == "true"
       positivos = positivos + 1;
    end
end

fprintf("Exercício 3 - Número de falsos positivos: %d\n", positivos);
fprintf("              Percentagem de falsos positivos: %0.3f%% \n", (positivos/size(c2,2))*100);

%% Exercício 4 
m = length(c1);
pfp = (1-exp(-k*m/n))^k;

fprintf("Exercício 4 - Percentagem teórica de falsos positivos: %0.3f%% \n", pfp*100);

%% Exercício 5 - Analisando valores de k
count = 1;
nHF = 4:10;
percentagemFP = zeros(1,6);
percentagemFPTeorico = zeros(1,6);
for k=4:10
    B = Inicializar_FiltroBloom(n);
    for i = 1:length(c1)
        B = Adicionar_FiltroBloom(B, c1{i}, k,n);
    end

    membro = {zeros(1,1000)};
    for i = 1:length(c1)
        membro{i} = Membro_FiltroBloom(B, c1{i}, k,n);
    end
    

    positivos = 0;
    membro2 = {zeros(1,1000)};

    for i = 1:length(c2)
        membro2{i} = Membro_FiltroBloom(B, c2{i}, k,n);
        if membro2{i} == "true"
            positivos = positivos + 1;
        end
    end
    percentagemFP(count) = (positivos/size(c2,2))*100;
    percentagemFPTeorico(count) = ((1-exp(-k*m/n))^k)*100;
   count = count+1;

end

figure(1)
plot(nHF,percentagemFP, "b-o")
hold on
plot(nHF,percentagemFPTeorico,"r-+")
xlabel('k');
ylabel('Percentagem de falsos positivos')
legend('Computacional','Teórico')


%% Exercício 5
count = 1;
s = 20;

nHF = 1:s;
percentagemFP = zeros(1,s);
percentagemFPTeorico = zeros(1,s);
for k=1:s
    B = Inicializar_FiltroBloom(n);
    for i = 1:length(c1)
        B = Adicionar_FiltroBloom(B, c1{i}, k,n);
    end

    membro = {zeros(1,1000)};
    for i = 1:length(c1)
        membro{i} = Membro_FiltroBloom(B, c1{i}, k,n);
    end
    

    positivos = 0;
    membro2 = {zeros(1,1000)};

    for i = 1:length(c2)
        membro2{i} = Membro_FiltroBloom(B, c2{i}, k,n);
        if membro2{i} == "true"
            positivos = positivos + 1;
        end
    end
    percentagemFP(count) = (positivos/size(c2,2))*100;
    percentagemFPTeorico(count) = ((1-exp(-k*m/n))^k)*100;
   count = count+1;

end
figure(2)
plot(nHF,percentagemFP, "b-o")
hold on
plot(nHF,percentagemFPTeorico,"r-+")
xlabel('k');
ylabel('Percentagem de falsos positivos')
legend('Computacional','Teórico')




