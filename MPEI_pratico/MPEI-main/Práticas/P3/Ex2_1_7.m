clc;clear;
ProbA = 0.01; % Probabilidade de erro em cada um
ProbB = 0.05;
ProbC = 0.001;

nA =20; %  programas do André
nB =30;
nC =50;
NumProgramasTotal = 100;      %  programas totais

        %  A: Programa com erro
        %  B: Programa do Carlos

N = 1e5;      %  num experiencias

% Array de zeros e uns se cada programa do André, do Bruno ou o Carlos têm erro ou nao
progA= rand(nA,N) < ProbA;
progB= rand(nB,N) < ProbB;
progC= rand(nC,N) < ProbC;

prog= [progA;progB;progC];

% Casos Favoraveis de Erro
CasosFavErro = sum(sum(prog));

% Casos Favoraveis Carlos e Erro
CasosFavErroCarlos = sum(sum(progC));

% P(Carlos|Erro)
ProbCarlosDadoQueErro = CasosFavErroCarlos / CasosFavErro

% Casos Favoraveis Bruno e Erro
CasosFavErroBruno = sum(sum(progB));

% P(Bruno|Erro)
ProbBrunoDadoQueErro = CasosFavErroBruno / CasosFavErro

% Casos Favoraveis Andre e Erro
CasosFavErroAndre = sum(sum(progA));

% P(Andre|Erro)
ProbAndreDadoQueErro = CasosFavErroAndre / CasosFavErro