function ResultadoFiltrado = PertencaAoConjunto(filtro,key,numHashFunc,n)
% PertencaAoConjunto
%%Parâmetros de entrada:
%filtro-> vem da função IniciarFiltro
%key-> chave
%numHashFunc -> Número de funções de dispersão
%   res_lst = zeros(numHashFunc,1);
%     for i= 1:numHashFunc
%         key1 = [key num2str(i)];
%         Hashcode = mod(DJB31MA(key1,127),length(filtro))+1;
%         res_lst(i) = filtro(Hashcode);
%     end
%     ResultadoFiltrado = sum(res_lst)==numHashFunc;
ResultadoFiltrado = 'true';
for i = 1:numHashFunc
    key = [key num2str(i)];
    hash=string2hash(key);
    h=rem(hash,n)+1;
    if filtro(h) ~= 1
        ResultadoFiltrado = 'false';
    end
end