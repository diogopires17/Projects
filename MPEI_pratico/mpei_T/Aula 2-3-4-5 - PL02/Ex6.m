% Número total de palavras 
 total_palavras = 3; 
  
 % Número de simulações 
 num_simulacoes = 100000; 
  
 % Inicializar contadores 
 cont_um_dois = 0; 
 cont_um_pelo_menos_uma_vez = 0; 
 cont_um_ou_dois = 0; 
 cont_dois = 0; 
 cont_dois_um = 0; 
  
  
 % Simular as sequências 
 for i = 1:num_simulacoes 
     % Gerar uma sequência aleatória 
     sequencia = randi([1, total_palavras], 1, 2); 
  
     % Verificar se é "um dois" 
     if isequal(sequencia, [1, 2]) 
         cont_um_dois = cont_um_dois + 1; 
     end 
  
     % Verificar se "um" aparece pelo menos uma vez 
     if any(sequencia == 1) 
         cont_um_pelo_menos_uma_vez = cont_um_pelo_menos_uma_vez + 1; 
     end 
  
     % Verificar se ocorre "um" ou "dois" 
     if any(sequencia == 1) || any(sequencia == 2) 
         cont_um_ou_dois = cont_um_ou_dois + 1; 
     end 
  
     %apartir daqui é para a condicional 
  
     % Verificar se é "dois um" 
     if isequal(sequencia, [2, 1]) 
         cont_dois_um = cont_dois_um + 1; 
     end 
  
     % Verificar se inclui "dois" 
     if any(sequencia == 2) 
         cont_dois = cont_dois + 1; 
     end 
 end 
  
 % Calcular probabilidades 
 prob_um_dois_simulado = cont_um_dois / num_simulacoes; 
 prob_um_pelo_menos_uma_vez_simulado = cont_um_pelo_menos_uma_vez / num_simulacoes; 
 prob_um_ou_dois_simulado = cont_um_ou_dois / num_simulacoes; 
 prob_condicional_um_dado_dois_simulado = (cont_um_dois + cont_dois_um) / cont_dois; 
  
  
 % Exibir resultados simulados 
 fprintf('Probabilidade simulada de "um dois": %.4f\n', prob_um_dois_simulado*100); 
 fprintf('Probabilidade simulada de "um" aparecer pelo menos uma vez: %.4f\n', prob_um_pelo_menos_uma_vez_simulado*100); 
 fprintf('Probabilidade simulada de ocorrer "um" ou "dois": %.4f\n', prob_um_ou_dois_simulado*100); 
 fprintf('Probabilidade simulada condicional de incluir "um" dado que inclui "dois": %.4f\n', prob_condicional_um_dado_dois_simulado*100);