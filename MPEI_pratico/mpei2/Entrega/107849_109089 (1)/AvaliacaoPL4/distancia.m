function [J] = distancia(MinHash, Set, id_filme, filmes_info, user_names)
    Nu = length(Set);
    J=zeros(1,Nu);   % array para guardar distancias
    h= waitbar(0,'Calculating');
    for n1= 1:Nu
        waitbar(n1/Nu,h);
        J(n1) = 1 - (sum(MinHash(:,n1)==MinHash(:,id_filme))/length(MinHash(:,1)));  
    end
    delete (h)

    [J,index] = sort(J);

    disp("Filmes Similares:")
    fprintf("ID %d - %s\nID %d - %s\n", index(2), filmes_info{index(2),1}, index(3), filmes_info{index(3),1});

    users_of_similares = union(Set{index(2)}, Set{index(3)});
    diff_users = setdiff(users_of_similares, Set{id_filme});

    if ~isempty(diff_users)
        disp("Users que ainda não avaliaram o filme:")
        for i = 1:length(diff_users)
            fprintf("ID %d - %s\n", diff_users(i), user_names{diff_users(i)});
        end
    else
        disp("Todos os users já avaliaram o filme atual")
    end
end