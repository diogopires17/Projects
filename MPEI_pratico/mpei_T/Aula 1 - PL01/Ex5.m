disp([num2str(calcularProbabilidade(0.5, 6, 15, 1e5)*100),'%']);
disp([num2str(calcularProbabilidade(0.5, 6, 20, 1e5)*100),'%']);
disp([num2str(calcularProbabilidade(0.5, 6, 40, 1e5)*100),'%']);
disp([num2str(calcularProbabilidade(0.5, 6, 100, 1e5)*100),'%']);

% Crie os gráficos usando stem
% Probabilidade de cara
p = 0.5;

% Números de lançamentos para os quais você deseja calcular as probabilidades
numero_lancamentos = [15, 20, 40, 100];

% Números de caras desejadas
numeros_caras = 6;

% Números de experiências
numeros_experiencias = [1e5, 1e5, 1e5, 1e5];

% Inicialize um vetor para armazenar as probabilidades
probabilidades = zeros(size(numero_lancamentos));

% Calcule as probabilidades para cada número de lançamentos
for i = 1:length(numero_lancamentos)
    probabilidades(i) = calcularProbabilidade(p, numeros_caras, numero_lancamentos(i), numeros_experiencias(i));
end

% Crie um único gráfico de barras empilhadas
bar(numero_lancamentos, probabilidades * 100);
xlabel('Número de Lançamentos');
ylabel('Probabilidade (%)');
title('Probabilidades Estimadas de Obter pelo menos 6 Caras');