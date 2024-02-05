% Código base para deteção de pares similares
udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;
% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % N´umero de utilizadores
% Constr´oi a lista de filmes para cada utilizador
Set= cell(Nu,1); % Usa c´elulas
for n = 1:Nu, % Para cada utilizador
% Obt´em os filmes de cada um
ind = find(u(:,1) == users(n));
% E guarda num array. Usa c´elulas porque utilizador tem um n´umero
% diferente de filmes. Se fossem iguais podia ser um array
Set{n} = [Set{n} u(ind,2)];
end
4 PL 4. ALGORITMOS PROBABIL´ISTICOS
%% Calcula a distˆancia de Jaccard entre todos os pares pela definic¸˜ao.
J=zeros(...); % array para guardar distˆancias
h= waitbar(0,’Calculating’);
for n1= 1:Nu,
waitbar(n1/Nu,h);
for n2= n1+1:Nu,
%% Adicionar c´odigo aqui
end
end
delete (h)
%% Com base na distˆancia, determina pares com
%% distˆancia inferior a um limiar pr´e-definido
threshold =0.4 % limiar de decis˜ao
% Array para guardar pares similares (user1, user2, distˆancia)
SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu,
for n2= n1+1:Nu,
if % ......
SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)]
k= k+1;
end
end
end