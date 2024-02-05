% Dados fornecidos 
 prob_erro_andre = 0.01; 
 prob_erro_bruno = 0.05; 
 prob_erro_carlos = 0.001; 
 num_programas_andre = 20; 
 num_programas_bruno = 30; 
 num_programas_carlos = 50; 
  
 % Total de programas 
 total_programas = num_programas_andre + num_programas_bruno + num_programas_carlos; 
  
 % Probabilidades a priori 
 prob_andre = num_programas_andre / total_programas; 
 prob_bruno = num_programas_bruno / total_programas; 
 prob_carlos = num_programas_carlos / total_programas; 
  
 % Probabilidades a posteriori (dados que o programa tem um erro sério) 
 prob_andre_dado_erro_serio = (prob_erro_andre * prob_andre) / (prob_erro_andre * prob_andre + prob_erro_bruno * prob_bruno + prob_erro_carlos * prob_carlos); 
 prob_bruno_dado_erro_serio = (prob_erro_bruno * prob_bruno) / (prob_erro_andre * prob_andre + prob_erro_bruno * prob_bruno + prob_erro_carlos * prob_carlos); 
 prob_carlos_dado_erro_serio = (prob_erro_carlos * prob_carlos) / (prob_erro_andre * prob_andre + prob_erro_bruno * prob_bruno + prob_erro_carlos * prob_carlos); 
  
 % Exibir os resultados 7.a) 
 fprintf('Probabilidade de o programa ser do Andre dado erro sério: %.4f\n', prob_andre_dado_erro_serio*100); 
 fprintf('Probabilidade de o programa ser do Bruno dado erro sério: %.4f\n', prob_bruno_dado_erro_serio*100); 
 fprintf('Probabilidade de o programa ser do Carlos dado erro sério: %.4f\n', prob_carlos_dado_erro_serio*100); 
  
 % Verificar quem é mais provável 7.b) 
 [~, indice_max] = max([prob_andre_dado_erro_serio, prob_bruno_dado_erro_serio, prob_carlos_dado_erro_serio]); 
 programadores = {'Andre', 'Bruno', 'Carlos'}; 
 fprintf('É mais provável que o programa seja do %s.\n', programadores{indice_max});