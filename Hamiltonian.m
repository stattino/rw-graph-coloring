function H = Hamiltonian( G, x)
%HAMILTONIAN(G,x) calculates the cost of the vector x on the adjacency matrix G
%   G   (N x N) adjacency matrix for the underlying vertices
%   x   (N x 1) color vector for vertices
H = 0;
[N, ~] = size(x);
for i = 1:N
   for j = i:N
       if (G(i,j)==1 && x(i)==x(j))
           H = H + 1;
       end
   end
end

end

