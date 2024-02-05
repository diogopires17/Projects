% Exercício 3 da parte 2.3
%% Alínea A
clear;clc;

p1 = 0.2/100; % probabilidade do componente 1 vir com defeito
p2 = 0.5/100; % probabilidade do componente 2 vir com defeito
pa = 1/100; % probabilidade de haver defeito na montagem


n= 8; % número de brinquedos
N= 1e5;
exp1= rand(n,N)< p1;
exp2= rand(n,N)< p2;

exp_montagem = rand(n,N)< pa;
ex= exp1 | exp2 | exp_montagem;
ex= sum(ex);   %identifica as caixas com defeito
px= [sum(ex==0)/N,sum(ex==1)/N,sum(ex==2)/N,sum(ex==3)/N,sum(ex==4)/N,sum(ex==5)/N,sum(ex==6)/N,sum(ex==7)/N,sum(ex==8)/N];

% Funcão de Massa Probabilidade
Sx = 0:8;
figure()
stem(Sx,px);

xlabel("Número de brinquedos com defeito");
ylabel("Probabilidade  P[X =x_i]");
grid()
axis([-1 n+1 0 1])
title("Funcao massa de probabilidade (aka FMP) de SX");

%% Alínea B
fprintf('Probabilidade (X>=2) = %6f\n',sum(px(3:end))); %começa a contar a partir do elemento 3


%% Alínea C
% Média ou Valor Esperado
media = sum(Sx.*px)

%variancia
aux = (Sx-media).^2;
variancia = sum(aux.*px)

% desvio padrão
dp = sqrt(variancia)
%% Alínea D
n= 16; % Tudo repetido, mas agora para 16 brinquedos

N= 1e5;
exp1= rand(n,N)< p1;
exp2= rand(n,N)< p2;

exp_montagem = rand(n,N)< pa;
ex= exp1 | exp2 | exp_montagem;
ex= sum(ex);   %identifica as caixas com defeito
px= [sum(ex==0)/N,sum(ex==1)/N,sum(ex==2)/N,sum(ex==3)/N,sum(ex==4)/N,sum(ex==5)/N,sum(ex==6)/N,sum(ex==7)/N,sum(ex==8)/N,sum(ex==9)/N,sum(ex==10)/N,sum(ex==11)/N,sum(ex==12)/N,sum(ex==13)/N,sum(ex==14)/N,sum(ex==15)/N,sum(ex==16)/N];

% Funcão de Massa Probabilidade
Sx = 0:16;
figure()
stem(Sx,px);

xlabel("Número de brinquedos com defeito");
ylabel("Probabilidade  P[X =x_i]");
axis([-1 n+1 0 1])
grid()
title("Funcao massa de probabilidade (aka FMP) de SX");

fprintf('Probabilidade (X>=2) = %6f\n',sum(px(3:end))); %começa a contar a partir do elemento 3

% Média ou Valor Esperado
media = sum(Sx.*px)

%variancia
aux = (Sx-media).^2;
variancia = sum(aux.*px)

% desvio padrão
dp = sqrt(variancia)