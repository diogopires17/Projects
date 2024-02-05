clear;
clc;

N = 1e5;
p = 0.05:0.05:1;

% Aviao de 2 motores despenha-se se 2 motores falharem
p2 = nchoosek(2,2).*p.^2;

% Aviao de 4 motores despenha-se se 3 ou 4 motores falharem
p4 = nchoosek(4,3).*p.^3.*(1-p) + nchoosek(4,4).*p.^4;

plot(p,p2);
hold on;
plot(p,p4);
hold off;
xlabel("Prob. falha no motor");
ylabel("Prob. avião cair");
legend("p2", "p4");
