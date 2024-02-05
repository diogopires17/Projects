clear;clc;
%% alinea d
%Juntamos os valores de m num só array para não ter que repetir o código
%para cada valor de m

n= 100; % numero de lancamentos
N= 1e5;%  num experiencias
mList = [200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];
ProbA = zeros(length(mList), 1);

for i= 1:length(mList)
    diferentes= zeros(1,N); %  Alocar espaço
    lancamentos = randi(mList(i),n,N); % é o mesmo disto: ceil(rand(n,N) * m);
    for col=1:N
        diferentes(col) = length(unique(lancamentos(:,col))) <n;
    end

    ProbA(i) = sum(diferentes)/N;
end

plot(mList, ProbA,'g*-')
title('Alinea 2d');
xlabel('num. Lançamentos');
ylabel('Probabilidade');