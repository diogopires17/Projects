clear all;

%% ALINEA a)
N = 1e5;
probSerCarlos = 0.5;


progA = rand(20,N) < 0.01;
progB = rand(30,N) < 0.05;
progC = rand(50,N) < 0.001;

programas = [progA; progB; progC];

%% Prob programa ter erro
TotalErros = sum(sum(programas));   %nr de erros em cada experiencia


%% Prob Carlos dar erro

TotalErrosCarlos = sum(sum(progC));


probC = TotalErrosCarlos/TotalErros

%% ALINEA b)

TotalErrosBruno = sum(sum(progB));
TotalErrosAndre = sum(sum(progA));

maisProvavel = max([TotalErrosCarlos; TotalErrosAndre; TotalErrosBruno]);

if maisProvavel == TotalErrosAndre
    disp("André");
elseif maisProvavel == TotalErrosBruno
    disp("Bruno");
else
    disp("Carlos");
end