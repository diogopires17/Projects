function J = calcDistancia(Nu,Set)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
J=zeros(Nu); % array para guardar distâncias
h= waitbar(0,'Calculating');

for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2=n1+1:Nu
        %% Adicionar código aqui
        u1 = Set{n1,:}; %conjunto 1
        u2 = Set{n2,:}; %conjunt

        nI = length(intersect(u1,u2));
        nU = length(union(u1,u2));

        dJ = 1 - nI/nU;

        J(n1,n2) = dJ;
    end
end
delete (h)

end