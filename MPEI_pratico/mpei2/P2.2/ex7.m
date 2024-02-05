lambda = 15; %lambda na de poisson é a media
k = 0;

%% Alinea a)
probA = (lambda^k)/factorial(k) * exp(-lambda)

%% Alinea b)
clear;

lambda = 15;
prob = 0;

for k = 0:10
    prob = prob + (lambda^k)/factorial(k) * exp(-lambda);
end

probB = 1 - prob
