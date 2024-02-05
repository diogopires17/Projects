function [boolean] = membro(B, elem, n, k)
%MEMBRO Summary of this function goes here
%   Detailed explanation goes here
    key = elem;
    for i = 1:k
        key = strcat(key,int2str(i));
        hc = mod(string2hash(elem),n)+1;
        if B(hc) == 0
            boolean = 0;
            return
        end

    end
    boolean = 1;
end

