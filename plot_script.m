%%

q_vec = [3,5,7];
c_vec = 1:2:16;

Hmin_res = zeros(length(q_vec),length(c_vec));
iter_res = zeros(length(q_vec),length(c_vec));
for j = 1:length(q_vec)
    for i = 1:length(c_vec)
        c           = c_vec(i);
        data.G      = generategraph(N,c);
        data.xinit  = randi(q,N,1);
        data.n      = 15000;
        data.q      = q_vec(j);
        data.temp   = 1;

        [ Hmin, nrIterations ] = runMetopolis(data);
        Hmin_res(j,i) = Hmin;
        iter_res(j,i) = nrIterations;
    end
end
