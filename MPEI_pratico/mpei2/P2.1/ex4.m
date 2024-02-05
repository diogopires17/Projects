clear all;
clc;

%% ALINEA a)
prob = 0;
m = 365; %nr dias
N = 1e4;
n = 1;
nArr = [];
probArr = [];

while prob < 0.5
    n=n+1;
    nArr = [nArr n];
    pessoas = randi(m, n, N);

    unico = zeros(1,N);

    for col = 1:N
        %length(unique(lancamentos(:,col))) isto mostra o nr de valores unicos
        %que existe em cada coluna
        unico(col) = length(unique(pessoas(:,col)))<n;
    end
    
    prob = sum(unico)/N;

    probArr = [probArr prob];


end

figure(1);
disp(n);
plot(nArr,probArr);

%% ALINEA b)
prob = 0;
n = 1;
nArr = [];
probArr = [];

while prob < 0.9
    n=n+1;
    nArr = [nArr n];
    pessoas = randi(m, n, N);

    unico = zeros(1,N);

    for col = 1:N
        %length(unique(lancamentos(:,col))) isto mostra o nr de valores unicos
        %que existe em cada coluna
        unico(col) = length(unique(pessoas(:,col)))<n;
    end
    
    prob = sum(unico)/N;

    probArr = [probArr prob];

end

figure(2);
disp(n);
plot(nArr,probArr);