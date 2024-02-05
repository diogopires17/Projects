%% Ex2a
clear;
clc;

T = [0 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0 1/3 0 0.2 0.1 0 0;
     0 1/3 0.6 0.5 0.4 0.3 0;
     0 1/3 0.4 0 0.3 0.3 0;
     0 0 0 0.3 0.2 0.4 0];

%% Ex2b

N = 1e5;
CF = 0;

for n = 1:N
    state = crawl(T, 1, 7);
    if length(state) == 8
        if state(2) == 2 && state(end-1) == 6
            CF = CF + 1;
        end
    end

end

p = CF/N;

fprintf("Prob. de 7 digitos e terminar em 9: %f \n", p);

%% Ex2c

CF_C = 0;

for n = 1:N
    state = crawl(T, 1, 7);
    if length(state) == 8
        if state(2) == 2
            CF_C = CF_C + 1;
        end
    end

end

p_C = CF_C/N;

fprintf("Prob. de 7 digitos: %f \n", p_C);

