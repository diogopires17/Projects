udata = load("u.data");
u = udata(1:end,1:2); clear udata;
users = unique(u(:,1));
k = 50;
Nu = length(users);
movies = unique(u(:,2));
hashMov = zeros(length(movies),1);

Set = cell(Nu,1);

for n = 1:Nu
    ind = find(u(:,1) == users(n));
    for j = 1:length(ind)
        movie = u(j,2);
        Set{n} = [Set{n} HashFunction(movie)];
    end
end

dists = zeros(length(users),length(users));
for n1= 1:length(users)
    for n2= n1+1:length(users)
        debugS1 = Set{n1};
        debugS2 = Set{n2};
        testing = intersect(Set{n1},Set{n2});
        testing2 = unique(union(Set{n1},Set{n2}));
        dists(n1,n2) = 1-length(testing)/length(testing2);
    end
end
imagesc(dists)




