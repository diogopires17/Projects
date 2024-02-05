% Definição das probabilidades de transição
P = [ 1/3, 1/4,0;
      1/3, 11/20, 1/2;
      1/3, 1/5, 1/2 ]; % Matriz de transição

% a)
% Verificação se a matriz é estocástica
isStochastic = all(P >= 0, 'all') && all(sum(P,2) == 1);
if isStochastic == 0
    disp('A matriz não é estocástica.');
else
    disp('A matriz é estocástica.');
end
disp('Matriz de transição:');
disp(P);

% b)
v_0 = [60; 
       15; 
       15];
% c)

num_aulas= 30;

for aula = 1:num_aulas
    v_0 =  P*v_0;
end

fprintf('(c) No fim da aula 30 os grupos A, B, C irão ficar com o seguinte número de alunos (A B C): %.2f %.2f %.2f\n', matriz_c(1), matriz_c(2), matriz_c(3));
