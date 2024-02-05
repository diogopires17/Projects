function J = calcDistance(users, Set)

Nu = length(users);

% Calcula a distância de Jaccard entre todos os pares pela definição
J=zeros(Nu, Nu); % array para guardar distˆancias
h = waitbar(0,"Calculating...");

for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
        %calcular a similaridade
        J(n1,n2)=length(intersect(Set{n1},Set{n2}))/length(union(Set{n1},Set{n2})); 
        J(n1, n2)=1-J(n1, n2);  %calcular a distancia
    end
end

delete (h);

end