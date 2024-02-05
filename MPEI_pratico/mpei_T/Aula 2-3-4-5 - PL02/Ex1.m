nao_sair_rapaz = calcularProbabilidade(0.5, 0, 2, 1e5);
disp(['a) A percentagem simulada de não sair rapaz é ',num2str((1-nao_sair_rapaz)*100),'%']);

nao_sair_rapaz_teorica = calcularProbabilidadeTeorica(0.5, 0, 2);
disp(['b) A percentagem simulada teórica de não sair rapaz é ',num2str((1-nao_sair_rapaz_teorica)*100),'%']);

nao_sair_rapaz_c = calcularProbabilidade(0.5, 1, 3, 1e5);
disp(['c) A percentagem simulada de não sair rapaz é ',num2str((nao_sair_rapaz_c)*100),'%']);

nao_sair_rapaz_teorica_c = calcularProbabilidadeTeorica(0.5, 1, 3);
disp(['c) A percentagem teórica de não sair rapaz é ',num2str((nao_sair_rapaz_teorica_c)*100),'%']);

segundo_rapaz_d = calcularProbabilidade(0.5, 1, 2, 1e5);
disp(['d) A percentagem simulada do segundo primeiro e segundo filho ser rapaz é ',num2str((segundo_rapaz_d)*100),'%']);

rapaz_2_5 = calcularProbabilidade(0.5, 1, 4, 1e5);
disp(['e) A percentagem simulada do 1º filho ser rapaz e existir mais um filho rapaz é ',num2str((rapaz_2_5)*100),'%']);

rapaz_0_4_f = calcularProbabilidade(0.5, 0, 4, 1e5);
disp(['f) A percentagem simulada de existir pelo menos 2 rapazes é ',num2str((1-rapaz_0_4_f)*100),'%']);

nao_sair_rapaz_teorica = calcularProbabilidadeTeorica(0.5, 0, 2);
disp(['E) A percentagem teórica de não sair rapaz é ',num2str((1-nao_sair_rapaz_teorica)*100),'%']);
