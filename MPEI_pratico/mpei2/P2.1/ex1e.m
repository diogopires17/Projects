p = 0.5;
N = 1e6;
fam = rand(5,N) < p;

nrfam1rapaz = sum(sum(fam) >= 1);
nrfam2rapazes = sum(sum(fam) == 2);

prob = nrfam2rapazes/nrfam1rapaz

