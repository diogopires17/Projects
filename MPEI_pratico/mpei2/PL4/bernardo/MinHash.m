function [HashArr] = MinHash(Value, k)
%MINHASH Summary of this function goes here
%   Detailed explanation goes here
    HashArr = zeros(1,k);
    for i=1:k
        HashArr(i) = mod(DJB31MA(Value, i), LengthofArr)+1;
    end
end

