%% Ex3a
clear;
clc;

T = [0 1/2 1/2 0 1/4 0;
     1 0 0 0 1/4 0;
     0 0 0 1 1/4 0;
     0 0 1/2 0 1/4 1;
     0 0 0 0 0 0;
     0 1/2 0 0 0 0];

n = length(T);

A = 0.85*T + 0.15*ones(6,6)*(1/6);

rA = ones(1,6)'*1/6;

rA1 = rA;

while(true)
    rA2 = A*rA1;
    if abs(rA2-rA1)<0.01
        break
    end
    rA1 = rA2;
end

rA2
fprintf("A pág. com maior pagerank é c.fr com prob: %f\n", max(rA2));
fprintf("A pág. com menor pagerank é e.com com prob: %f\n", min(rA2));

%% Alinea b)

M = [A - eye(n,n); ones(1,n)] ;
b = [zeros(n,1); 1];

u = M\b