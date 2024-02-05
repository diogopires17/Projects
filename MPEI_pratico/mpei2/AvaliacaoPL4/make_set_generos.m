function Set_generos = make_set_generos(file)
    
    users=file; 

    u= users(1:end,4:end); clear users;

    Nu= length(u);  

    Set_generos= cell(Nu,1);    
    for id = 1:Nu   
        Set_generos{id} = [Set_generos{id} u(id,:)];
    end
end