function MinHashFilmNames = minHashFilmNames(filmes_info, nhf, shingle_Size, RandomSeeds)
    Nf = length(filmes_info);
    MinHashFilmNames = inf(Nf,nhf);

    h = waitbar(0,'A calcular minHashFilmNames()...');
    for f = 1:Nf
        waitbar(f/Nf,h);
        film = string(filmes_info{f,1});
        
        for hf = 1:nhf
            x = zeros(1,(strlength(film) - shingle_Size + 1)); % nr de shingles
            
            for j = 1:(strlength(film) - shingle_Size + 1)
                shingle = lower(char(extractBetween(film,j,j+shingle_Size-1)));
                
                hc = rem(DJB31MA(shingle,RandomSeeds(hf)),7919)+1;
              
                x(j) = hc;
            end
            MinHashFilmNames(f,hf) = min(x);
        end
    end
    delete(h)
end