function probabilidade = calcularProbabilidade(prob_cara, numero_caras, numero_lancamentos, numero_experiencias)
    lancamentos = rand(numero_lancamentos,numero_experiencias) > prob_cara;
    sucessos= sum(lancamentos)==numero_caras;
    probabilidade = sum(sucessos)/numero_experiencias;
end