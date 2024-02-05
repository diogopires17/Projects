function shingles = generate_shingles(input_string, shingle_size)
    shingles = {};
    for i = 1:(length(input_string) - shingle_size + 1)
        shingle = input_string(i:i+shingle_size-1);
        shingles{end+1} = shingle;
    end
end