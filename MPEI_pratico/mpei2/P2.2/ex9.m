N = 1e5;
dp = 2;
m = 14;

%% Alinea a)
x = dp * randn(1,1e5) + m;
histogram(x,100);

cf = sum(x>12 & x<16);
p = cf/N

%% Alinea b)
cfb = sum(x>10 & x<18);
pb = cfb/N

%% Alinea c)
cfc = sum(x>=10);
pc = cfc/N

%% Alinea d)
pAA = normcdf(16, 14, 2) - normcdf(12, 14, 2);

fprintf("12-16: %f \n", pAA);

pBB = normcdf(18, 14, 2) - normcdf(10, 14, 2);

fprintf("10-18: %f \n", pBB);

pCC = normcdf(20, 14, 2) - normcdf(10, 14, 2);

fprintf("10-20: %f \n", pCC);


