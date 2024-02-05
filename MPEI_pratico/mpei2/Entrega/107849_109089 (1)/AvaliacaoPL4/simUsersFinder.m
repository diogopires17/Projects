function nao_viram_o_filme = simUsersFinder(id_filme,distancia_user_generos, udata, Set)
%BERNARDO Summary of this function goes here
%   Detailed explanation goes here
    
    ind = find(udata(:,2) == id_filme);
    
    users = udata(ind(:,1)); %users que viram o filme
    nao_viram_o_filme = dictionary([],[]);
    for i=1:length(users)
        userDist = distancia_user_generos(users(i),:); %para cada user ve as distancias
        indOfDist = userDist < 0.9;
        indOfDist(users(i)) = 0; % remove user himself from index;
        simUsers = find(indOfDist);

        for j=1:length(simUsers)
            watchedFilm = ismember(Set{id_filme},simUsers(j));
            if watchedFilm == zeros(length(Set{id_filme}),1)    %se não viu o filme
                if isKey(nao_viram_o_filme , simUsers(j)) 
                    nao_viram_o_filme(simUsers(j)) = nao_viram_o_filme(simUsers(j))+1;
                else
                    nao_viram_o_filme(simUsers(j)) = 1;
                end
            end
        end
    end
    
end

