%% Alinea a)
n = 2; %nr lancamentos
m = 6; %nr faces
N = 1e5; % nr de experiencias

lancamentos = randi(m,n, N); % cria matriz n x M com valores entre 1:m

%“A – a soma dos dois valores e igual a 9”
%"B – o segundo valor é par”
%"C – pelo menos um dos valores é igual a 5"
%“D – nenhum dos valores e igual a 1”


%% CASO A

cA = sum(lancamentos) == 9;

totalA = sum(cA);
probA = totalA/N  %Valor Teorico: 4/36


%% CASO B

segundoLanc = lancamentos(2,:);
segundoPar = rem(segundoLanc, 2) == 0;
totalB = sum(segundoPar);
probB = totalB/N %Valor teorico 1/2


%% CASO C
totalC = 0;
for col = 1:N
    igual5 = ismember(5,lancamentos(:,col));
    totalC = totalC + igual5;
end

probC = totalC/N %Valor teorico 11/36

%% CASO D
totalD = 0;
for col = 1:N
    dif1 = ~ismember(1,lancamentos(:,col));
    totalD = totalD + dif1;
end

probD = totalD/N %Valor Teorico

%% Alinea b)
%P[AeB] = 2/36
%P[A] = 4/36
%P[B] = 1/2
%2/36 == 4/36 * 1/2 LOGO SAO INDEPENDENDETES

%% Alinea c)
%P[CeD] = 1/4
%P[A] = 11/36
%P[B] = 25/36
%1/4 != 11/36 * 25/36 LOGO NAO SAO INDEPENDENTES