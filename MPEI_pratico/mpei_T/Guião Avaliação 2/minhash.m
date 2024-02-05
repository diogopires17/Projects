% Função para calcular a assinatura MinHash para um conjunto de shingles
function signature = minhash(shingles, num_hash_functions)
    % Gera uma assinatura MinHash para um conjunto de shingles
    signature = Inf(1, num_hash_functions);
    for i = 1:num_hash_functions
        hash_values = zeros(1, length(shingles));
        for j = 1:length(shingles)
            hash_values(j) = mod(i * string2hash(shingles{j}), 2^32 - 1) + 1;
        end
        % Use min function only if there are non-zero elements in hash_values
        nonZeroValues = hash_values(hash_values > 0);
        if ~isempty(nonZeroValues)
            signature(i) = min(nonZeroValues);
        end
    end
end