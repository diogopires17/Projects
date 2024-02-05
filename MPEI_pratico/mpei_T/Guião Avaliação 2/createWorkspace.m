function createWorkspace(moviesFile, workspaceFile)

    movies = readcell(moviesFile, 'Delimiter', ',');
    

    shingle_size = 3;
    numHashFunctions = 3;


    save(workspaceFile);
end