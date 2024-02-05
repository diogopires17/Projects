clear;clc;
%% alinea a
N = 1e5; % numero de lancamentos
n= 20; % numero de  dardos 
m= 100; % numero de alvos
lancamentos = randi(m,n,N);

diferentes= zeros(1,N); %  Alocar espaço
for col=1:N
    diferentes(col) = length(unique(lancamentos(:,col))) ==n;
end
p1 = sum(diferentes)/N;
fprintf('Alinea a- A probabilidade de nenhum alvo ter sido atingido mais do que uma vez é %4f\n ',p1)