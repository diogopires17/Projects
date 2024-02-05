clear all;
clc;

m = 3; % palavras diferentes
N = 1e4; % nr experiencias
n = 2; %nr pallavras em cada sequencia

sequencia = randi(m,n,N);

%% ALINEA a)
count = 0;

for col = 1:N
    addd = sequencia(1,col) == 1 & sequencia(2,col) == 2;
    count = count + addd;
end

probA = count/N
%Valor Teorico = 1/9 ~ 0.11

%% ALINEA b)
count = 0;

for col = 1:N
    addd = ismember(1,sequencia(:,col));
    count = count + addd;
end

probB = count/N
%Valor teorico = 5/9 ~ 0.55

%% ALINEA c)
count = 0;

for col = 1:N
    addd = ismember(1,sequencia(:,col)) || ismember(2,sequencia(:,col));
    count = count + addd;
end

probC = count/N
%Valor Teorico = 8/9 ~ 0.88

%% ALINEA d)
%P[1|2] = P[1e2]/P[2]
count = 0;
count2 = 0;

for col = 1:N
    addd = ismember(1,sequencia(:,col)) & ismember(2,sequencia(:,col));
    count = count + addd;
    addd2 = ismember(2,sequencia(:,col));
    count2 = count2 + addd2;
end

probD = count/count2
%Valor Teorico = 2/5 ~ 0.40

