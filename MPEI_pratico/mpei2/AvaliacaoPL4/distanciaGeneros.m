function distancia_user_generos = distanciaGeneros(Set_generos, nhf)
    Nu = length(Set_generos);
    seedMatrix = randi([1 1000],1,nhf);
    MinHashGeneros = zeros(Nu,nhf);
    v  = inicFuncoesDispersao;
    
    h = waitbar(0,'A calcular minHashGeneros()...');
    for user=1:Nu
        waitbar(user/Nu,h);
        for hf=1:nhf
            Generos = Set_generos{user,1};
            hashArr=zeros(1,length(Generos));

            for genero_index = 1:length(Generos)
                key = mod(v.a(hf)*sum(double(Generos{genero_index}))+v.b(hf), v.p);
                hashArr(genero_index) = rem(DJB31MA(key, seedMatrix(hf)), 7919)+1;
            end
            MinHashGeneros(user,hf) = min(hashArr);
        end
    end
    delete(h);

    distancia_user_generos = zeros(Nu,Nu); % array para guardar distancias

    for n1= 1:Nu
        for n2= 1:Nu
            distancia_user_generos(n1,n2) = 1-sum(MinHashGeneros(n1,:)==MinHashGeneros(n2,:))/length(MinHashGeneros(n2,:));
        end
    end
end

