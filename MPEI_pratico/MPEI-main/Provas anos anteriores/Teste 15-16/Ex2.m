%Miniteste 2015/16
clear; clc;
%% Ex 2

%a)
SA = 1 -0.1-0.05-0.01; % Consumo interno de Angola
SB= 1 -0.1 -0.1 -0.1;
SC= 1-0.2;
SD= 1-0.5-0.1-0.1;
  T = [SA   0.1  0   0.5
       0.1  SB   0   0.1
       0.05 0.1  SC  0.1
       0.01 0.1  0.2 SD];
  
v0 = [1 2 10 5]';
%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1);
% Se a matriz der só 1, é porque é estocástica

%b)
TAgosto = (T^7) *v0;
fprintf("A toneladas existentes em cada país a 1 de Agosto de 2014  são:\nAngola %.3f\n" + ...
    "Brasil %.3f\n" + ...
    "Chile %.3f\n" + ...
    "Dinamarca %.3f\n",TAgosto(1),TAgosto(2),TAgosto(3),TAgosto(4));

%b)
TAgosto = (T^100) *v0;
fprintf("A toneladas existentes em cada país a 1 de Agosto de 2014  são:\nAngola %.3f\n" + ...
    "Brasil %.3f\n" + ...
    "Chile %.3f\n" + ...
    "Dinamarca %.3f\n",TAgosto(1),TAgosto(2),TAgosto(3),TAgosto(4));
% Qual ó o menor valor
b = [zeros(4,1);1];
M = [T - eye(size(T)) ; ones(1,4)];

u = M\b % Probabilidades limite. Atenção que a divisão é com \

%c)
diff = 2; % limite de decisão
iter=1;
  
while 1
    xn = T^iter*v0;  
    if(xn(4)< diff)
      break;
    end
    iter= iter+1;
end
 fprintf("A Dinamarca passa a ter menos de 2 milhões %.0f\n",iter);

