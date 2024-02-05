function search_movie_title(movies, input_string,shingle_size)
    movie_names = movies(:, 1);
    movie_genres = movies(:, 3:end);

    % Criar shingles para a entrada do usuário
    input_shingles = generate_shingles(input_string, shingle_size);

    jaccard_indices = zeros(length(movie_names), 1);
    for i = 1:length(movie_names)
        % Calcular o índice de Jaccard entre a entrada do usuário e o nome do filme
        movie_shingles = generate_shingles(char(movie_names(i)), shingle_size);

        % Verificar se as strings são exatamente iguais (sem distinção entre maiúsculas e minúsculas)
        intersection = length(intersect(input_shingles, movie_shingles));
        unionSet = length(union(input_shingles, movie_shingles));
        jaccard_index = intersection / unionSet;
        

        % Atribuir o índice de Jaccard ao vetor
        jaccard_indices(i) = jaccard_index;

        progress = (i*100)/length(movies);
        fprintf('Loading Results...%.2f %%\n', progress);
    end

    [~, indices] = sort(jaccard_indices, 'descend');

    fprintf('Top 5 Movies Similar to "%s":\n', input_string);
    count = 0;
    for i = 1:length(indices)
        movie_index = indices(i);
        % Verificar se o índice de Jaccard é maior que zero (há alguma semelhança)
        if jaccard_indices(movie_index) > 0
            count = count + 1;
            genres = strjoin(cellstr(movie_genres{movie_index}), '\t');
            fprintf('Movie: %-20s Genres: %-20s Jaccard Indice: %f\n', movie_names{movie_index}, genres, jaccard_indices(movie_index));
        end
        if count == 5
            break; % Parar após encontrar os top 5 filmes correspondentes
        end
    end
    fprintf('\n');
end


