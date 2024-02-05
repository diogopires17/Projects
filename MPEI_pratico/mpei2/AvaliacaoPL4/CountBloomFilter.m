function BloomMatrix = CountBloomFilter(BloomMatrix, bloomfilterHashMatrix, Set_Scores,id,n,nhf)
    F = zeros(n,1);

    for score = 1:length(Set_Scores)
        for hf = 1:nhf
            hashcode = rem(DJB31MA(Set_Scores(score),bloomfilterHashMatrix(hf)),n)+1;
            F(hashcode) = F(hashcode)+1;
        end
    end
    
    BloomMatrix(:,id) = F;
end

