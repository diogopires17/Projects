F1 = 'Lisboa e Porto são duas cidades importantes de Portugal.';
F2 = 'Lisboa é a capital de Portugal.';
F3 = 'Porto é a capital do Norte de Portugal.';
F4 = 'Portugal não é só Lisboa e Porto.';


fraseCell = {F1,F2,F3,F4};
k = 4;          % numero de funcoes de dispersao
shinglesize = 3;    % compri+mento do shingle
Nu = 4;

%Determina as assinaturas de cada frase considerando todas as suas caracteristicas ( incluindo espaços e ponto finais),
%estime a distância de jaccard entre todas as frases e apresenta o par mais similare entre todas.

FraseMinHash = zeros(Nu, k);

% Loop over all the phrases
for FN=1:Nu
    % Get the current phrase
    Frase = fraseCell{1,FN};
    
    % Loop over all the hash functions
    for hashFuncN=1:k
        % Initialize an array to store the hash values
        hashArr=zeros(1,strlength(Frase)-shinglesize+1);
        
        % Loop over all the shingles in the current phrase
        for ShingleN=1:strlength(Frase)-shinglesize+1
            % Get the current shingle
            key = char(Frase(ShingleN:(ShingleN+shinglesize-1)));
            
            % Compute the hash value of the current shingle using the current hash function
            hashArr(ShingleN) = hf1(key,hashFuncN)+1;
        end
        
        % Store the minimum hash value for the current phrase and the current hash function
        FraseMinHash(FN,hashFuncN) = min(hashArr);
    end
end

disp("Frase 1 signature: "+ mat2str(FraseMinHash(1,:)));
disp("Frase 2 signature: "+ mat2str(FraseMinHash(2,:)));
disp("Frase 3 signature: "+ mat2str(FraseMinHash(3,:)));
disp("Frase 4 signature: "+ mat2str(FraseMinHash(4,:)));


Distance = zeros(4,4);

% Loop over all the rows in FraseMinHash
for n1=1:length(FraseMinHash)
    % Loop over all the rows in FraseMinHash starting from the current row
    for n2=n1:length(FraseMinHash)
        % Compare the elements in the current row with the elements in the other row
        % isMatch is a logical array where each element is 1 if the corresponding elements in the two rows are equal, and 0 otherwise
        isMatch = FraseMinHash(n1,:)==FraseMinHash(n2,:);
        
        % Compute the distance between the two rows
        % The distance is 1 minus the proportion of elements that are equal
        % This is a measure of how dissimilar the two rows are
        Distance(n1,n2) = 1-sum(isMatch)/length(isMatch);
    end
end

disp("Distance matrix: ");
disp(Distance);