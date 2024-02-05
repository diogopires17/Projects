function [J] = calc_Distance_minHash(Nu,Set)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

J=zeros(Nu); % array para guardar distâncias
h= waitbar(0,'Calculating');

%% Calcular assinaturas
nhf = 10;
assinaturas = zeros(Nu, nhf);
dmH = zeros(Nu);
for n1= 1:Nu
    waitbar(n1/Nu,h)

    for hh = 1:nhf %para cada função de hash
        %processar elementos do conjunto
        conjunto = Set{n1,:};
        x = zeros(length(conjunto));
        for i=1:length(conjunto)
            elem = conjunto(i);
    
            %aplicar hash functions
            hcode = HashFunciton(elem,nhf);
            x{i} = hcode;
        end
        %determinar minimo
        minimo = min(x);
        assinaturas(n1,fh) = minimo;
    end

    %% Calcular distância
    for i=1:nhf
        %% Adicionar código aqui
        u1 = Set{n1,:}; %conjunto 1
        u2 = Set{i,:}; %conjunt

        nI = length(intersect(u1,u2));
        nU = length(union(u1,u2));

        dJ = 1 - nI/nU;

        J(n1,n2) = dJ;
    end
end
delete (h)

end
