
%%                                  1a

T = [0.8 0 0 0.3 0
    0.2 0.6 0 0.2 0
    0 0.3 1 0 0
    0 0.1 0 0.4 0
    0 0 0 0.1 1];

%% prob para f

N = 1e5;

for i=1:N
    res1(i) = length(crawl(T, 1, [3 5] ));
    res2(i) = length(crawl(T, 2, [3 5] ));
    res4(i) = length(crawl(T, 4, [3 5] ));
end


prob1 = sum(res1)/N
prob2 = sum(res2)/N
prob4 = sum(res4)/N

%%                     g


for i= 1:N

    prob_3 = zeros(1,N);
    prob_5 = zeros(1,N);
    for i = 1:N
        p1 = crawl(T,1, [3 5]);
        prob_3(i) = p1(end) == 3;
        p2 = crawl(T,1, [3 5]);
        prob_5(i) = p2(end) == 5;
    end
    fprintf('Prob(estado 3) = %f, Prob(estado 5) = %f', sum(prob_3)/N, sum(prob_5)/N);

end

%%                                  b

A = [1 2 4];
min = intmax;
max = intmin;

cell_array = {10000};
for i =1:10000
    randomIndex = randi(length(A), 1);
    selected_A_value = A(randomIndex);
    cell_array{i} = crawl(T,selected_A_value, [3 5]);
    if length(cell_array{i}) < min
        min = length(cell_array{i});
    end
    if length(cell_array{i}) > max
        max = length(cell_array{i});
    end
end

fprintf("Max length: %d\t Min length: %d\n", max, min);




% Note:
% if the Markov chain has more than 1 absorbing state the third argument
% must be a vector with the absorbing states
% for example in a chain with 5 states and considering that
% states 4 and 5 are absorbing states:
% state = crawl(H5, 1, [4 5])
%
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