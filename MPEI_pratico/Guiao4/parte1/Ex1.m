%%                          a)

N = 1e5;
chars = ['a':'z', 'A':'Z'];
imin = 6;
imax = 20;
keysA = generate(N, imin, imax, chars);
save keysA.mat 

%%                          b)

N = 1e5;
chars = 'a':'z';
prob = load("prob_pt.txt");
imin = 6;
imax = 20;

keysB = generate(N, imin, imax, chars, prob);
save keysB.mat

