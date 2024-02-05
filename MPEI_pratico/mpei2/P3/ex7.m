clear;
%% Alinea a)

N = 6;

H = [0 0 0 0 1/3 0;
     1 0 0 0 1/3 0;
     0 1/2 0 1 0 0;
     0 0 1 0 0 0;
     0 1/2 0 0 0 0;
     0 0 0 0 1/3 0];

pr = ones(N, 1)/N;

%for i = 1:10
%    pr = H * pr;
%end

prA = H^10 * pr

%% Alinea b)
% dead-end: F
% spider trap: D <-> C

%% Alinea c)
H = [0 0 0 0 1/3 1/N;
     1 0 0 0 1/3 1/N;
     0 1/2 0 1 0 1/N;
     0 0 1 0 0 1/N;
     0 1/2 0 0 0 1/N;
     0 0 0 0 1/3 1/N];

pr = ones(N, 1)/N;
%for i = 1:10
%    pr = H * pr;
%end
prC = H^10 * pr

%% Alinea d)
b = 0.8;
A = b * H + (1-b)*(ones(6,6)/N);

pr = ones(N, 1)/N;
%for i = 1:10
%    pr = A * pr;
%end
pr = A^10 * pr

%% Alinea e)
rA = ones(1,6)'*1/6;

rA1 = rA;
n = 0;

while(true)
    rA2 = A*rA1;
    test = abs(rA2-rA1);
    n = n+1;
    if test<=10^-4
        break
    end
    rA1 = rA2;
end

rA2

fprintf("Foram necessárias %d iterações\n", n);


