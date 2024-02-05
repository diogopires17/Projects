% Exercício 2 da parte 2.2
%% Alínea C
clear;clc;
p =0.5; % probabilidade de vir coroa
n = 4; % numero de lancamentos
% É a distribuição Binomial com p = 0.5 e n= 4

%% Alínea D
for k=0:n
    pt(k+1) = nchoosek(n,k)*p^k*(1-p)^(n-k);% nchoosek(n,k)= n!/(n-k)!/k!
end
pt
stem(pt)

%% Alínea E
Sx= 0:4
% E[x] Média ou Valor Esperado
media = sum(Sx.*pt)

%variancia
aux = (Sx-media).^2;
variancia = sum(aux.*pt)

% desvio padrão
dp = sqrt(variancia)

%% Alínea F
pt_i=pt(1, 3)+pt(1, 4)+pt(1, 5)  %2 coroas + 3 coroas + 4 coroas
pt_ii=pt(1, 1)+pt(1, 2)         %0 coroas + 1 coroa
pt_iii=pt(1, 2)+pt(1, 3)+pt(1, 4)%1 coroa + 2 coroas + 3 coroas