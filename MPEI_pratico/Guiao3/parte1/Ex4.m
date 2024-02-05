%%                          a


p  = 0.4;
q = 0.6;


T = [p^2 (1-p)^2 p*(1-p) p*(1-p); 0 0 0 1; 0 0 0 1; q^2 q*(1-q) q*(1-q) (1-q)^2 ]';

%%                          b

x0 = [1 0 0 0]';

trans5 = T^5*x0;
trans10 = T^10*x0;
trans100 = T^100*x0;
trans200 = T^200*x0;


fprintf("Probabilidade ao fim de 5 transições de estar: \n no estado A é: %.5f\n no estado B é: %.5f\n no estado C é: %.5f\n no estado D é: %.5f\n ", trans5(1), trans5(2), trans5(3), trans5(4));
fprintf("Probabilidade ao fim de 10 transições de estar: \n no estado A é: %.5f\n no estado B é: %.5f\n no estado C é: %.5f\n no estado D é: %.5f\n ", trans10(1), trans10(2), trans10(3), trans10(4));
fprintf("Probabilidade ao fim de 100 transições de estar: \n no estado A é: %.5f\n no estado B é: %.5f\n no estado C é: %.5f\n no estado D é: %.5f\n ", trans100(1), trans100(2), trans100(3), trans100(4));
fprintf("Probabilidade ao fim de 200 transições de estar:  \n no estado A é: %.5f\n no estado B é: %.5f\n no estado C é: %.5f\n no estado D é: %.5f\n ", trans200(1), trans200(2), trans200(3), trans200(4));
%%                            c



M  = [T - eye(4); ones(1,4)];
x = [ 0 0 0  0 1]';
u = M\x;
fprintf("Probabilidade limite \n no estado A é: %.5f\n no estado B é: %.5f\n no estado C é: %.5f\n no estado D é: %.5f\n ", u(1), u(2), u(3), u(4));



