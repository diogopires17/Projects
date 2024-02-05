%read_process;
clear id;
id = 0;

while(id<1 || id>1682)
    id = input("Insert Film ID (1 to 1682): ");
    if(id<1 || id>1682)
        disp("Invalid ID! Try again.");
    end
end

opts = ["1 - Users that evaluated current movie" "2 - Suggestion of users to evaluate movie" "3 - Suggestion of users to based on cmmon interests" "4 - Movies feedback based on popularity" "5 - Exit"];
msg = "Select choice: ";

choice = menu(msg,opts);

while(choice ~= 5)
    switch(choice)
        case 1
            disp("--------------- OPÇÃO 1 ---------------")
            findUsers(Set, id, users_names);

        case 2
            disp("--------------- OPÇÃO 2 ---------------")
            [J] = distancia(MinHashUsers, Set, id, filmes_info, users_names);
    
        case 3
            disp("--------------- OPÇÃO 3 ---------------")
            nao_viram_o_filme = simUsersFinder(id, distancia_user_generos, udata, Set);

            [sorted, index] = sort(values(nao_viram_o_filme), "descend");
            usersId = keys(nao_viram_o_filme);
            fprintf("%d - %s\n", usersId(index(1)), users_names{usersId(index(1))});
            fprintf("%d - %s\n", usersId(index(2)), users_names{usersId(index(2))});

        case 4
            disp("--------------- OPÇÃO 4 ---------------")
            film_name = lower(input("Write a string: ", "s"));
            while (length(film_name) < shingle_size)
                fprintf('Write a minimum of %d characters\n', shingle_size);
                film_name = lower(input("Write a string: ", "s"));
            end
            findFilm(film_name, MinHashFilmNames, shingle_size, nhf, filmes_info, RandomSeeds, BloomMatrix, bloomfilterHashMatrix, k);

    end

    choice = menu(msg,opts);
end

id = 0;