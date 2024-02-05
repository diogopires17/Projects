p= 0.5;
N= 1e6;
n=20 % numero de lançamentos. Varia com a alinea a'
for k=0:n %faz-se k+1 porque os indices têm de ser inteiro, mas positivos.
    vp(k+1) = prob_exercise4(k,n,p,N);
end

stem(0:n,vp)