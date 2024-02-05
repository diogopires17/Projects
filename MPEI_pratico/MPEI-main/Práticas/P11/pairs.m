function SimilarUsers = pairs(Nu,J,threshold, users)
%Processar as distancias e devolver os pares de conjuntos similares. Um dos parâmetros de entrada desta função deve ser o limiar de decisção

if nargin < 3
    threshold = 0.4;
end

SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu
    for n2= n1+1:Nu
        if J(n1,n2) < threshold
            SimilarUsers(k,:) = [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end
end