%%


c           = 10;
data.G      = generategraph(N,c);
data.xinit  = randi(q,N,1);
data.n      = 15000;
data.q      = 5;

[ Hmin, nrIterations ] = runMetopolis( data )
