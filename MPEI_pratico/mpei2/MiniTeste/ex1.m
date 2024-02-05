clear; clc;

a1 = 0.2;
a2 = 0.3;
a3 = 0.45;
a4 = 0.1;


%% a)
% 1 2 3 4 5 Meta
T = [ 0,    0,    0,    0,    0, 0;
      1-a1, 0,    0,    1-a4, 1, 0;
      0,    1-a2, 0,    a4,   0, 0;
      0,    a2,   a3,   0,    0, 0;
      a1,   0,    0,    0,    0, 0;
      0,    0,    1-a3, 0,    0, 1;
    ];

sum(T);

%% b)
x = T(2,1) * T(3,2) * T(6,3);
disp("Prob b: "+ x);

%% c)
Q = T(1:5,1:5);

F = (eye(5)- Q)^(-1);

media = sum(F(:,1));    % nr medio 1 a 5
disp(media+1)           % contando com a casa final