clear;

N = 1e4;
arrkeys = 1:1:10;
T = 1000;


probabilidades = [];


for i = 1:length(arrkeys)

    keys = arrkeys(i);

    %% CENTRO
    hashmap = randi(T-1, keys, N);
    
    repetido = zeros(1,N);
    
    for col = 1:N
        %length(unique(lancamentos(:,col))) isto mostra o nr de valores unicos
        %que existe em cada coluna
        repetido(col) = not(length(unique(hashmap(:,col)))==keys);
    end
    
    prob = sum(repetido)/N;
    
    %% FIM CENTRO
    probabilidades = [probabilidades prob];
end

plot(arrkeys, probabilidades)










