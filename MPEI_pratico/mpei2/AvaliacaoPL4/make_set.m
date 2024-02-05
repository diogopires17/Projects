function [Set,Nu, filmes] = make_set(file)

    % Código base para deteção de pares similares
    
    udata=file; % Carrega o ficheiro dos dados dos filmes
    
    % Fica apenas com as duas primeiras colunas
    u= udata(1:end,1:2); clear udata;
    
    % Lista de utilizadores
    filmes = unique(u(:,2));     % Extrai os IDs dos utilizadores
    Nu= length(filmes);      % Numero de utilizadores
    
    % Constrói a lista de filmes para cada utilizador
    Set= cell(Nu,1);    % Usa células
    for n = 1:Nu      % Para cada utilizador
        % Obtém os filmes de cada um
        ind = find(u(:,2) == filmes(n));
        % E guarda num array. Usa células porque utilizador tem um número
        % diferente de filmes. Se fossem iguais podia ser um array
        Set{n} = [Set{n} u(ind,1)];
    end
end