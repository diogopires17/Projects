function MinHash = calc_minHash(Set, nhf, Nu)
    
    MinHash = zeros(Nu,nhf);

    Random = randi([1 1000],1,nhf);

    h = waitbar(0,"Calculating...");

    %para cada user
    for n1 = 1:Nu
        waitbar(n1/Nu,h);

        conjunto = Set{n1,:};
        x = zeros(1,length(conjunto));

        for hf = 1:nhf %para cada funcao hash

            for i = 1:length(conjunto)
                elem = conjunto(i);
    
                %%aplicar hashfunction
                hc = rem(DJB31MA(elem,Random(hf)),7919)+1;
               
                x(i) = hc;
            end

            %%determinar minimo
            MinHash(n1,hf) = min(x);
           
        end
    end
    delete(h)
end

