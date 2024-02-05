clear;
clc;

%% Alinea a)
T = [ 0.9  0.5 0.5;  
      0.09 0.4 0.4;
      0.01 0.1 0.1;
    ];

v = [0 0 1];

%% Alinea b)

T4 = T^3 * v';
fprintf("Sem erro: %d\n", T4(1));
fprintf("Um erro: %d\n", T4(2));
fprintf("2+ erro: %d\n", T4(3));

%% Alinea c)
i = 1;
while true
    Tb = T^i * v';
    Ta = T^(i+1) * v'; 

    if abs(Ta(1) - Tb(1)) <= 0.001
        break
    end
    i=i+1;
end

disp(Ta)
disp("Pacote perdido: " + Ta(3));
fprintf("Perda sem o codigo corretor de erros: %6.4f \n", 1-Ta(3))

