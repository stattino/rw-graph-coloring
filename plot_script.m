%% Plotting script

% Some selected colors, and a c-range that makes them interesting for a 
% 400 x 400 graph.
load('plot_res','cvec');
q_vec = [3,5,7];
c_vec = cvec;%[13,18,20,24];% logspace(0,log10(16),10)+0.01;
N = 400;

Hmin_res = zeros(length(q_vec),length(c_vec));
iter_res = zeros(length(q_vec),length(c_vec));
for j = 1:length(q_vec)
    fprintf('q: %d of %d', j, length(q_vec))
    fprintf('\n')
    for i = 1:length(c_vec)
        fprintf('      c: %d of %d', i, length(c_vec))
        c           = c_vec(i);
        data.G      = generategraph(N,c);
        data.xinit  = randi(q_vec(j),N,1);
        data.n      = 15000;
        data.q      = q_vec(j);
        data.temp   = 0;

        [ Hmin, nrIterations ] = runMetopolis(data);
        Hmin_res(j,i) = Hmin;
        iter_res(j,i) = nrIterations;
        fprintf('   ^_^  Hmin: %d', Hmin)
        fprintf('\n')

    end
end
