function membro = Membro_FiltroBloom(B, elemento, k, n)
membro = 'true';
for i = 1:k
    elemento = [elemento num2str(i)];
    hash=string2hash(elemento);
    h=rem(hash, n)+1;
    if B(h) ~= 1
        membro = 'false';
    end
end
end