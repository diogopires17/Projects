function [lst] = generate_unif(N,imin,imax,alfabeto)
%UNTITLED3 Summary of this function goes here
%   N-> Número de chaves a gerar
% alfabeto- > conjunto de letras a gerar

% 1 tamanho da string
comp= randi([imin,imax],1,N);
lst=cell(N,1);
%% criar string
for i=1:N
    x= randi([1,length(alfabeto)],1,comp(i));
    word=alfabeto(x);
    lst{i}=word;
    %fprintf(1,"%3d, %3d - %s\n",i,comp(i),word) daria o print do
    %comprimento da palavra e depois a palavra
end
end