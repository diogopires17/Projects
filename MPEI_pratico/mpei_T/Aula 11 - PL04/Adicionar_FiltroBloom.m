function B = Adicionar_FiltroBloom(B, elemento, k,n)
    for i = 1:k
        elemento = [elemento num2str(i)];
        hash=string2hash(elemento);
        h=mod(hash, n)+1;
        B(h)=1;
    end
end