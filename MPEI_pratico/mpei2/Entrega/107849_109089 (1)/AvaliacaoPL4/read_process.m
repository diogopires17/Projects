clear;
clc;
%Random = load("matlab.mat");

udata = load('u.data');
users = readcell('users.txt','Delimiter',';');
filmes_info = readcell('film_info.txt','Delimiter','\t');

% isto retira o ano
%temp_filmes_info = readcell('film_info.txt','Delimiter','(');
%film_Names = temp_filmes_info(:,1);

%film_NamesAndYears = split(filmes_info{:,1});
%film_Names = film_NamesAndYears{:,1};

users_names = users(:,2);
[Set, Set_Scores, Nu, filmes] = make_set(udata);

%% Opcao 2
nhf = 200;
MinHashUsers = minHashUsers(Set, nhf); % SET: filme = {users}

%% Opção 3
Set_generos = make_set_generos(users);
for i = 1:length(Set_generos)
    set =Set_generos{i,1};
    x = cellfun(@numel,set);
    set(x==1) = [];
    Set_generos{i,1}= set;
end
distancia_user_generos = distanciaGeneros(Set_generos, nhf);
%% Opcao 4
arrTemp=zeros(1,length(Set_Scores));
shingle_size = 3;
RandomSeeds = randi([1 1000],1,nhf);

MinHashFilmNames = minHashFilmNames(filmes_info, nhf, shingle_size, RandomSeeds);


for i = 1:length(Set_Scores)
    arrTemp(i) = length(Set_Scores{i});
end

m = 5;
n = 48;
k = 7;
nr_filmes = length(filmes_info(:,1));

bloomfilterHashMatrix = randi([1 1000],1,k);
BloomMatrix = zeros(n,nr_filmes); % Matrix coiso x quantidade de filmes

for id_filme = 1:nr_filmes
    BloomMatrix = CountBloomFilter(BloomMatrix, bloomfilterHashMatrix, Set_Scores{id_filme,1}, id_filme, n, k);   % Nome, id, len(B), k
end