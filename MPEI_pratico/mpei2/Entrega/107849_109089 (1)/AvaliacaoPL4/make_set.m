function [Set, Set_Scores, Nu, filmes] = make_set(file)

    % Código base para deteção de pares similares
    
    udata=file; 
    
    u= udata(1:end,1:3); clear udata;
    
    filmes = unique(u(:,2));     
    Nu= length(filmes);     
    
    Set= cell(Nu,1);    
    Set_Scores = cell(Nu,1);
    for n = 1:Nu      
        ind = find(u(:,2) == filmes(n));
        Set{n} = [Set{n} u(ind,1)];
        Set_Scores{n} = [Set_Scores{n} u(ind,3)];
    end
end