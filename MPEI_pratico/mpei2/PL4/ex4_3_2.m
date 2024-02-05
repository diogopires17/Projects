clear;

tic
[Set,Nu, users] = make_set('u.data');

[J] = distancia(Set, Nu);


threshold = 0.4;
SimilarUsers = pairs(J, Nu, users, threshold);
SimilarUsers

toc