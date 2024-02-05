%% a)

clear all;
clc;

a1 = 0.2;
a2 = 0.3;
a3 = 0.45;
a4 = 0.1;

       %1 %2 %3 %4 %5 %Meta
T =    [ 0 0 0 0 0 0;       % 1
         a1 0 0 1-a4 1 0;   % 2
         0 1-a2 0 a4 0 0;   % 3
         0 a2 1-a3 0 0 0;   % 4
         1-a1 0 0 0 0 0;    % 5
         0 0 a3 0 0 1 ];    % Meta


Q = T(1:5,1:5);
F = inv(eye(length(Q)) - Q);

%% b)
N = 1e6;
sum = 0;

for n = 1:N
    state = crawl(T,1,6);
    if length(state) == 4
        sum = sum + 1;
    end
end
disp(sum)
fprintf("Probabilidade %6.4f\n", sum/N);

%% c)

numero_medio = sum(F(:,1))+1;

fprintf("N'mero médio %6.4f\n", numero_medio);