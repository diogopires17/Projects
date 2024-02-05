clear;

n = 100; %nr dardos
m = [200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000]; %nr alvos
N = 1e5;
prob = [];

%% Para m=1000
for x = 1:length(m)
    mi = m(x);
    lancamentos = randi(mi,n, N); % cria matriz n x M com valores entre 1:m
    diferentes = zeros(1,N);
    
    for col = 1:N
        %length(unique(lancamentos(:,col))) isto mostra o nr de valores unicos
        %que existe em cada coluna
        diferentes(col) = length(unique(lancamentos(:,col)))==n;
    end
    
    p1 = 1 - sum(diferentes)/N;

    prob = [prob p1];
end
plot(m, prob);