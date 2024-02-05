clear;
clc;

pd = 0.3; %probabilidade de defeito
k = 0:5; %numero de peças defeituosas
n = 5; %numero de peças
N = 1e5; %numero de experiencias

%% Alinea a)i

for i = 0:5
    pecas = rand(n,N) < pd;
    defeitos = sum(pecas) == i;
    ndefs = sum(defeitos);
    p(i+1) = ndefs/N;
end

stem(k,p);
title("Função massa de probabilidade");
xlabel("x");
ylabel("p(x)");

%% Alinea a)ii

pA = zeros(length(k));

pA(1) = p(1);

for i = 2:length(k)
    pA(i) = pA(i-1) + p(i);
end

figure(2);
stairs(k,pA);
title("Função distribuida acumulada");
xlabel("x");
ylabel("F(x)");

%% Alinea a)iii

pecas = rand(n,N) < pd;
defeitos = sum(pecas) <= 2;
ndefs = sum(defeitos);
p = ndefs/N;

fprintf("Probabilidade de iii) %f \n", p);

%% Alinea b)i

pTeorico(1) = nchoosek(n,0)*pd^0*(1-pd)^(n-0);

for i = 2:length(k)
    pTeorico(i) = pTeorico(i-1) + nchoosek(n,i-1)*pd^(i-1)*(1-pd)^(n-(i-1));

end

figure(3);
stairs(k,pTeorico);
title("Função distribuida acumulada (Analitico)");
xlabel("x");
ylabel("F(x)");

%% Alinea b)ii

fprintf("Probabilidade de ii) %f \n", pTeorico(3));




