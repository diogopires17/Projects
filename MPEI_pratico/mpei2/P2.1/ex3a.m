clear;
N = 1e5;
keys = 10;
T = 1000;

hashmap = randi(T-1, keys, N);

repetido = zeros(1,N);

for col = 1:N
    %length(unique(lancamentos(:,col))) isto mostra o nr de valores unicos
    %que existe em cada coluna
    repetido(col) = length(unique(hashmap(:,col)))~=keys;
end

prob = sum(repetido)/N




