% a)
a1 = 0.2;
a3 = 0.3;
a4 = 0.1;
a5 = 0.45;

T = [ 0     0       0       0       0       0
      a1    0       0       0       0       0
      0     0       0       a4      a5      0
      0     0       a3      0       1-a5    0
      1-a1  1       1-a3    0       0       0
      0     0       0       1-a4    0       1];
%% b)

p1_5 = T(5,1);
p5_4 = T(4,5);
p4_meta = T(6,4);
pnormal = p1_5 * p5_4 * p4_meta


N = 1e5;    %numero de simulacoes
sum = 0;
for n = 1:N
    state = crawl(T,1,6);
    if length(state) == 4
        sum = sum + 1;
    end
end
fprintf("Probabilidade sim  %6.4f\n", sum/N);

%% c)
Q = T(1:5,1:5);
F = (eye(5) - Q)^-1;

N = 1e5;

num_medio = 1;                  % estado 6 sendo a meta apenas conta com 1 occorencia(final)
for n = 1:5
    num_medio = num_medio + F(n,1);         % somar numeros da 1º coluna de F(valores medios em cada estado)
end
fprintf("Número médio %6.4f\n", num_medio);


%for i=1:N
  %  res1(i) = length(crawl(T, 1, 6  ));
%end


%passos = sum(res1)/N;






%%


% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state
function [state] = crawl(H, first, last)
% the sequence of states will be saved in the vector "state"
% initially, the vector contains only the initial state:
    state = [first];
% keep moving from state to state until state "last" is reached:
    while (1)
    state(end+1) = nextState(H, state(end));
        if ismember(state(end), last) % verifies if state(end) is absorbing
            break;
        end
    end
end
% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
% find the probabilities of reaching all states starting at the current one:
    probVector = H(:,currentState)'; % probVector is a row vector
    n = length(probVector); %n is the number of states
% generate the next state randomly according to probabilities probVector:
    state = discrete_rnd(1:n, probVector);
end
% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector
function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end