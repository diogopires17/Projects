function assinaturas = MinHash(filmes,k)

Nu=length(filmes);
assinaturas=Inf(Nu, k);
tic;
h= waitbar(0,'Criando MinHash...');
for i=1:Nu  %user a user
    movies=filmes{i};
    waitbar(i/Nu,h);
    for j=1:length(movies)
        key=movies(j);
        for hs=1:k
            key=[key num2str(hs)];
            hash= DJB31MA(key, 127);
            if hash<assinaturas(i, hs)
                assinaturas(i, hs)=hash;
            end
        end
    end    
end

fprintf("Duração da implementação do MinHash: %.4fs\n", toc)
delete (h)

end