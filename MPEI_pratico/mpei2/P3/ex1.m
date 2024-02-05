clear;
clc;

T = [0.2 0.3; 0.8 0.7];

%% Alinea a)
v = [0; 1]; %vetor estado

probs = T^2 * v;

disp("a) P[Estar presente | esteve presente]: "+ probs(2));

%% Alinea b)
v = [1; 0]; %vetor estado

probs = T^2 * v;

disp("b) P[Estar presente | nao esteve presente]: "+ probs(2));

%% Alinea c)
v = [1; 0]; %vetor estado

probs = T^30 * v;
disp("c) P[Estar presente | esteve presente]: "+ probs(2));

%% Alinea d)
pNaoFaltar = 0.85;
v = [1-pNaoFaltar; pNaoFaltar];

prob(1) = v(1);

for aula = 1:2*15-1

     probs = T^(aula) * v;
     prob(aula+1) = probs(1);

end

plot(1:30,prob,"b-o")

