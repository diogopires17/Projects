A = [1 2 3;4 5 6];             %Criação de Matriz
vetor = [1 2 3];               %Criação de Vetor
vetor_linha = [1 2 3]';        %v = [1 2 3]'
A(1,3);                        %Buscar valor da linha 1, coluna 3 da Matriz
A(1,3) = 7                     %Atribui valor 7 à linha 1, coluna 3 da Matriz
A(2,[1 2 3])                   %Buscar valores das colunas 1, 2 e 3 da linha 2 da  Matriz(começa no 1 e faz de 2 em 2)
A = [A ; [7 8 9]]              %Concatenação da Matriz A com um nova linha com 3 colunas
A = [A [7;8;9]]                %Concatenação da Matriz A com um nova coluna com 3 linhas
vetor_linha = [4:2:100]        %vetor linha começado em 4 até 100 com sequência de números pares
vetor_linha = [5:-1:-5]        %vetor linha começado em 5 até -5 com sequência decrescente
A(1:3,1:2:3)                   %Buscar valores da linha 1 a 3 das colunas 1 e 3 da Matriz
vetor_linha3 = [0:1/(99):1]    %vetor linha começado em 0 até 1 com 100 elementos espaçados uniformemente
B = rand(20,30)                %criar matriz aleatória com 20 linhas e 30 colunas
P = [B(10:15 , 9:12)]          %criar matriz P apartir das linhas 10 a 15 e colunas 9 a 12
X = -pi:pi/15:pi               %Gere uma sequencia, ˆ x, a comec¸ar em −π e a acabar em π com um passo de π/15
