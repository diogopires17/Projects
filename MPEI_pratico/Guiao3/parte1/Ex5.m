T  = [ 0.7 0.2 0.1; 0.2 0.3 0.5; 0.3 0.3 0.4]';


%%                      b

x0 = [1 0 0]';
probdia2 = T*x0;
probdia3 = T*x0;

p = x0(1) * probdia2(1) * probdia3(1);
fprintf("Probabilidade é %.5f\n", p);



%%                      5d


x0 = [1 0 0]';

sol = x0(1);
nuvens = x0(2);
chuva = x0(3);

for i = 2:31
    x0 = T *x0;
    sol = sol + x0(1);
    nuvens = nuvens + x0(2);
    chuva = chuva +x0(3);
end

fprintf("Probabilidade de sol é %.5f, de nuvens é %.5f, de chuva é %.5f\n", sol,nuvens,chuva);
%%                          5c

x0 = [0 0 1]';

sol1 = x0(1);
nuvens1 = x0(2);
chuva1 = x0(3);

for i = 2:31
    x0 = T *x0;
    sol1 = sol1 + x0(1);
    nuvens1 = nuvens1 + x0(2);
    chuva1 = chuva1 +x0(3);
end

fprintf("Probabilidade de sol é %.5f, de nuvens é %.5f, de chuva é %.5f\n", sol1,nuvens1,chuva1);
%%
pdores_sol = sol*0.10 + nuvens*0.3 + chuva * 0.5;
fprintf("Probabilidade de dores com sol são %.5f\n", pdores_sol);
pdores_chuva = sol1*0.10 + nuvens1*0.3 + chuva1* 0.5;
fprintf("Probabilidade de dores com sol são %.5f\n", pdores_chuva);
