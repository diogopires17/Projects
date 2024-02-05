function [Avaliacoes] = numAvaliacoes(BloomMatrix, elem, k, seedMatrix, id_filme)
%BLOOMVERIFY Summary of this function goes here
%   Detailed explanation goes here
    Avaliacoes = inf;
    n = length(BloomMatrix(:,1));

    for hf = 1:k
           hashcode = rem(DJB31MA(elem,seedMatrix(k)),n)+1;
           if Avaliacoes > BloomMatrix(hashcode,id_filme)
                Avaliacoes = BloomMatrix(hashcode,id_filme);
           end
    end
end

