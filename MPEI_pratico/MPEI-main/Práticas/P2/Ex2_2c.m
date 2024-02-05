%% alinea c
m= 1000;  %fixar m
ns= 10:10:100;
res = [];

for n= ns
    diferentes= zeros(1,N);
    lancamentos = randi(m,n,N);
    for col=1:N
        diferentes(col) = length(unique(lancamentos(:,col))) <n;
    end
    res = [res sum(diferentes)/N];
end

subplot(1,2,1)
plot(ns,res,'r*-'), xlabel('n'), ylabel('prob'), title('m=1000')

% Segundo grafico para numero m diferente
m= 10000;  %fixar m
ns= 10:10:100;
res = [];

for n= ns
    diferentes= zeros(1,N);
    lancamentos = randi(m,n,N);
    for col=1:N
        diferentes(col) = length(unique(lancamentos(:,col))) <n;
    end
    res = [res sum(diferentes)/N];
end

subplot(1,2,2)
plot(ns,res,'r*-'), xlabel('n'), ylabel('prob'), title('m=10000')