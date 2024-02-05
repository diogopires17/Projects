%%                          1a


p = ones(1,6)/6;
xi = 1:6;

stem(xi, p, "filled")

%%                          1b

xib = 0:7;
b = [0 cumsum(p) 1];

stairs(xib,b)