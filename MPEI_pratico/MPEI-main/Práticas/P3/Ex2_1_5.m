clc;clear;
%% 2.1.5
N = 1e5;    %  num experiencias
n = 2;      %  lançamentos
m = 6;      %  valor maximo

array   =  randi(m, n, N);

diferentes= zeros(1,N);
sucessosA = 0;
sucessosB = 0;
sucessosC = 0;
sucessosD = 0;

for col=1:N
    % A – a soma dos dois valores é igual a 9
    if sum(array(:,col)) ==9
     sucessosA = sucessosA +1;%soma igual a 9
    end
    
    % B – o segundo valor é par
    if (rem(array(2,col),2))==0 % ver se o numero é par
        sucessosB= sucessosB+1;
    end

    % C – pelo menos um dos valores é igual a 5
    if array(1,col)  ==5 || array(2,col)  ==5
        sucessosC= sucessosC+1;
    end

    % D – nenhum dos valores é igual a 1
    if array(1,col)  ~=1 && array(2,col)  ~=1
        sucessosD= sucessosD+1;
    end
end

pA = sum(sucessosA)/N
pB= sum(sucessosB)/N
pC= sum(sucessosC)/N
pD= sum(sucessosD)/N