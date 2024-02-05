function resultado = ismembro(filtro,chave,numHashFunc)
    res_lst = zeros(numHashFunc,1);
    for i= 1:numHashFunc
        chave1 = [chave num2str(i)];
        code = mod(string2hash(chave1),length(filtro))+1;
        res_lst(i) = filtro(code);
    end
    resultado = sum(res_lst)==numHashFunc;
end