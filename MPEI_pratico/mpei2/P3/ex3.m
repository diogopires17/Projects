clear;
clc;

T = rand(20);

%% Alinea a) 
x = sum(T); % Nao é estocastica


%% Alinea b)
T = T./repmat(x,20,1);
x = sum(T);
T>=0 & T<=1;

v = [1 zeros(1,19)]';

v2 = T^2 * v;
v5 = T^5 * v;
v10 = T^10 * v;
v100 = T^100* v;

disp(v2(20)*100 + "% <- 2 transicoes")
disp(v5(20)*100 + "% <- 5 transicoes")
disp(v10(20)*100 + "% <- 10 transicoes")
disp(v100(20)*100 + "% <- 100 transicoes")
