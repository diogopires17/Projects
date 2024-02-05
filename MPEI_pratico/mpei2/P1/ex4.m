import prob.*
import prob2.*


x = prob(6,15,0.5,1e6);
fprintf("Prob -> %.20f \n",x)

x = prob(6,20,0.5,1e6);
fprintf("Prob -> %.20f \n",x)

x = prob(6,40,0.5,1e6);
fprintf("Prob -> %.20f \n",x)

x = prob(6,100,0.5,1e6);
fprintf("Prob -> %.20f \n",x)


%% grafico

N = 1e6;help prob

lancamentos = 20;


for x = 0:20
    P(x+1) = prob(x,lancamentos,0.5,N);

end



stem(0:20,P)