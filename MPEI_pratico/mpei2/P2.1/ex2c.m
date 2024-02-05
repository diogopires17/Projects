n = 10:10:100; %nr dardos
m = [1000, 100000]; %nr alvos
N = 1e5;
prob = [];
prob2 = [];

%% Para m=1000
for x = 1:length(n)
    nrdardos = n(x);
    lancamentos = randi(m(1),nrdardos, N); % cria matriz n x M com valores entre 1:m
    diferentes = zeros(1,N);
    
    for col = 1:N
        %length(unique(lancamentos(:,col))) isto mostra o nr de valores unicos
        %que existe em cada coluna
        diferentes(col) = length(unique(lancamentos(:,col)))==nrdardos;
    end
    
    p1 = 1 - sum(diferentes)/N;

    prob = [prob p1];
end


%% Para m=100000
for x = 1:length(n)
    nrdardos = n(x);
    lancamentos = randi(m(2),nrdardos, N); % cria matriz n x M com valores entre 1:m
    diferentes2 = zeros(1,N);
    
    for col = 1:N
        %length(unique(lancamentos(:,col))) isto mostra o nr de valores unicos
        %que existe em cada coluna
        diferentes2(col) = length(unique(lancamentos(:,col)))==nrdardos;
    end
    p2 = 1 - sum(diferentes2)/N;

    prob2 = [prob2 p2];
end

subplot(1,2,1);
plot(n, prob);
subplot(1,2,2);
plot(n, prob2);