x1=0.2;
x3=0.3;
x4=0.1;
x5=0.45;

T= [ 0 0 0 0 0 0;
     x1 0 0 0 0 0;
     0 0 0 x4 x5 0;
     0 0 x3 0 1-x5 0;
     1-x1 1 1-x3 0 0 0;
     0 0 0 1-x4 0 1;
   ];

%% Alina b)
N = 1e5;
add = 0;
for n = 1:N
    state = crawl(T,1,6);
    if length(state) == 4
        add=add+1;
    end
end
disp(add/N)

%% Alinea c)
N = 1e5;
add = 0;
for n = 1:N
    state = crawl(T,1,6);
    add=add+length(state);
end
disp(add/N)