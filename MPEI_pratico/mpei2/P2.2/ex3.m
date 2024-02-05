clear all;
clc;

% a) espaco amostra = {0,1,2,3,4}
x = 0:4;
N = 1e5;

p = 0.5;
n = 4;
pxArr = [];
pxArrTeorico = [];

for i = 0:4
    lancamentos = rand(n,N) < p;
    sucessos = sum(lancamentos) == i;
    prob = sum(sucessos)/N;
    pxArr = [pxArr prob];
end

figure(1);
stem(x,pxArr);

%% Alinea b)
E = 0; 

for i = 0:4
    E = E + i*pxArr(i+1);
end
disp("E: " + E);


var = 0; %Var(X) = E[X^2] - E^2[X]

for i = 0:4
    var = var + (i-E)^2 * pxArr(i+1); 
end
disp("Var: " + var);
disp("Desvio: " + sqrt(var));

%% Alinea c)
% Distribuição binomial
% Seja x o número de coroas que se observam
% nos 4 lançamentos efetuados em N experiencias"
% Expressão:
% Px(k) = nchoosek(n,k)*p^k*(1-p)^(n-k)

%% Alinea d)

for i = 1:length(x)
    prob2 = nchoosek(n,i-1)*p^(i-1)*(1-p)^(n-(i-1));
    pxArrTeorico = [pxArrTeorico prob2];
end

figure(2);
stem(x,pxArrTeorico);

%% Alinea e)
E = 0; 

for i = 0:4
    E = E + i*pxArrTeorico(i+1);
end
disp("E: " + E);


var = 0; %Var(X) = E[X^2] - E^2[X]

for i = 0:4
    var = var + (i-E)^2 * pxArrTeorico(i+1); 
end
disp("Var: " + var);
disp("Desvio: " + sqrt(var));

%% Alinea f)

fprintf("i) %f \n", sum(pxArrTeorico(3:5)));
fprintf("ii) %f \n", sum(pxArrTeorico(1:2)));
fprintf("iii) %f \n", sum(pxArrTeorico(2:4)));

