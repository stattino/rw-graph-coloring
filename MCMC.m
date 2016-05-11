%% Metropolis chain
% N - number of vertices
% c - density of generated graph
% q - number of colors
% Beta - intial inverse temperature
% n - no. of iterations
N = 1000;
c = 1;
q = 3;
Beta = 20;
n = 1000; 

% generate graph and intialise vertices to random colors
G = generategraph(N,c);
V = randi(q,N,1);

% set vector to intialization values
x = V;
Hamil_time = zeros(1,n);
for k = 1:n
    % Heuristics for simulated annealing
    if mod(k,100) == 0 
       Beta = Beta * 1/k;
    end
    x = Metropolis(x, q, G, Beta);
    Hamil_time(k) = Hamiltonian(G,x);
end
plot(Hamil_time)
