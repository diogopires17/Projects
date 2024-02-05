clear;
clc;

m = 100;
k = 1;

prob = 0.01;

for i = 1:inf
    p_fp = ( 1 - exp(-k*m/i) )^k;
    if p_fp < prob+0.0001 && p_fp > prob-0.0001
        disp("n otimo: " + i)
        n = i;
        break
    end
end

%% b)
alpha = 'a':'z';
B = inicializar(n);

words = generate_uniform(m,alpha);

for i=1:length(words)
    word = words{i};
    B = adicionarElemento(B,word,n,k);
end

wordsT = generate_uniform(m*10,alpha);

falsos = 0;
for i=1:length(wordsT)
    word = wordsT{i};
    if membro(B,word,m*10,k) == 1
        falsos = falsos +1;
    end
end
disp("Falsos P: "+ falsos);