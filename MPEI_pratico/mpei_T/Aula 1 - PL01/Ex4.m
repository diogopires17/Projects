sair_5_caras = calcularProbabilidade(0.5, 5, 15, 1e5);

disp(['A percentagem de sair cara em pelo menos 6 dos 15 lançamentos é ',num2str((1-sair_5_caras)*100),'%']);

function probabilidade = calcularProbabilidade(prob_cara, numero_caras, numero_lancamentos, numero_experiencias)
    lancamentos = rand(numero_lancamentos,numero_experiencias) > prob_cara;
    sucessos= sum(lancamentos)==numero_caras;
    probabilidade = sum(sucessos)/numero_experiencias;
end