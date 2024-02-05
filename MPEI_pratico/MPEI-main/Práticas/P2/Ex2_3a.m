clear;clc;
%% alinea a
N= 1e5; % numero de experiencias
T= 1000; %tamanho do array
keys= 10; % numero de chaves


lancamentos = randi(T,keys,N);

diferentes= zeros(1,N);
for col=1:N
    diferentes(col) = length(unique(lancamentos(:,col))) <keys;
end
p1 = sum(diferentes)/N


%% alinea b
% Grafico da alinea a

plot(p1,keys) 
