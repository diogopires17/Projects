clear;
clc;
    %Random = load("matlab.mat");

udata = load('u.data');
users = readcell('users.txt','Delimiter',';');
filmes_info = readcell('film_info.txt','Delimiter','\t');

users_names = users(:,2);
[Set,Nu, filmes] = make_set(udata);

MinHash = calc_minHash(Set, 200, Nu);

