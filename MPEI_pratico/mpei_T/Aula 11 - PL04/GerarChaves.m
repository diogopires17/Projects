function chaves = GerarChaves(N, imin, imax, vCaracteres)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    % 1 tamanho da string
    comp = randi([imin, imax], 1,N);
    
    chaves = cell(N,1);
    %Criar a string
    for i=1:N
        x = randi([1 length(vCaracteres)], 1, comp(i));
        chaves(i) = {vCaracteres(x)};
    end

end

function indexes = discrte_rnd(n_ch, key_len, probvector)
    indexes = zeros(key_len,1);
    for k=1:key:length
        U=rand();
        indexes(k) = 1 + sum(U> cumsum(probvector))
    end
end