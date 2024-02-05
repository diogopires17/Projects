function genres_unique = display_available_genres(movies, option)
    % Exibir gêneros para todos os filmes
    fprintf('Genres for all movies:\n');
    genres_unique = [];
    for i = 1:size(movies, 1)
        genres = movies(i, 3:end);
        for j = 1:length(genres)
            if ~ismissing(genres{j})
                if ~ismember(genres{j}, genres_unique)
                    genres_unique = [genres_unique , cellstr(genres{j})];
                end
            end
        end
    end
    switch option
        case 1
            for f = 1:length(genres_unique)
                if f == 19
                    disp(genres_unique{f})
                    fprintf('\n')
                else
                    if f == 10
                        fprintf('\n')
                    end
                    fprintf('%s%s', genres_unique{f}, ' \ ')
                end
            end
        case 2
            for f = 1:length(genres_unique)
                if f == 19
                    fprintf('%d - %s\n', f, genres_unique{f})
                    fprintf('\n')
                else
                    if f == 10
                        fprintf('\n')
                    end
                    fprintf('%d - %s%s', f, genres_unique{f}, ' \ ')
                end
            end
    end
    return
end