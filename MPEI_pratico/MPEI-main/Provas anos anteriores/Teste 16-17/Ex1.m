%Miniteste 2017
clear; clc;
%% Ex 1

%a)  
  T = [ 0.9 0.5 0.5;
       0.09 0.4 0.4 ;
       0.01 0.1 0.1 ];
  
  v0 = [0 0 1]';
%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1);
% Se a matriz der só 1, é porque é estocástica

%b)
%1o pacote = x0 = v, logo
%4o pacote = x3

P3 = (T^3) *v0;
fprintf("A probabilidade do quarto pacote ser recebido sem erros é %.3f" + ...
    ", com um erro %.3f,\n e com 2 ou mais erros %.3f.\n",P3(1),P3(2),P3(3));
%c)
  diff = 1e-3; % limite de decisão
  xn = v0;
  iter=1;
  
  while 1
    xOld = xn;
    xn = T^iter*v0;  

    if(max(abs(xn-xOld)) < diff)
      break;
    end
   
    iter= iter+1;
   end
  
  fprintf("A probabilidade de perder esse pacote seria %.4f\ne a probabilidade de perder o pacote sem erros seria %.4f.\n ", xn(3),1-xn(1));