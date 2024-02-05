clear;

%% Exercício 1 -

%% Alínea a)

alfabeto = ['A':'Z' 'a':'z'];

imin = 6;
imax = 20;
N = 10^5;

chaves = GerarChaves(N,6,20,alfabeto);
%Repetidas
unicas1 = length(unique(chaves));
fprintf('Exercício 1 -\n')
fprintf("Alinea a)\n  Total de palavras repetidas: %d\n", length(chaves) - unicas1)

%% Alínea b)

prob_letters = load("prob_pt.txt"); % Probabilidade de cada letra
alphabet = 'a':'z';

for i = 1:length(alphabet)
    a(i) = discrete_rnd(alphabet,prob_letters);
end

chaves2 = GerarChaves(N,imin,imax,a);

%Repetidas
unicas2 = length(unique(chaves2));
fprintf("Alinea b)\n  Total de palavras repetidas: %d\n", length(chaves2) - unicas2)

%% Exercício 2 -

%% Alinea a) 

fprintf('\nExercício 2 -\n')
    % Criar tabela

x=1;

for T=[5e5 1e6 2e6]
    tic;
    tabela = zeros(1,T);
    
    hashcodes = zeros(1,N);
    atribuicoes = zeros(1,T);
    
    for i=1:N
        %aplicar hash function
        hash=string2hash(chaves{i});
        hash=rem(hash, T)+1;
        hashcodes(i) = hash;
        atribuicoes(hash) = atribuicoes(hash) + 1;
    end
    
    % histograma
    figure(1)
    subplot(1, 3,x)
    histogram(hashcodes, 100)
    title("Exercicio 2 - Hashcodes com 100 intervalos")
    xlabel("Hashcodes")
    
    %% Alínea b)
    
    figure(2)
    subplot(1, 3,x)
    histogram(atribuicoes)
    xlabel("Número total de atribuição");
    title("Exercicio 2 - Número máximo de atribuições")
    %x indica quantas vezes foram usadas as posições na tabela 
    
    
    %% Alínea c)
    % número de colisões
    
    numColisoes = sum(atribuicoes > 1);
    probColisao = numColisoes/T; 
    

    fprintf(' Com uma tabela de tamanho %d, o número de colisões é %d, logo a probabilidade de haver colisão é %f\n', T,numColisoes, probColisao)
    toc;
    x=x+1;
end


%% Exercício 3 -
% Está feita acima na função

%% Exercício 4 -

fprintf('\nExercício 4 -\n')
    % Criar tabela

x=1;

for T=[5e5 1e6 2e6]
    tic;
    tabela = zeros(1,T);
    
    hashcodes = zeros(1,N);
    atribuicoes = zeros(1,T);
    
    for i=1:N
        %aplicar hash function
        hash=string2hash(chaves2{i});
        hash=rem(hash, T)+1;
        hashcodes(i) = hash;
        atribuicoes(hash) = atribuicoes(hash) + 1;
    end
    
    % histograma
    figure(3)
    subplot(1, 3,x)
    histogram(hashcodes, 100)
    title("Exercicio 4 - Hashcodes com 100 intervalos")
    xlabel("Hashcodes")
    
    %% Alínea b)
    
    figure(4)
    subplot(1, 3,x)
    histogram(atribuicoes)
    xlabel("Número total de atribuição");
    title("Exercicio 4 - Número máximo de atribuições")
    %x indica quantas vezes foram usadas as posições na tabela 
    
    
    %% Alínea c)
    % número de colisões
    
    numColisoes = sum(atribuicoes > 1);
    probColisao = numColisoes/T; 
    

    fprintf(' Com uma tabela de tamanho %d, o número de colisões é %d, logo a probabilidade de haver colisão é %f\n', T,numColisoes, probColisao)
    toc;
    x=x+1;
end

fprintf(" 4 - Os resultados são semelhantes, no entanto o número de colisões é um pouco superior.\n")


