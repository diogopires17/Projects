clear;
N=1e5;
imin= 6;
imax=20;
alfabeto = ['a':'z' 'A':'Z'];

x = input("Insert hash func to be used (0-3): ");

%% Alinea a)
words = generate_uniform(N,imin,imax,alfabeto);

%% criar a tabela

for T=[5e5 1e6 2e6]
    tic % começa cronometro
    %tabela=zeros(1,T);
  
    %% Alinea b)
    atribuicoes=zeros(1,T);
    
    % processar as palavras 1 a 1
    
    hashcodes=zeros(1,N);

    
    for i = 1:N
        %% aplicar hashfunction
        if x == 0
            hash=string2hash(words{i}, 'djb2');
            hash=rem(hash,T)+1;
        elseif x == 1
            hash=string2hash(words{i}, 'sdbm');
            hash=rem(hash,T)+1;
        elseif x == 2
            hash=hashstring(words{i}, T)+1;
        else
            hash=DJB31MA(words{i}, T);
            hash=rem(hash,T)+1;
        end

        %disp(hash);
        hashcodes(i)=hash; % listagem de todos os hashcodes
        atribuicoes(hash)=atribuicoes(hash)+1; % contagem de quantas palavras estao em cada bucket
    end
    
    % hist
    figure("Name","Histograma Hashcodes")
    hist(hashcodes,100);
    xlabel("hashcodes");


    % hist atrib
    figure("Name", "Histograma de atribuicoes")
    hist(atribuicoes, 0:1:5);
    
    %% Alinea c)
    % num colisoes
    ncol=sum(atribuicoes>1);
    perc=ncol/T*100;
    fprintf(1,"T=%d, ncol = %d, percent = %.3f\n",T,ncol,perc);

    %% Alinea d)
    toc % print elapsed time
end
