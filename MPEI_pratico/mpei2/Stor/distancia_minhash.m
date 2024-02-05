function J = distancia_minhash(Set, nfd)

    v  = inicFuncoesDispersao;
    
    nc = length(Set);
    
    MinhHashUsers = zeros(nfd, nc);
    J = zeros(nc,nc);
    
    for nu = 1:nc
        C = Set{nu};
    
        for nh = 1:nfd
            MinhHashUsers(nh,nu) = mod(v.a(nh)*C(1)+v.b(nh), v.p);
    
            for nf = 2:length(C)
                htmp = mod(v.a(nh)*(C(nf))+v.b(nh), v.p);
    
                if htmp < MinhHashUsers(nh,nu)
                    MinhHashUsers(nh,nu) = htmp;
                end
            end
        end
    end
    
    % Calculo da distância
    for n1= 1:nc
        for n2= n1+1:nc
            J(n1,n2) = 1 - sum(MinhHashUsers(:,n1)==MinhHashUsers(:,n2))/nfd;
        end
    end
end

