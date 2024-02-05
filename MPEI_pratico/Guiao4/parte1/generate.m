function c_array = generate(N, imin, imax, chars, prob)

    if nargin == 4
        prob = ones(1,length(chars))/length(chars);
    
    elseif nargin < 4
        c_array = []
        fprintf("Not enough arguments\n");
        return;
    end

    c_array = cell(1,N);
    probcum = cumsum(prob);

    for i = 1:N
        le = randi([imin imax]);
        aux = zeros(1,le);
        
        for j = 1:le 
        X = rand();
        k = 1+sum(X>probcum);
        aux(j) = k;
        end
        c_array{i} = chars(aux);
    end
    c_array = unique(c_array);
    comp = length(c_array);

    while comp<N

        le = randi([imin imax]);
        aux = zeros(1,le);
        for j = 1:le 
        X = rand();
        k = 1+sum(X>probcum);
        aux(j) = k;
        end
        chave = chars(aux);
        if ~ismember(chave,c_array)
            comp = comp+1;
            c_array{comp} = chave;
        end
    end
        