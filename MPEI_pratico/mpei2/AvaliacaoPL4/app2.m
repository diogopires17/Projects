clear;
clc;

udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes

% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;

% Lista de filmes
filmsID = unique(u(:,2));     % Extrai os IDs dos filmes
Nf = length(filmsID);      % Numero de filmes

% Lista de utilizadores
users = unique(u(:,1));     % Extrai os IDs dos utilizadores
Nu= length(users);      % Numero de utilizadores


filmNames = readcell('film_info.txt', 'Delimiter', '\t');
filmNames = filmNames(:,1);     %Extrai os nomes dos filmes




