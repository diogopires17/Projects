%%                      2c


T = [1/3 1/3 1/3; 1/4 11/20 1/5; 0 1/2 1/2]';
x0 = [60 15 15]';

prob = T^29 * x0;
fprintf("Grupo A: %.1f\nGrupo B: %.1f\nGrupo C: %.5f\n", prob(1), prob(2), prob(3));

%%                      d

x0 = [30 30 30]';
prob = T^29 * x0;

fprintf("Grupo A: %.1f\nGrupo B: %.1f\nGrupo C: %.1f\n", prob(1), prob(2), prob(3));

