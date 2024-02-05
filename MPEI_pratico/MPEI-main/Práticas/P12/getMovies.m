function Set = getMovies(users, u)

Nu= length(users); % Número de utilizadores
Set= cell(Nu,1); % Usa células

for n = 1:Nu % Para cada utilizador
    ind = u(:,1) == users(n);
    Set{n} = [Set{n} u(ind,2)];
end

end