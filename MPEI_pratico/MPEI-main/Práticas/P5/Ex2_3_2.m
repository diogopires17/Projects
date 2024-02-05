% Exercício 2 da parte 2.3
clear;clc;
p1 = 0.2/100; % probabilidade do componente 1 vir com defeito
p2 = 0.5/100; % probabilidade do componente 2 vir com defeito
pa = 1/100; % probabilidade de haver defeito na montagem

%% Alínea A
n= 8; % número de brinquedos
N= 1e5;
exp1= rand(n,N)< p1;
exp2= rand(n,N)< p2;

exp_montagem = rand(n,N)< pa;
ex= exp1 | exp2 | exp_montagem;
ex= sum(ex)== 0;   %identifica as caixas com 0 defeitos
probabilidade= sum(ex)/N

%% Alínea B
% É a distribuição Binomial com p = 0.5 e n= 0
p =0.017; % probabilidade de vir defeituosa.
n = 8; % numero de peças
for k=0:n
    pt(k+1) = nchoosek(n,k)*p^k*(1-p)^(n-k);% nchoosek(n,k)= n!/(n-k)!/k!
end
pT= pt(1)

%% Alínea C
Sx = 2:20;
prob = zeros(1,Sx(end)-1);
for n=Sx
    exp_montagem = rand(n,N)< pa;   
    casosfav = sum(exp1) + sum(exp2) + sum(exp_montagem);
    probabilidade = sum(casosfav==0) / N;
    prob(1,n-1)= probabilidade;
end

% Funcão de Massa Probabilidade
plot(Sx,prob);
xlabel("Número de brinquedos na caixa");
ylabel("Probabilidade  P[X =x_i]");
axis([1 21 0 1]);
grid()
title("Funcao massa de probabilidade (aka FMP) de SX");

% Alinea D
fprintf("Se a empresa quiser garantir pelo menos 90 porcento de probabilidade de caixas sem defeitos, a caixa não deve ter mais do que 4 brinquedos")