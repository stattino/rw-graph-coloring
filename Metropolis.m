function x_new = Metropolis( x, q, G, Beta, old_H )
%METROPOLIS(x,q,G,Beta) performs a metropolis algorithm iteration. 
%   Performs a metropolis iteration with hamiltonian defined in the
%   Hamiltonian help function. See Hamiltonian for more.
%   x - color vector, q - no of colors, G - adjacency matrix, Beta -
%   inverse temperature

    [N,~] = size(x);
    x_new = x;
    x_new(randi(N)) = randi(q); 
    delta = dH(G,x_new,old_H);
    if (delta <= 0 )
        x = x_new;
    elseif ( rand < exp(-Beta*delta) )
        x = x_new;
    end
    x_new = x;
end

