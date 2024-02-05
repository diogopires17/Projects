function lst = generate_uniform(N, imin, imax, alpha, probArray)
    if nargin==4
        probArray = ones(1,length(alpha)) / length(alpha);
    end

    comprimento=randi([imin,imax],1,N);
    
    lst=cell(N,1);

    for i=1:N
        x=char(randsrc(1,comprimento(i), [double(alpha); probArray]));
        %word = alpha(x);
        lst{i} = x;
        %fprintf(1,'%3d, %3d - %s\n', x, comprimento(i),word);
    end

end