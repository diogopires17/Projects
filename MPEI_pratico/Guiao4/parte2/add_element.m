function filtro = add_element(filtro,chave,numHashFunc)
    for i= 1:numHashFunc
        chave1 = [chave num2str(i)];
        code = mod(string2hash(chave1),length(filtro))+1;
        filtro(code) = 1;
    end
end