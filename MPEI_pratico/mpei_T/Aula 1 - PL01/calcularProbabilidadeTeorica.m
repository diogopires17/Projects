function probabilidade = calcularProbabilidadeTeorica(prob_cara, numero_caras, numero_lancamentos)
    probabilidade= nchoosek(numero_lancamentos,numero_caras)*prob_cara^numero_caras*(1-prob_cara)^(numero_lancamentos-numero_caras); % nchoosek(n,k)= n!/(n-k)!/k!
end