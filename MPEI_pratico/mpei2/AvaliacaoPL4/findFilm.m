function findFilm(film_name, MinHashFilmNames, shingle_Size, nhf, filmes_info, RandomSeeds, BloomMatrix, bloomfilterHashMatrix, k)
    hashcodes = zeros(1,(strlength(film_name) - shingle_Size + 1));
    load("u.data")
    film_name_minhash = zeros(1,nhf);

    for hf = 1:nhf
        
        for j = 1:(strlength(film_name) - shingle_Size + 1)
            shingle = lower(char(extractBetween(film_name,j,j+shingle_Size-1)));
            
            hc = rem(DJB31MA(shingle,RandomSeeds(hf)),7919)+1;
           
            hashcodes(j) = hc;
        end
        film_name_minhash(hf) = min(hashcodes);
    end
    
    distance_film_name = zeros(1,length(filmes_info));

    for f= 1:length(filmes_info)
        distance_film_name(f) = 1 - (sum(MinHashFilmNames(f,:)==film_name_minhash(1,:))/length(MinHashFilmNames(1,:))); 
    end


    [distance_film_name,index] = sort(distance_film_name);
    flip(distance_film_name);
    flip(index);
    
    for i = 1:3
        total = 0;
        for elem = 3:5
            Avaliacoes = numAvaliacoes(BloomMatrix, elem, k, bloomfilterHashMatrix, index(i));
            total = total + Avaliacoes;
        end

        fprintf("%s - Número de vezes avaliado com nota igual ou superior a 3: %d\n",filmes_info{index(i),1},total)
        userfilms = u(:,2) == index(i);
        userRatings = sum(u(userfilms,3) >= 3)

    end
      
end

