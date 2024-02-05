clear all;
clc;
%% Alinea a)

T = [0.8 0.0 0.3 0.0 0.0;
     0.2 0.6 0.2 0.0 0.0;
     0.0 0.1 0.4 0.0 0.0;
     0.0 0.3 0.0 1.0 0.0;
     0.0 0.0 0.1 0.0 1.0];
Verificacao = sum(T);

%% Alinea b)

v = [1 0 0 0 0]';

prob = zeros(1,100);
for n = 1:100
    X = T^n * v;
    prob(n) = X(2);
end
figure(1)
plot(1:100, prob);

%% Alinea c)
v = [1 0 0 0 0]';

for n = 1:100
    X = T^n * v;
    prob(n) = X(4);
    prob2(n) = X(5);
end

figure(2);
plot(1:100, prob, '.', 1:100, prob2, '.');


%% Alinea d)
Q = T(1:3,1:3)

%% Alinea e)
F = (eye(3) - Q)^-1

%% Alinea f)
E = sum(F);
fprintf("Nº passos a começar em 1: %f\n", E(1));
fprintf("Nº passos a começar em 2: %f\n", E(2));
fprintf("Nº passos a começar em 4: %f\n", E(3));

%% Alinea g)

R = [0 0.3 0;
    0 0 0.1];

B = R*F

fprintf("Começando em 1, prob. absorção do 3: %f\n", B(1,1));
fprintf("Começando em 1, prob. absorção do 5: %f\n", B(2,1));









