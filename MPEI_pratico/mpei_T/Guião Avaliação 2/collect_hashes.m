function hashes=collect_hashes(movies, option, year)
    % Array para guardar as hashes
    hashes = {};

    yearsData = cell2mat(movies(:, 2));
    switch option

        case 2
            % Loop through each cell to collect hashes
            for i = 1:size(movies, 1)
                for j = 1:size(movies, 2)
                    currentGenre = movies{i, j};
                    if ischar(currentGenre) && ~isempty(currentGenre) && ~strcmp(currentGenre, "missing")
                        % Use string hashing function to generate hash
                        hashValue = string2hash(currentGenre);
                        % Convert hash to string before storing
                        hashStr = num2str(hashValue);
                        hashes = [hashes, hashStr];
                    elseif iscell(currentGenre)
                        for k = 1:numel(currentGenre)
                            if ischar(currentGenre{k}) && ~isempty(currentGenre{k}) && ~strcmp(currentGenre{k}, "missing")
                                % Use string hashing function to generate hash
                                hashValue = string2hash(currentGenre{k});
                                % Convert hash to string before storing
                                hashStr = num2str(hashValue);
                                hashes = [hashes, hashStr];
                            end
                        end
                    end
                end

                progress = (i*100)/length(movies);
                fprintf('Loading Results...%.2f %%\n', progress);
            end

        case 3
            movies = movies(:, 3:end);
            % Loop through each cell to collect hashes
            for i = 1:size(movies, 1)
                if yearsData(i) == year
                    for j = 1:size(movies, 2)
                        currentGenre = movies{i, j};
                        if ischar(currentGenre) && ~isempty(currentGenre) && ~strcmp(currentGenre, "missing")
                            % Use string hashing function to generate hash
                            hashValue = string2hash(currentGenre);
                            % Convert hash to string before storing
                            hashStr = num2str(hashValue);
                            hashes = [hashes, hashStr];
                        elseif iscell(currentGenre)
                            for k = 1:numel(currentGenre)
                                if ischar(currentGenre{k}) && ~isempty(currentGenre{k}) && ~strcmp(currentGenre{k}, "missing")
                                    % Use string hashing function to generate hash
                                    hashValue = string2hash(currentGenre{k});
                                    % Convert hash to string before storing
                                    hashStr = num2str(hashValue);
                                    hashes = [hashes, hashStr];
                                end
                            end
                        end
                    end
                end

                progress = (i*100)/length(movies);
                fprintf('Loading Results...%.2f %%\n', progress);
            end
    end
    fprintf('\n');
end