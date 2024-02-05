p = 0.5;
N = 1e6;
fam = rand(2,N) < p;
primfilho = fam(1:N);

somaprimfilho = sum(primfilho == 1);

soma2filhos = sum(sum(fam) == 2);

prob = soma2filhos/somaprimfilho