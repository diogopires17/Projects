p = 0.5;
N = 1e6;
fam = rand(2,N) < p;

prob2rapazes = sum(sum(fam) == 2);
prob1rapaz = sum(sum(fam) >= 1);

prob = prob2rapazes/prob1rapaz

