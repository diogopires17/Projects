clc, clear;
udata=load('u.data');
u= udata(1:end,1:2); clear udata;

%% ex1
fprintf("ex.1)\n")

users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % Número de utilizadores

Set= cell(Nu,1); % Usa células
for n = 1:Nu % Para cada utilizador
    ind = find(u(:,1) == users(n));
    Set{n} = [Set{n} u(ind,2)];
end


% Calcula a distância de Jaccard entre todos os pares pela definição.
J=zeros(Nu, Nu); % array para guardar distˆancias
tic;
h= waitbar(0,'Calculating...');
for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
        %calcular a similaridade
        J(n1,n2)=length(intersect(Set{n1},Set{n2}))/length(union(Set{n1},Set{n2})); 
        J(n1, n2)=1-J(n1, n2);  %calcular a distancia
    end
end
fprintf("Duração do cálculo das distâncias: %.2fs\n", toc)
delete (h)
save("Distances.mat", "J")



% Com base na distância, determina pares com
% distância inferior a um limiar pré-definido

threshold =0.4; % limiar de decisão

% Array para guardar pares similares (user1, user2, distância)
SimilarUsers= zeros(1,3);
k= 1;
tic;
for n1= 1:Nu
    for n2= n1+1:Nu
        if J(n1, n2)<threshold
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end
fprintf("Duração da determinação das distâncias abaixo de %.1f: %.4fs\n", threshold, toc)
fprintf("Pares de utilizadores semelhantes (%d):\n", length(SimilarUsers))
for i=1:length(SimilarUsers)
    fprintf("\tUser1:%d\tUser2:%d\tDistância:%.3f\n", SimilarUsers(i, 1), SimilarUsers(i, 2), SimilarUsers(i, 3))
end

%% ex2
fprintf("\n")

%users = unique(u(:,1)); % Extrai os IDs dos utilizadores
%users = users(randperm(length(users), 100));

%filmes=getMovies(users, u);
%distancias=calcDistance(users, filmes);
%limiar =0.4; % limiar de decisão
%semelhantes=conjSimilares(users, distancias, limiar);


%% ex3
fprintf("ex.3)\n")

users = unique(u(:,1)); % Extrai os IDs dos utilizadores

filmes=getMovies(users, u);
threshold =0.4; % limiar de decisão

tic
distancias=calcDistance(users, filmes);
fprintf("Duração do cálculo das distâncias: %.2fs\n", toc)

tic
limiar =0.4; % limiar de decisão
semelhantes=conjSimilares(users, distancias, limiar);
fprintf("Duração da determinação das distâncias abaixo de %.1f: %.4fs\n", threshold, toc)
fprintf("Pares de utilizadores semelhantes (%d):\n", length(SimilarUsers))
for i=1:length(SimilarUsers)
    fprintf("\tUser1:%d\tUser2:%d\tDistância:%.3f\n", SimilarUsers(i, 1), SimilarUsers(i, 2), SimilarUsers(i, 3))
end

%% ex4
fprintf("ex.4)\n")

users = unique(u(:,1)); % Extrai os IDs dos utilizadores
%users = users(1:200);
filmes=getMovies(users, u);

%for k=[50 100 200]
k=100; % nº de funções de hash
assinaturas=MinHash(filmes, k);
similars=CompareSimilars(assinaturas, 0.4);
%end