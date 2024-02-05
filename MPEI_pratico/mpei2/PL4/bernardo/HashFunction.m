function minHash = HashFunction(LengthofArr, Value, k)
%HASHFUNCTION Summary of this function goes here
%   Detailed explanation goes here
    HashArr = zeros(1,k);
    Value = int2str(Value);
    for i=1:k
        Value = [Value int2str(i)];
        HashArr(i) = mod(DJB31MA(Value, i), LengthofArr)+1;
    end
    minHash = min(HashArr);
end

