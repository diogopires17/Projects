clear;

% Código base para deteção de pares similares

udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes

% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;

% Lista de utilizadores
users = unique(u(:,1));     % Extrai os IDs dos utilizadores
Nu= length(users);      % Numero de utilizadores

% Constrói a lista de filmes para cada utilizador
Set= cell(Nu,1);    % Usa células
for n = 1:Nu      % Para cada utilizador
    % Obtém os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa células porque utilizador tem um número
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end

%% Calcula a distancia de Jaccard entre todos os pares pela definicao

J=zeros(Nu,Nu);   % array para guardar distancias
h= waitbar(0,'Calculating');
for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
        %% Adicionar codigo aqui
        sim = length(intersect(Set{n1},Set{n2}))/length(union(Set{n1},Set{n2}));
        J(n1,n2) = 1 - sim;
    end
end
delete (h)

%% Com base na distancia, determina pares com
%% distancia inferior a um limiar pre-definido

threshold = 0.4; % limiar de decisao

% Array para guardar pares similares (user1, user2, distancia)
SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu
    for n2= n1+1:Nu
        if J(n1,n2) < threshold
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)]
            k= k+1;
        end
    end
end