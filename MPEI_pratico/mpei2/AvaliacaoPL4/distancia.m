function [J] = distancia(MinHash, Set, id_filme, filmes_info, user_names)
    Nu = length(Set);
    J=zeros(1,Nu);   % array para guardar distancias
    h= waitbar(0,'Calculating');
    for n1= 1:Nu
        waitbar(n1/Nu,h);

        %sim = length(intersect(Set{id_filme},Set{n1}))/length(union(Set{id_filme},Set{n1}));
        J(n1) = 1 - (sum(MinHash(n1,:)==MinHash(id_filme,:))/length(MinHash(1,:)));
        %J(1,n1) = 1 - sim;
    end
    delete (h)
    %J(1)
    [J,index] = sort(J);
    %J(find(index == 1))
    minimos = J(1:3); %apagar dps
    indexes_minimos = index(1:3); % apagar dps
    disp("Filmes Similares:")
    fprintf("ID %d - %s\nID %d - %s\n", index(2), filmes_info{index(2),1}, index(3), filmes_info{index(3),1});

    users_of_similares = union(Set{index(2)}, Set{index(3)});
    diff_users = setdiff(users_of_similares, Set{id_filme});
    
    disp("Users que ainda não avaliaram o filme:")
    for i = 1:length(diff_users)
        fprintf("ID %d - %s\n", diff_users(i), user_names{diff_users(i)});
    end

end