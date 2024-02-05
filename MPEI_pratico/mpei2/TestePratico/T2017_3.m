clear; clc;

%% Alinea a)
    % a   b   c   d   ?   .
T = [ 0.7 0.2 0.0 0.0 0.0 0.0;
      0.2 0.0 0.3 0.0 0.0 0.0;
      0.0 0.6 0.3 0.0 0.0 0.0;
      0.1 0.2 0.3 0.1 0.0 0.0;
      0.0 0.0 0.1 0.5 1.0 0.0;
      0.0 0.0 0.0 0.4 0.0 1.0;
    ];

%% Alinea b)
v = [1 0 0 0 0 0]';

Tc = T^9 * v;
fprintf("c : %6.4f\n", Tc(3));

Td = T^14 * v;
fprintf("d : %6.4f\n", Td(4));



%% Alinea c)

Q = T(1:4,1:4);
F = (eye(length(Q)) - Q)^(-1);

N = 1e6;
sum = 0;
for n = 1:N
    state = crawl(T,3,[5,6]);
    sum = sum + length(state);
end
fprintf("Valor medio %6.4f\n", sum/N);



