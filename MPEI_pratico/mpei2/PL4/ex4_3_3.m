udata=load("u.data");
u= udata(1:end,1:2); clear udata;

users = unique(u(:,1));

tic;
movies = getMovies(users,u);
fprintf("getMovies(): %7.6es\n",toc);

tic;
distancias = getDistances(users,movies);
fprintf("getDistances(): %7.6es\n",toc);

tic;
SimilarUsers = filterSimilar(users,distancias,0.4);
fprintf("filterSimimlar(): %7.6es\n",toc);

fprintf("Similar users (%d pairs):\n",height(SimilarUsers));
for n= 1:height(SimilarUsers)
    u1 = SimilarUsers(n,1);
    u2 = SimilarUsers(n,2);
    d = distancias(users==u1,users==u2);
    fprintf("Pair (%03d;%03d): %f\n",u1,u2,d);
end