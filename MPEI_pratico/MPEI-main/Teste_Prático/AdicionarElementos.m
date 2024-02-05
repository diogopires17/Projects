function filtro = AdicionarElementos(filtro,key,numHashFunc,n)
%AdicionarElementos
%Parâmetros de entrada:
%filtro-> vem da função IniciarFiltro
%key-> chave
%numHashFunc -> Número de funções de dispersão
for i= 1:numHashFunc
        key = [key num2str(i)];
        hash=string2hash(key);
        Hashcode=mod(hash, n)+1;
        %Hashcode = mod(string2hash(elemento),n)+1;
        %Hashcode= mod(DJB31MA(key1,127),length(filtro))+1;
        filtro(Hashcode) = 1;

 
        
end
end