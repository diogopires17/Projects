function count = movies_of_genre_year(movies, genre, year)

    hashes = collect_hashes(movies, 3, year);

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
    
    % Count number of movies for the selected genre in the given year
    genreHash = string2hash(genre);
    genreHashStr = num2str(genreHash);
    count = bloomFilter(genreHashStr);
    
    fprintf('Number of movies in genre "%s" in year %d: %d\n', genre, year, count);
    fprintf('\n');
end