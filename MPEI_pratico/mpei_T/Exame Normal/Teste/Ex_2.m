% a)

m = 300;        % numero de palavras
fp = 0.03;      % numero de falsos positivos

n = ceil(-m/log(1-fp));     % n = tamanho do filtro em bits

fprintf("Tamanho do filtro: %d\n", n);

% b)

BloomFilter = zeros(1,n); % inicializar o filtro
chars = 'abcdefghijklmnopqrstuvwxyz'; % caracteres possiveis
cellStrings = cell(1,n); % cell array de strings

for i = 1:length(cellStrings)
    if rand < 0.4
        word = chars(randi(length(chars),1,5)); % 5 caracteres word
    else
        word = chars(randi(length(chars),1,8)); % 8 caracteres word
    end
    cellStrings{i} = word; % adicionar a cell array
end

keys = cellStrings(1:m);

for i = 1:length(keys)
    chave = char(keys{i});
    hashValue1 = mod(string2hash(chave, 'djb2'), length(BloomFilter)) + 1;
    BloomFilter(hashValue1) = 1;
end

newkeys = cellStrings(301:n);

falsePositives = 0;

for i = 1:length(newkeys)
    chave = char(newkeys{i});
    hashValue1 = mod(string2hash(chave, 'djb2'), length(BloomFilter)) + 1;
    result1 = BloomFilter(hashValue1);

    if result1 == 1
        falsePositives = falsePositives + 1;
    end
end

disp("Probabilidade de falsos positivos: " + falsePositives / length(newkeys) * 100);