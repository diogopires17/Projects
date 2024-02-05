% Exercício 1 da parte 4.1
clear;clc;
%% Alinea a) 
alfabetoLower= 'a':'z';
alfabetoUpper= 'A':'Z';
alfabetoNums= '0':'9';

alfabeto= [alfabetoLower,alfabetoUpper]; % alfabeto das letras minusculas e maiusculas sem numeros
N=1e5;
imin=6;
imax=20;


words =generate_unif(N,imin,imax,alfabeto)
length(unique(words))

%% Alinea B) -fazer com base nas letras

N = 3;
chars = 'abcdefghijklmnopqrstuvwxyz';
prob_chars = load("prob_pt.txt");
i_min = 6;
i_max = 20;
%% NÃO ESTA FEITO. SE O SOR NÂO FIZER, IR VER AO OLIVEIRA
%strings = randStringArray(N, i_min, i_max, chars, prob_chars)