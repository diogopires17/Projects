%%                              a               

T  = rand(20,20);

for i = 1:20
T(:, i) = T(:, i ) / sum(T(:, i));
end

%%                              b

x0  = zeros(1,20)';
x0(1) = 1;

prob2 = T^2 * x0;
prob5 = T^5 * x0;
prob10 = T^10 * x0;
prob100 = T^100 * x0;
fprintf("Probabilidade de estar no estado 20 após 2 transições é de: %.5f\n", prob2(20));
fprintf("Probabilidade de estar no estado 20 após 5 transições é de: %.5f\n", prob5(20));
fprintf("Probabilidade de estar no estado 20 após 10 transições é de: %.5f\n", prob10(20));
fprintf("Probabilidade de estar no estado 20 após 100 transições é de: %.5f\n", prob100(20));

