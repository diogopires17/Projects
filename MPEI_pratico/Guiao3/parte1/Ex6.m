%%                          6B

T = [0.8 0.2 0 0 0 ; 0 0.6 0.3 0.1 0 ; 0 0 1 0 0 ; 0.3 0.2 0 0.4 0.1; 0 0 0 0 1 ]';

x0 = zeros(1,5)';
x0(1) = 1;
for i = 1:100
    
    x0 = T * x0;
    res(i) = x0(2);

end

plot(1:100, res,"-r");

%%                             6C

x0 = zeros(1,5)';
x0(1) = 1;

n = 1:100;

for i = n
    x0 = T*x0;
    res3(i) = x0(3);    
    res5(i) = x0(5);

end

figure(1);
title("6c")
subplot(1,2,1);
plot(res3,"-r");
subplot(1,2,2);
plot(res5, "-b")

%%                              d

Tcan  = [0.8 0.2 0 0 0; 0 0.6 0.1 0.3 0;  0.3 0.2 0.4 0 0.1; 0 0 0 1 0; 0 0 0 0 1]';

Q  = Tcan(1:3, 1:3);

%%                              e
eye(2)

F  = inv(eye(size(Q)) - Q);


%%                              f
    
som = sum(F);
fprintf("Valor esperado de passos antes da absorção começando no espaço 1 é %.5f, no estado 2 é %.5f, no 4 é %.5f\n",som(1), som(2), som(3));

%%  

R = Tcan(4:5, 1:3);
B = R*F


fprintf("Estado 3: %.5f, estado 5: %.5f\n", B(1,1),B(2,1) )

