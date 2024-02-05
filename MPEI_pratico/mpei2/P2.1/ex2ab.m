n = 20; %nr dardos
m = 100; %nr alvos
N = 1e4;

lancamentos = randi(m,n, N); % cria matriz n x M com valores entre 1:m
diferentes = zeros(1,N);

for col = 1:N
    %length(unique(lancamentos(:,col))) isto mostra o nr de valores unicos
    %que existe em cada coluna
    diferentes(col) = length(unique(lancamentos(:,col)))==n;
end

p1 = sum(diferentes)/N;
p2 = 1-p1;
fprintf('Alinea a): probabilidade = %.6f \n', p1);

fprintf('Alinea b): probabilidade = %.6f \n', p2);