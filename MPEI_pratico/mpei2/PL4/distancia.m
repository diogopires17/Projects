function [J] = distancia(Set, Nu)
    
    J=zeros(Nu,Nu);   % array para guardar distancias
    h= waitbar(0,'Calculating');
    for n1= 1:Nu
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu
            %% Adicionar codigo aqui
            sim = length(intersect(Set{n1},Set{n2}))/length(union(Set{n1},Set{n2}));
            J(n1,n2) = 1 - sim;
        end
    end
    delete (h)

end