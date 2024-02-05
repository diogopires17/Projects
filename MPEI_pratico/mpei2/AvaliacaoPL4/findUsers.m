function Set = findUsers(Set, id_filme, user_names)
%FINDUSERS Summary of this function goes here
%   Detailed explanation goes here
    users = Set{id_filme};
    for i = 1:length(users)
        %if data(i,2) == id_filme
            user_id = users(i);
            %disp(user_id(i,2));
   
            fprintf("%d - %s\n", user_id, user_names{user_id});
                
            %Set{i}

        %end
    end
end

