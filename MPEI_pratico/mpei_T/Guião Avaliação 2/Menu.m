workspaceFile = 'workspace.mat';
moviesFile = 'movies.csv';

if exist(workspaceFile, 'file') ~= 2
    fprintf('Creating Workspace...\n');
    createWorkspace(moviesFile, workspaceFile);
end

fprintf('Loading Workspace...\n');
load(workspaceFile);

% Substituir strings vazias e '(no genres listed)'
movies(cellfun(@(x) isempty(x) || strcmp(x, '(no genres listed)'), movies)) = {''};

while true
    % Menu
    fprintf('1 - Display available genres\n')
    fprintf('2 - Number of movies of a genre\n')
    fprintf('3 - Number of movies of a genre on a given year\n')
    fprintf('4 - Search movie titles\n')
    fprintf('5 - Search movies based on genres\n')
    fprintf('6 - Exit\n')
    option = input('Select an option: ');
    while (option<1 || option>6)
        disp('ERROR! Select a valid option!')
        option = input('Select an option: ');
    end
    
    switch option
        case 1 
            display_available_genres(movies, 1);
            disp('Saving...')
            save(workspaceFile, 'movies');
        case 2
            genres_unique = display_available_genres(movies, 2);
            genre = input('Select a genre: ');
            while (genre<=0 || genre > length(genres_unique))
                disp('ERROR! Select a valid option!')
                genre = input('Select a genre: ');
            end
            movies_of_genre(movies, genres_unique{genre});

        case 3
            bool = true;
            while bool
                genres_unique = display_available_genres(movies, 2);
                user_input = input('Select a genre, followed by a year (separated by ","): ', 's');
                data = strsplit(user_input, ',');
                if length(data) ~= 2  %% verifica se o input contem 2 argumentos
                    disp('ERROR! Not enough arguments!')
                else
                    genre=str2double(data{1});
                    year=str2double(data{2});
                    length_year = floor(log10(abs(year))) + 1;
                    if genre<=0 || genre > length(genres_unique)
                        disp('ERROR! Wrong genre input!')
                    elseif year>2023 || length_year ~= 4
                        disp('ERROR! Wrong year input!')
                    else
                        bool = false;
                    end
                end
            end
            movies_of_genre_year(movies, genres_unique{genre}, year);
       
        case 4
            user_input = input('Insert a string: ','s'); % Converte a string de input para minúsculas e remove espaços
            search_movie_title(movies, user_input,shingle_size);

        case 5
            bool = true;
            while bool
                count = 0;
                genre_data = [];
                genres_unique = display_available_genres(movies, 2);
                user_input = input('Select one or more genres (separated by '',''): ', 's');
                data = strsplit(user_input, ',');
                if ~isempty(data)
                    for i = 1:length(data)
                        if str2double(data{i})<=0 || str2double(data{i})>length(genres_unique)
                            fprintf('ERROR! Wrong genre input on index %d\n', i);
                            count = count + 1;
                        else
                            genre_data = [genre_data , cellstr(genres_unique{str2double(data{i})})];
                        end
                    end
                    if count == 0
                        bool = false;
                    end
                end
            end
            search_similar_movies(movies, genre_data)

        case 6
            disp('Exiting...')
            break;
    end
end
