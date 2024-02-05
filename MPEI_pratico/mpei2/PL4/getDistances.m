function distancias = getDistances(users,movieSet)
    Nu = length(users);
    distancias = zeros(Nu,Nu); 
    h = waitbar(0,"Calculating distances...");

    for n1= 1:Nu
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu
          distancias(n1,n2) = length(intersect(movieSet{n1},movieSet{n2}))/length(union(movieSet{n1},movieSet{n2}));  
        end
    end

    delete (h);
end