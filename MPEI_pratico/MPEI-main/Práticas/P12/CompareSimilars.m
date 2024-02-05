function semelhantes = CompareSimilars(matriz,threshold)

semelhantes=zeros(1,3);
index=1;
[nl, nc]=size(matriz);
tic;
for i=1:nl-1
    for j=i+1:nl
        dist=sum(matriz(i, :)~=matriz(j, :))/nc;
        if dist<threshold
            semelhantes(index, :)=[i j dist];
            index=index+1;
        end
    end
end

fprintf("Duração da comparação de semelhantes: %.4fs\n", toc)

end