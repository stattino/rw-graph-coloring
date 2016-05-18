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
T0 = 300;
Beta = 1/T0;
n = 1500;
dt = 60;
kb = 1.38e-23;
T0 = 1/(Beta);

% generate graph and intialise vertices to random colors
G = generategraph(N,c);
V = randi(q,N,1);

% set vector to intialization values
x = V;
Hamil_time = zeros(1,n);
Temp_time = zeros(1,n);
old_H = Hamiltonian(G,x);
T = old_H
for k = 1:n
    % Heuristics for simulated annealing
    if mod(k,dt) == 0 
       T = T/2;
       Beta = 1/T;
       fprintf('iteration %d, T = %.2e \n',k,T);
    end
    [x,delta] = Metropolis(x, q, G, Beta, old_H);
    Hamil_time(k) = old_H + delta;
    %fprintf('iteration %d, delta = %d \n',k,delta);
    old_H = Hamil_time(k);
    figure(1)
    plot(Hamil_time(1:k),'b')
    hold on
    axis([0,n,0,max(Hamil_time)])
    Temp_time(k) = T;
    plot(Temp_time(1:k),'r')
    axis([0,n,0,max(Hamil_time)])
    drawnow
end
plot(Hamil_time)
axis([0,n,0,max(Hamil_time)])