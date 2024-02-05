p = 0.5;
N = 1e6;
fam = rand(2,N) < p;

cfav = sum(fam) >= 1;
totalcfav = sum(cfav);

prob = totalcfav/N


%% Valor teorico: 0.75