function Set = findUsers(Set, id_filme, user_names)
%FINDUSERS Summary of this function goes here
%   Detailed explanation goes here
    users = Set{id_filme};
    disp("Lista de utilizadores que avaliaram o filme:")
    for i = 1:length(users)
        user_id = users(i);
        fprintf("%d - %s\n", user_id, user_names{user_id});
    end
end

