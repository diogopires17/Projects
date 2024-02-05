clear;
clc;
%% Alinea a)
alfabeto = ['a':'z' 'A':'Z'];
imin = 6;
imax = 20;
N=10;

words = generate_uniform(N, imin, imax, alfabeto, [0.4 0.6])

%% Alinea b)
clear;

alfabeto = ['a':'z'];
imin = 6;
imax = 20;
N=10;

p = load("prob_pt.txt");

words2 = generate_uniform(N, imin, imax, alfabeto, p')