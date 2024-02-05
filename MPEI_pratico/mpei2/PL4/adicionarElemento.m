function B = adicionarElemento(B, elem, n, k)
%ADICIONARELEM Summary of this function goes here
%   Detailed explanation goes here
    key = elem;
    for i = 1:k
        key = strcat(key,int2str(i));
        hc = rem(hashstring(key, n), n) + 1;

        B(hc) = 1; 
    end
end

