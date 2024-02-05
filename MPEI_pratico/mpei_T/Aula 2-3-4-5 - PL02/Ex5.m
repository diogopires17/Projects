% Alinea A)

prob_A = 0;
prob_B = 0;
prob_C = 0;
prob_D = 0;
num_experiencias = 100;
int_A_B = 0;
int_C_D = 0;

for i = 1:num_experiencias
    dado_1 = randi([1,6]);
    dado_2 = randi([1,6]);

    if (dado_1 + dado_2 == 9)
        if (mod(dado_2, 2) == 0)
            int_A_B = int_A_B + 1;
        end
        prob_A = prob_A + 1;
    end

    if (mod(dado_2, 2) == 0)
        prob_B = prob_B + 1;
    end

    if (dado_1 == 5 || dado_2 == 5)
        if (dado_1 ~= 1 && dado_2 ~= 1)
            int_C_D = int_C_D + 1;
        end
        prob_C = prob_C + 1;
    end

    if (dado_1 ~= 1 && dado_2 ~= 1)
        prob_D = prob_D + 1;
    end
end

disp(['A) Probabilidade A = ', num2str(prob_A), '%']);
disp(['A) Probabilidade B = ', num2str(prob_B), '%']);
disp(['A) Probabilidade C = ', num2str(prob_C), '%']);
disp(['A) Probabilidade D = ', num2str(prob_D), '%']);

fprintf('\n');


% Alinea B)

if (int_A_B/100 - ((prob_A/100)*(prob_B/100)) < 0.1)
    prob_A_B_indp = 'True';
else
    prob_A_B_indp = 'False';
end

disp(['B) Os acontecimentos A e B são independentes =  ', prob_A_B_indp]);

fprintf('\n');


% Alinea C)

if (int_C_D/100 - ((prob_C/100)*(prob_D/100)) < 0.1)
    prob_C_D_indp = 'True';
else
    prob_C_D_indp = 'False';
end

disp(['C) Os acontecimentos C e D são independentes =  ', prob_C_D_indp]);


