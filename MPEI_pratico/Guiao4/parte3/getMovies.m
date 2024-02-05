function movies = getMovies(users,data)
    Nu = length(users);
    movies = cell(Nu,1);

    for n = 1:Nu
        ind = find(data(:,1) == users(n));
        movies{n} = [movies{n} data(ind,2)];
    end
end