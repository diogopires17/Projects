function lst = generate_uniform(N, alpha, probArray)
    if nargin<3
        probArray = ones(1,length(alpha)) / length(alpha);
    end
    
    comprimento = rand(1,N);
    comprimento = comprimento < 0.4;
    
    lst=cell(N,1);

    for i=1:N
        if comprimento(i) == 1
            x=char(randsrc(1,6,[double(alpha); probArray]));
        else
            x=char(randsrc(1,10,[double(alpha); probArray]));
        end
        lst{i} = x;
    end

end