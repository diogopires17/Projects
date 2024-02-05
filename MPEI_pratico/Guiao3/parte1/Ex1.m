%%                              1a


T = [0.7 0.3; 0.8 0.2]';
x0  = [1 0]';

prob = T^2*x0;
fprintf("Probabildade pedida é %.5f\n", prob(1))

%%                               b

x0  = [0 1]';
prob = T^2*x0;
fprintf("Probabildade pedida é %.5f\n", prob(2))

%%                               c

x0 = [1 0]';
prob = T^29*x0;
fprintf("Probabildade pedida é %.5f\n", prob(1))

%%                                 d
x0 = [0.85, 0.15]';

res(1) = 0.15;
for i=2:29
    x0 = T*x0;
    res(i) = x0(2);
end

plot(1:29, res)