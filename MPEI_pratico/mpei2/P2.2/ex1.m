clear all;
x = 1:6;

fx = ones(1,6)/6;

figure(1);

subplot(1,2,1);
stem(x,fx);
xlim([0 7]);
ylim([0, 0.2]);

subplot(1,2,2);

px = cumsum(fx);

stairs([0 x 7], [0 px 1]);
ylim([0 1.1]);
xlim([0 7]);
grid on


% 
%pacumul = cumsum(probs);
%stairs(Sx,probs)