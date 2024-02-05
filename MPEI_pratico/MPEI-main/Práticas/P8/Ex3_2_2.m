% Exercício 1 da parte 3.2
%% Alinea A
T = [0 0.5 0.5 0 0 0 0; 0 0 0 1/3 1/3 1/3 0; 0 0 0 0 0.6 0.4 0; 0 0 0 0.2 0.5 0 0.3; 0 0 0 0.1 0.4 0.3 0.2; 0 0 0 0 0.3 0.3 0.4; 0 0 0 0 0 0 1]';

%% Alinea B Probabilidade de uma sequencia de 7 dígitos iniciada por 91 e terminada em 9 ?
N = 1e5; %Nº experiencias

Seq7_91 = 0;    %Contador da alínea c) 
Seq7_91__9 = 0; %Contador da alínea b)

aux = crawl(T,1,7);

for i=1: N
    aux = crawl(T,1,7); %gerar sequência
    if length(aux) == 7 %comp = 7
        if aux(1,2) == 2    %seq "91....."
            Seq7_91 = Seq7_91 + 1;
            if aux(1, end-1) == 6 %seq"91.....9"
                Seq7_91__9 = Seq7_91__9 + 1;
            end   
        end
    end
end

probB = Seq7_91__9 /N;
fprintf("b) Probabilidade de uma sequência de 7 dígitos iniciada por 91 e terminada em 9: %.5f\n", probB);

%% AlineaC Qual a probabilidade de sequencias de 7 dígitos iniciadas por 91 ?
probC = Seq7_91/N;
fprintf("c) Probabilidade de sequências de 7 dígitos iniciadas por 91: %.5f\n ", probC);