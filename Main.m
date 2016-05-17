%%
clc;clearvars;close all;

%% Metropolis chain
% N - number of vertices
% c - density of generated graph
% q - number of colors
% Beta - intial inverse temperature
% n - no. of iterations
N = 400;
c = 1.2;
q = 5;
Beta = 20;
n = 1500;
dt = 60;
kb = 1.38e-23;
T0 = 1/(Beta*kb);

% generate graph and intialise vertices to random colors
G = generategraph(N,c);
V = randi(q,N,1);

% set vector to intialization values
x = V;
Hamil_time = zeros(1,n);
old_H = inf;
for k = 1:n
    % Heuristics for simulated annealing
    if mod(k,dt) == 0 
       Beta = Beta * k^(1/3);
       T = 1/(Beta*kb);
       fprintf('iteration %d, T = %.2e \n',k,T);
    end
    x = Metropolis(x, q, G, Beta, old_H);
    Hamil_time(k) = Hamiltonian(G,x);
    old_H = Hamil_time(k);
    plot(Hamil_time(1:k))
    axis([0,n,0,max(Hamil_time)])
    drawnow
end
plot(Hamil_time)
axis([0,n,0,max(Hamil_time)])