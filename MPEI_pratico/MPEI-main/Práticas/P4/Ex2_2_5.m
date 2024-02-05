% Exercício 5 da parte 2.2
clear;clc;
% X = numero de motores que falham

%% Vamos calcular a probabilidade de cair um aviao com 2 motores
%Aviao de 2 motores -> despenha-se quando ambos os motores falharem 
% (>50% dos motores falharem):
n = 2; % nº de motores
k = 2; % nº de motores a falhar
p = logspace(-3, log10(1/2),100);

p2Motores = nchoosek(n,k).*p.^k.*(1-p).^(n-k); % Atenção ao uso do . 
% para operacão elemento a elemento!!

%% Aviao de 4 motores -> despenha-se quando 3 ou 4 motores falharem
p4Motores = 0;
n = 4; % nº de motores

for k=3:4 % podem falhar 3 ou 4 motores
    p4Motores= p4Motores+ nchoosek(n,k).*p.^k.*(1-p).^(n-k);
end

%% Gráfico
figure(1);
hold on;

x = logspace(-3, log10(1/2),100);

plot(x,p4Motores);
plot(x,p2Motores);

legend("4 motores","2 motores");
xlabel('p');
ylabel('pX');
title("Variacao de pX em funcao de p");
hold off;
% Ate os dois graficos se intercetarem (analisando o grafico, a mais ou menos p =  0.33) e mais seguro viajar no aviao com 4 motores. A partir dai porém, e prerefirvel viajar no aviao com 2 motores