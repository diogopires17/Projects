
id = 0;

while(id<1 || id>1682)
    id = input("Insert Film ID (1 to 1682): ");
    if(id<1 || id>1682)
        disp("Invalid ID! Try again.");
    end
end

opts = ["1 - Users that evaluated current movie" "2 - Suggestion of users to evaluate movie" "3 - Suggestion of users to based on cmmon interests" "4 - Movies feedback based on popularity" "5 - Exit"];
msg = "Select choice: ";

input = 0;

choice = menu(msg,opts);

while(choice ~= 5)
    switch(choice)
        case 1
            disp("Executing 1")
            findUsers(Set, id, users_names);
        case 2
            disp("Executing 2")
            [J] = distancia(MinHash, Set, id, filmes_info, users_names);

        case 3
            disp("Executing 3")
        case 4
            disp("Executing 4")
    end

    choice = menu(msg,opts);
end
id = 0;