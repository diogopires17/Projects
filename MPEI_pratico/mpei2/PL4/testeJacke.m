clear;
clc;

U = readlines("wordlist-preao-20201103.txt");
n = 8000;
k = 4:10;
m = 1000;

for i = 4:10

    F = inicializar(n);

    for j = 1:1000
        F = adicionarElemento(F,U{j},n,i);
    end

    falsos = 0;

    for j = 1001:11000
        if membro(F,U{j},n,i) == 1
            falsos = falsos + 1;
        end
    end
    
    percentagem(i) = falsos/10000*100;
end

plot(k,percentagem(k));