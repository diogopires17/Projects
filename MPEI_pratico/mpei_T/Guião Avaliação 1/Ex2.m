load("L.mat");

% a)
disp("O valor de N é:");
N = size(L);
disp(N);
S=sum(L);
disp("Os dead-dens são:")
disp(find(S==0));

% b)
H=zeros(N(1),N(1));
n=0;
for i=1:110
    n=sum(L(:,i));
    H(:,i)=L(:,i)/n;
end

disp(H);

% c) 
disp("A matriz A é:")
b=0.85;
A=b*H+(1-b)*(ones(N(1),N(1))/N(1));

disp(A);


