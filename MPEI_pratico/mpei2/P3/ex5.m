clear;
clc;

%% Alinea a)
T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];

%% Alinea b)
v = [1 0 0]';
% P[sol2 sol3 | sol1] = P[sol1] * P(sol1 -> sol2) * P(sol2 -> sol3)

Sol1 = 1;
Sol2 = Sol1 * T(1,1);
Sol3 = Sol2 * T(1,1);
fprintf("Prob. sol no 2 dia = %f e no 3 dia = %f\n", Sol2, Sol3);

%% Alinea c)

% P[N Chuva2 N Chuva3 | Sol1] = P[sol1] * (1 - (P[chuva2] * P[chuva3 |
% chuva2]))

Sol1 = 1;
Chuva2 = T(2,1);
Chuva3 = Chuva2*T(2,2);
NChuva2 = 1-Chuva2;
NChuva3 = 1-Chuva3;
fprintf("Prob. não chover no 2 dia = %f e não chover 3 dia = %f\n", NChuva2, NChuva3);

%% Alinea d)
diaSol = 1;
diaNuvens = 0;
diaChuva = 0;
for i = 2:31
    v = T*v;
    %v = T^(i-1) * v
    diaSol = diaSol + v(1);
    diaNuvens = diaNuvens + v(2);
    diaChuva = diaChuva + v(3);
end

fprintf("Alinea d) \nDias de Sol: %.3f\nDias de Nuvens: %.3f\nDias de Chuva: %.3f\n", diaSol, diaNuvens, diaChuva);

%% Alinea e)
v = [0 0 1]';

diaSol2 = 0;
diaNuvens2 = 0;
diaChuva2 = 1;
for i = 2:31
    v = T*v;
    %v = T^(i-1) * v
    diaSol2 = diaSol2 + v(1);
    diaNuvens2 = diaNuvens2 + v(2);
    diaChuva2 = diaChuva2 + v(3);
end

fprintf("Alinea e) \nDias de Sol: %.3f\nDias de Nuvens: %.3f\nDias de Chuva: %.3f\n", diaSol2, diaNuvens2, diaChuva2);

%% Alinea f)
fprintf("\nAlinea f)\n")
%fprintf("->Primeiro dia SOL<- \nDores Sol: %.3f \nDores Nuvens: %.3f \nDores Chuva: %.3f \n", diaSol*0.1, diaNuvens*0.3, diaChuva*0.5)
fprintf("Dores Totais: %f\n",diaSol*0.1 + diaNuvens*0.3 + diaChuva*0.5)
%fprintf("->Primeiro dia CHUVA<- \nDores Sol: %.3f \nDores Nuvens: %.3f \nDores Chuva: %.3f \n", diaSol2*0.1, diaNuvens2*0.3, diaChuva2*0.5)
fprintf("Dores Totais: %f\n",diaSol2*0.1 + diaNuvens2*0.3 + diaChuva2*0.5)
