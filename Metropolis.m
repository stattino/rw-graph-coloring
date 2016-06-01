function [x_new, delta] = Metropolis( x, q, G, Beta, old_H )
%METROPOLIS(x,q,G,Beta) Performs a metropolis algorithm iteration. 
%   Performs a metropolis iteration with hamiltonian defined in the
%   Hamiltonian help function. See Hamiltonian for more.
%   x - color vector, q - no of colors, G - adjacency matrix, Beta -
%   inverse temperature old_H - old hamiltonian

    [N,~] = size(x);
    x_new = x;
    inxX = randi(N);
    x_new(inxX) = randi(q); % Choose one vertice to change to a random colour
    xnewvalue = x_new(inxX);
    delta = dH2(G, xnewvalue, x, inxX);
    %delta = dH(G, x_new, old_H);
%     if delta2 ~= delta
%         disp('AHAHHAHHHHAHHA');
%     end
    if (delta <= 0 ) 
        x = x_new;
    elseif ( rand < exp(-Beta*delta) )
        x = x_new;
    else
        delta = 0;
    end
    x_new = x;
end

