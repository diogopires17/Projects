%%                          ex1

a1 =  0.2;
a3 =  0.3;
a4 =  0.1;
a5 =  0.45;

T = [ 0 a1 0 0 1-a1 0; 0 0 0 0 1 0; 0 0 0 a3 1-a3 0; 0 0 a4 0 0 1-a4; 0 0 a5 1-a5 0 0; 0 0 0 0 0 1]';

%%                          1b)


p1_5 = T(5,1);
p5_4 = T(4,5);
p4_meta = T(6,4);
p = p1_5 * p5_4 * p4_meta;

N = 1e5;


count = 0;
for i = 1:N
    seq = crawl(T, 1, 6);
    if ((length(seq) == 4) && seq(end) == 6)
           count = count + 1;
    end
end

prob = count/N 


%%                         1c)


Q = T(1:5,1:5);
F = (eye(5) - Q)^-1;
x1 = [1 0 0 0 0]';
media = sum(F*x1)


for i=1:N
    res1(i) = length(crawl(T, 1, 6  ));
end


passos = sum(res1)/N


%%                            2a
m = 300;
p = 0.03;  % false positive probability
k = 1;
n = ceil(-m/log(1-p))     % n = tamanho do filtro em bits


%%                          2b

filtro = inicia(m);
p5 = 0.4;
p8 = 0.6;
k = 1;

% Adiciona palavras ao filtro de Bloom
for i = 1:n
    % Gera uma palavra aleatória com base nas probabilidades
    if rand() < p5
        palavra = gerar_palavra(5);
    else
        palavra = gerar_palavra(8);
    end
    
    % Adiciona a palavra ao filtro de Bloom
    filtro = add_elemento(filtro, palavra, k);
end


N = 1e5; % Number of tests to run
num_false_positives = 0;
for i = 1:N
    % Generate a random word
    if rand() < p5
        palavra = gerar_palavra(5);
    else
        palavra = gerar_palavra(8);
    end
    % Check if the word is a member of the set
    if ismembro(filtro, palavra, k)
        num_false_positives = num_false_positives + 1;
    end
end
prob_false_positive = num_false_positives / N


%%
% Define the phrases
phrases = {
    'Lisboa e Porto são duas cidades importantes de Portugal.',
    'Lisboa é a capital de Portugal.',
    'Porto é a capital do Norte de Portugal',
    'Portugal não é só Lisboa e Porto'
};

% Shingle length
k = 3;

% Number of hash functions
n_hash_functions = 4;

% Generate MinHash signatures
signature_matrix = generateSignature(phrases, k, n_hash_functions);

% Estimate Jaccard distances between pairs of phrases
jaccard_distances = zeros(length(phrases));

for i = 1:length(phrases)
    for j = i+1:length(phrases)
        set1 = unique(signature_matrix(:, i));
        set2 = unique(signature_matrix(:, j));
        
        intersection_size = numel(intersect(set1, set2));
        union_size = numel(union(set1, set2));
        
        jaccard_distances(i, j) = 1 - (intersection_size / union_size);
        jaccard_distances(j, i) = jaccard_distances(i, j);  % Jaccard distance matrix is symmetric
    end
end

% Find the pair with the most similar phrases
[most_similar_i, most_similar_j] = find(jaccard_distances == min(jaccard_distances(:)) & jaccard_distances ~= 0);

% Display results
disp('Signature Matrix:');
disp(signature_matrix);

disp('Estimated Jaccard Distances:')
disp(jaccard_distances);







%% funções aux

function hashCode = h21(shingle, nhf)
    % h21 hash function
    % Input: shingle - string (of any length)
    %        nhf - number of the hash function to apply (1 to 4)
    % Output: hashCode - from 0 to 1012 (M-1)
    
    l = length(shingle);
    n = 4;  % number of hash functions
    M = 1013;  % to limit hashcode to M-1

    if nhf < 1 || nhf > n
        fprintf(1, 'ERROR! hf number must be between 1 and %d\n', n);
        hashCode = -1;
        return
    end

    R = [
        15761, 14189, 65576, 75776;
        97062, 42177, 3571, 74315;
        95719, 91576, 84915, 39223;
        48539, 79223, 93402, 65549;
        80030, 95952, 67875, 17119
    ];

    R = R(:, 1:l);

    hash_code = 0;
    for i = 1:l
        hash_code = mod(hash_code + R(nhf, i) * shingle(i), M);
    end

    hashCode = hash_code;
end

function shingles = generateShingles(phrase, k)
    % Tokenize the phrase into shingles of length k
    shingles = cell(1, length(phrase) - k + 1);
    for i = 1:length(phrase) - k + 1
        shingles{i} = phrase(i:i+k-1);
    end
end

function signature = generateSignature(phrases, k, n_hash_functions)
    % Generate MinHash signatures for each phrase

    % Initialize the signature matrix
    signature_matrix = zeros(n_hash_functions, length(phrases));

    for i = 1:n_hash_functions
        for j = 1:length(phrases)
            shingles = generateShingles(phrases{j}, k);

            % Find the minimum hash code for each hash function
            min_hash_code = inf;
            for s = 1:length(shingles)
                hash_code = h21(shingles{s}, i);
                min_hash_code = min(min_hash_code, hash_code);
            end
            signature_matrix(i, j) = min_hash_code;
        end
    end

    signature = signature_matrix;
end


function palavra = gerar_palavra(comprimento)
    caracteres = 'abcdefghijklmnopqrstuvwxyz';
    indices = randi(length(caracteres), 1, comprimento);
    palavra = caracteres(indices);
end

function filtro = add_elemento(filtro,chave,numHashFunc)
    for i= 1:numHashFunc
        chave1 = [chave num2str(i)];
        code = mod(string2hash(chave1),length(filtro))+1;
        filtro(code) = 1;
    end
end

function filtro = inicia(n)
filtro = zeros(n,1);
end

function resultado = ismembro(filtro,chave,numHashFunc)
    res_lst = zeros(numHashFunc,1);
    for i= 1:numHashFunc
        chave1 = [chave num2str(i)];
        code = mod(string2hash(chave1),length(filtro))+1;
        res_lst(i) = filtro(code);
    end
    resultado = sum(res_lst)==numHashFunc;
end





function [state] = crawl(H, first, last)
% the sequence of states will be saved in the vector "state"
% initially, the vector contains only the initial state:
state = [first];
% keep moving from state to state until state "last" is reached:
while (1)
state(end+1) = nextState(H, state(end));
if ismember(state(end), last) % verifies if state(end) is absorbing
break;
end
end
end
% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
% find the probabilities of reaching all states starting at the current one:
probVector = H(:,currentState)'; % probVector is a row vector
n = length(probVector); %n is the number of states
% generate the next state randomly according to probabilities probVector:
state = discrete_rnd(1:n, probVector);
end
% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector
function state = discrete_rnd(states, probVector)
U=rand();
i = 1 + sum(U > cumsum(probVector));
state= states(i);
end
