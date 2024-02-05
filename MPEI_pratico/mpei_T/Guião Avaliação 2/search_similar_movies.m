function search_similar_movies(movies,input_genres)
    
    % Calcular a similaridade de Jaccard e ordenar os filmes por similaridade de Jaccard e ano
    jaccard_indices = zeros(length(movies), 1);
    for i = 1:length(movies)
        % Acessar a célula de gêneros correspondente ao filme
        genres_cell = strsplit(movies{i, 3}, ',');

        % Calcular a similaridade de Jaccard
        intersection = numel(intersect(input_genres, genres_cell));
        unionSet = numel(union(input_genres, genres_cell));
        jaccard_indices(i) = intersection / unionSet;
        progress = (i*100)/length(movies);
        fprintf('Loading Results...%.2f %%\n', progress);
    end

    % Ordenar os filmes por similaridade de Jaccard e ano
    [~, indices] = sortrows([jaccard_indices, cell2mat(movies(:, 2))], [-1, -2]);

    % Mostrar os top 5 filmes
    fprintf('Top 5 Movies Similar to Genres "%s":\n', strjoin(input_genres, ', '));
    count = 0;
    for i = 1:length(indices)
        movie_index = indices(i);
        % Verificar se o índice de Jaccard é maior que zero (há alguma semelhança)
        if jaccard_indices(movie_index) > 0
            count = count + 1;
            fprintf('Movie: %-20s \tYear: %d\t\t Jaccard Index: %f\n', movies{movie_index, 1}, movies{movie_index, 2}, jaccard_indices(movie_index));
        end
        if count == 5
            fprintf('\n')
            break; % Parar após encontrar os top 5 filmes correspondentes
        end
    end
end
