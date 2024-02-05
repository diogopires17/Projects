%%                              1a)

p1 = 0.002;
p2 = 0.005;
pa = 0.01;

N = 1e5;
n = 8;

experiencias1 = rand(n, N) < p1;
experiencias2 = rand(n, N) < p2;
experiencias3 = rand(n, N) < pa;
conj = experiencias1 | experiencias2 | experiencias3;

prob = sum(conj) >= 1;
p = sum(prob)/N;
fprintf("a  prob de A é %.5f\n", p);


%% b




p1 = 0.002;
p2 = 0.005;
pa = 0.01;

N = 1e5;
n = 8;

experiencias1 = rand(n, N) < p1;
experiencias2 = rand(n, N) < p2;
experiencias3 = rand(n, N) < pa;
conj = experiencias3 == 1 & experiencias2 == 0 & experiencias1 == 0;

prob = sum(conj) >= 1;
p = sum(prob)/N;
fprintf("a  prob de A é %.5f\n", p);

