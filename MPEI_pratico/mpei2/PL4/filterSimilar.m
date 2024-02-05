function similarUsers = filterSimilar(users,distancias,threshold)
    Nu = length(users);
    h = waitbar(0,"Filtering...");
    similarUsers = zeros(1,3);
    k= 1;

    for n1= 1:Nu
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu
            if distancias(n1,n2) < threshold
                similarUsers(k,:) = [users(n1) users(n2) distancias(n1,n2)];
                k = k+1;
            end
        end
    end

    delete (h);
end