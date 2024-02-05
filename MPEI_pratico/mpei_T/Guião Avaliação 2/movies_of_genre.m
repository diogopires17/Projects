function count = movies_of_genre(movies, genre)
    
    hashes = collect_hashes(movies, 2, 0);

    % Create containers.Map with string keys
    bloomFilter = containers.Map('KeyType','char','ValueType','uint32');
    
    % Count occurrences of hashes using the containers.Map
    for i = 1:numel(hashes)
        hashKey = hashes{i};
        if isKey(bloomFilter, hashKey)
            bloomFilter(hashKey) = bloomFilter(hashKey) + 1;
        else
            bloomFilter(hashKey) = 1;
        end
    end

    % Count number of movies for the selected genre
    genreHash = string2hash(genre);
    genreHashStr = num2str(genreHash);
    count = bloomFilter(genreHashStr);
    
    disp(['Number of movies in genre "', genre, '": ', num2str(count)]);

    fprintf('\n')
end