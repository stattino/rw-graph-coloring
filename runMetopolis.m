function [ Hmin, nrIterations ] = runMetopolis( data )
%runMetopolis(data) Returns the minimum hamiltonian and the nrIterations. Breaks
%at H = 0. Data is a struct
%   data contains the following fields
%   data.G - a neighbourhood graph
%   data.q - nr of colors
%   data.n - maximal nr of iterations
%   data.xinit - initial state

G = data.G; %data graph
q = data.q; %number of colors
n = data.n; % t_{max}
dt = 50; %number of time steps with constant temperature


if data.temp == 1
    alpha = 700;
    tempschedule = 1./(1 + alpha*log((1:n)));
else
    linsp = linspace(1,100,n);
    tempschedule = 1./2*(1 - tanh((linsp./10)));
end

Hamil_time = zeros(1,n);
Temp_time = zeros(1,n);


x = data.xinit;
old_H = Hamiltonian(G,x);
tempschedule = old_H.*tempschedule;
T = tempschedule(1);
Beta = 1/T;

for k = 1:n
    % Heuristics for simulated annealing
    if mod(k,dt) == 0
       T = tempschedule(k);
       Beta = 1/T;
    end
    [x,delta] = Metropolis(x, q, G, Beta, old_H);
    Hamil_time(k) = old_H + delta;
    old_H = Hamil_time(k);
    Temp_time(k) = T;
    if old_H ==0
        break
    end
end

Hmin = min(Hamil_time);
nrIterations = k;
end

