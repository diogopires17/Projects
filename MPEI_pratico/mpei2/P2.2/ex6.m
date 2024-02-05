p = 1/1000;
N = 1e5;
n = 8000;
k = 7;

%% Alinea a)
chips = rand(n,N) < p;
defeito = sum(chips) == k;

probDefeito = sum(defeito)/N

%% Alinea b)
lambda = n*p;

probDefeitoPoison = (lambda^k)/factorial(k) * exp(-lambda)