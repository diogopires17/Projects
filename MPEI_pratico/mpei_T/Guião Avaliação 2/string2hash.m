function hash = string2hash(str)
    hash = 0;
    for i = 1:length(str)
        hash = mod(hash * 256 + double(str(i)), 2^32 - 1);
    end
end
