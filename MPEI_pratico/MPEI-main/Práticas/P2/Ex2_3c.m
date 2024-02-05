clear;clc;
%% alinea c
N= 1e5; % numero de experiencias
T= 100:100:1000; %tamanho do array
keys= 50; % numero de chaves


lancamentos = randi(T,keys,N);

zerocolisions= zeros(1,length(T));
for col=1:N
    % falta fazer as expressoes dentro do for!
    zerocolisions(col) = length(unique(lancamentos(:,col))) <keys;
end
p1 = sum(zerocolisions)/N

plot(T,zerocolisions) 

title('Alinea 3c');
xlabel('T');
ylabel('Probabilidade');