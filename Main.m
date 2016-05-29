%%
clc;clearvars;close all;
%% Metropolis chain
% N - number of vertices
% c - density of generated graph
% q - number of colors
% n - no. of iterations
N = 400;
c = 20;
q = 5;
n = 5000;
dt = 50;
% Generate graph and intialise vertices to random colors
G = generategraph(N,c);
x = randi(q,N,1);
initTscalefactor = 1;

% load other data
% exdata = load('Best_result.mat');
% x = exdata.xmin;
% old_Hmin = exdata.Hmin;
% G = exdata.G;
% initTscalefactor = 0.01;

% Vectors for plotting material, set initial hamiltonian
Hamil_time = zeros(1,n); Temp_time = zeros(1,n);
old_H = Hamiltonian(G,x);

% Choose a heuristic for temperature cooling
gamma = 0; %choose 
alpha = 700; y = linspace(1,100,n);
tempschedule = 1./(1 + alpha*log((1:n)));
tempschedule = gamma*(1./2*(1 - tanh((y./10)))) + (1-gamma)*tempschedule;

tempschedule = tempschedule* old_H * initTscalefactor;

% T is set to initial error
% (Beta - intial inverse temperature)
T = old_H*initTscalefactor;
Beta = 1/T;
Hmin = old_H;
xmin = x;
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
    if old_H < Hmin
        Hmin = old_H;
        xmin = x;
    end
    
    if mod(k,1000) == 0
        fprintf('Saving best results...');
        save('Best_result.mat','Hmin','xmin','G')
        fprintf('done!\n\n');
    end

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