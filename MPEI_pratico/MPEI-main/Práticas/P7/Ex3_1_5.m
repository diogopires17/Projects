% Exercício 5 da parte 3.1
clear;clc;
T= [0.7 0.2 0.3; 0.2 0.3 0.3; 0.1 0.5 0.4];

%Para verificar se é estocástica
sum(T);
(T >=0) & (T <=1);
% Se a matriz der só 1, é porque é estocástica

%% Alínea B
v1 = 1; % Estado inicial é sol. Não era preciso fazer vetor neste caso 
% por causa de depois irmos usar valores unicos e não matrizes
%P(sol1) * P(Sol2 | Sol1) * P(Sol3 | Sol2)

PSolnoSegundoDiaeNoTerceiroDia =v1 * T(1,1) * T(1,1)
%% Alínea C
v1 = 1; % Estado inicial é sol. Não era preciso fazer vetor neste caso 
%P(sol1) * 1-(P(Sol->Chuva)) * P((chuva -> Chuva)
PNaoChoverNemNoSegundoNemNoTerceiro = 1- (v1 * T(3,1) * T(3,3))

%% Alínea D
vi = [1 0 0]';
diaSol= 1;
diaChuva=0;
diaNuvens = 0;
for i= 2:31
    vi = T*vi; % igual a v= T^(i-1) * v1
    diaSol = diaSol +vi(1);
    diaNuvens = diaNuvens +vi(2);
    diaChuva = diaChuva +vi(3);
end

fprintf("O número médio de dias de sol no mês de janeiro é %0.0f\n",diaSol);
fprintf("O número médio de dias de nuvens no mês de janeiro é %0.0f\n",diaNuvens);
fprintf("O número médio de dias de chuva no mês de janeiro é %0.0f\n",diaChuva);

%% Alínea E
vi = [0 0 1]';
diaSol= 0;
diaChuva=1;
diaNuvens = 0;
for i= 2:31
    vi = T*vi; % igual a v= T^(i-1) * v1
    diaSol = diaSol +vi(1);
    diaNuvens = diaNuvens +vi(2);
    diaChuva = diaChuva +vi(3);
end
fprintf("\n")
fprintf("O número médio de dias de sol no mês de janeiro é %0.0f\n",diaSol);
fprintf("O número médio de dias de nuvens no mês de janeiro é %0.0f\n",diaNuvens);
fprintf("O número médio de dias de chuva no mês de janeiro é %0.0f\n",diaChuva);

%% Alínea F
vi = [1 0 0]';
diaSol= 1;
diaChuva=0;
diaNuvens = 0;
diareumatismo =0;
for i= 2:31
    vi = T*vi; % igual a v= T^(i-1) * v1
    diaSol = diaSol +vi(1);
    diaNuvens = diaNuvens +vi(2);
    diaChuva = diaChuva +vi(3);
    diareumatismo = diareumatismo+ 0.1 * vi(1) + 0.3*vi(2) + 0.5*vi(3);
end
fprintf("\n")
fprintf("O número médio de dias que a pessoa vai sofrer de dores reumáticas em janeiro %0.0f\n",diareumatismo);


vi = [0 0 1]';
diaSol= 0;
diaChuva=1;
diaNuvens = 0;
diareumatismo =0;
for i= 2:31
    vi = T*vi; % igual a v= T^(i-1) * v1
    diaSol = diaSol +vi(1);
    diaNuvens = diaNuvens +vi(2);
    diaChuva = diaChuva +vi(3);
    diareumatismo = diareumatismo+ 0.1 * vi(1) + 0.3*vi(2) + 0.5*vi(3);
end
fprintf("\n")
fprintf("O número médio de dias que a pessoa vai sofrer de dores reumáticas em janeiro %0.0f\n",diareumatismo);