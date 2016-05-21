%%
clc;clearvars;close all;
%% Metropolis chain
% N - number of vertices
% c - density of generated graph
% q - number of colors
% n - no. of iterations
N = 400;
c = 5;
q = 5;
n = 30000;
dt = 50;
% Generate graph and intialise vertices to random colors
G = generategraph(N,c);
x = randi(q,N,1);

% Vectors for plotting material, set initial hamiltonian
Hamil_time = zeros(1,n); Temp_time = zeros(1,n);
old_H = Hamiltonian(G,x);

% Choose a heuristic for temperature cooling
gamma = 0;
alpha = 700; y = linspace(1,100,n);
tempschedule = 1./(1 + alpha*log((1:n)));
tempschedule = gamma*(1./2*(1 - tanh((y./10)))) + (1-gamma)*tempschedule;

tempschedule = tempschedule* old_H;

% T is set to initial error
% (Beta - intial inverse temperature)
T = old_H;
Beta = 1/T;
for k = 1:n
    % Change in temperature when k%dt=0
    if mod(k,dt) == 0 
       T = tempschedule(k);
       Beta = 1/T;
       fprintf('iteration %d, T = %.2e, H = %d \n',k,T,old_H);

    end
    % Perform metropolis step
    [x,delta] = Metropolis(x, q, G, Beta, old_H); 
    Hamil_time(k) = old_H + delta;
    old_H = Hamil_time(k);
    Temp_time(k) = T;

    % Uncomment for continuous plotting
%     plot(Hamil_time(1:k),'b')
%     hold on
%     axis([0,n,0,max(Hamil_time)])
%     plot(Temp_time(1:k),'r')
%     axis([0,n,0,max(Hamil_time)])
%     drawnow
end
plot(Hamil_time, 'b'); hold on
handel = plot(Temp_time(1:k),'b--');
axis([0,n,0, max(Hamil_time)+20])