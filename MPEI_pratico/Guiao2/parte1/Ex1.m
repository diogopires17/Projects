%%                                      1 a)


p = 0.5;
f = 2;
rapazes = 1;
N = 1e5;

filhos = rand(f, N) > p;
sucessos = sum(filhos) >= rapazes;
prob = sum(sucessos)/N;

%%                                       1 b)

p = 0.5;
f = 1;
n = 2;
probt = 0;

for k = 1:2
    probt = probt + nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!
end

%%                                         1c

N = 1e5;
n = 2;

a = rand(n, N) > 0.5;

%1c
a1 = sum(a) == 2; % familias com 2 rapazes
a2 = sum(a) == 1; % familias com 1 rapaz
prob1c = sum(a1 & a2) / sum(a2);

%1d
a1 = sum(a) == 2;
a2 = a(1, :);  % primeira linha de 'a' que corresponde ao primeiro filho das familias
prob1d = sum(a1 & a2)/sum(a2);
