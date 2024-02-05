clear;

N = 1e5;
keys = 50;
arrT = 100:100:1000;


probabilidades = [];


for i = 1:length(arrT)
    T = arrT(i);

    %% CENTRO
    hashmap = randi(T-1, keys, N);
    
    unico = zeros(1,N);
    
    for col = 1:N
        %length(unique(lancamentos(:,col))) isto mostra o nr de valores unicos
        %que existe em cada coluna
        unico(col) = length(unique(hashmap(:,col)))==keys;
    end
    
    prob = sum(unico)/N;
    
    probabilidades = [probabilidades prob];
    %% FIM CENTRO
end

plot(arrT, probabilidades)










