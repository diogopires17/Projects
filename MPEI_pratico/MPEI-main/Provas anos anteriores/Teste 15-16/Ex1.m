%Miniteste 2017
clear; clc;
%% Ex 1

%a) Valor de beta
M= [0.01 0.07 0.02
    0.04  0   0.08
    0.04 0.15 0.09
    0.01 0.2  0.01];
soma = sum(sum(M)); % Soma primeiro as colunas e depois as linhas
beta = 1-soma;
M(2,2)=beta;

%b)Calculas as probs. marginais
px= zeros(length(M),1);
for i=1:height(M)
    px(i,1)= sum(M(i,:));
end
px

ProbMargY0=sum(M(1:4)) 
ProbMargY2=sum(M(5:8)) 
ProbMargY3=sum(M(9:12)) 

%c) Calcular a média e variância de X e de Y
vl= [1 2 3 4];
EX= vl*(px); % Média do X

var_X = sum((vl - EX).^2*px);
% Equivalente a var_X = (1 - media_X)^2 * x1 +(2 - media_X)^2 * x2 + (3 - media_X)^2 * x3 + (4 - media_X)^2 * x4

fprintf("Média de X = %.2f\n",EX);
fprintf("Variância de X = %.2f\n",var_X);

vl2= [0 2 3];
MargY =[ProbMargY0,ProbMargY2,ProbMargY3];
EY= vl2*MargY'; % Média do y

var_Y = sum((vl2 - EY).^2.*MargY);
% Equivalente a var_Y = (0 - media_Y)^2 * y0 +(2 - media_Y)^2 * y2 + (3 - media_Y)^2 * y3

fprintf("Média de Y = %.2f\n",EY)
fprintf("Variância de Y = %.2f\n",var_Y)
%d) As variáveis são independentes?

fprintf("-----------------------------------------------------------------------\n")
% calcula-se através do indice de cada um * a probabilidade dele mesmo
media_XY = (1 * 0 * 0.01) + (2 * 0 * 0.04) + (3 * 0 * 0.04) + (4 * 0 * 0.01) + (1 * 2 * 0.07) + (2 * 2 * beta) + (3 * 2 * 0.15) + (4 * 2 * 0.20) + (1 * 3 * 0.02) + (2 * 3 * 0.08) + (3 * 3 * 0.09) + (4 * 3 * 0.01);

if media_XY == (EX * EY)
    fprintf("As variáveis X e Y são independentes\n")
else
    fprintf("As variáveis X e Y não são independentes\n")
end

%e) Calcule a correlação, covariância e coeficiente de correlação entre Y e X
%correlação covariância e coef. correlação
% Corr(xy), Cov(xy) and Cp(xy)
Corrxy = 0;
for y = 1:3
    for x = [1, 2, 3, 4]
        Corrxy = Corrxy + (x*y) * M(x, y);
    end
end 
Covxy = Corrxy - (EX*EX);
Cpxy = Covxy / (sqrt(var_X) * sqrt(var_Y));

disp("1.e)")
fprintf("Correlação\n    %.3f\n",Corrxy);
fprintf("Covariância\n    %.3f\n",Covxy);
fprintf("Coef. correlação\n    %.3f\n",Cpxy);

%% 1.f)
fprintf("-----------------------------------------------------------------------\n")
Esp = 0;
for y = 1:3
    for x = 1:4
        Esp = Esp + (y^2)*(sqrt(x+1));
    end
end
disp("1.f)")
disp("Valor esperado")
disp(Esp)