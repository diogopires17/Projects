function B = adicionarElemento(B, elem, n, k)
%ADICIONARELEM Summary of this function goes here
%   Detailed explanation goes here

    for i = 1:k
        elem = [elem int2str(i)];
        index = mod(string2hash(elem),n)+1;         
        B(index)=1;
    end
end

