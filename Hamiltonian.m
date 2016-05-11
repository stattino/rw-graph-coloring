function H = Hamiltonian( G, x )
%HAMILTONIAN(G,x) calculates the cost of the vector x on the adjacency matrix G
%   G   (N x N) adjacency matrix for the underlying vertices
%   x   (N x 1) color vector for vertices
[N, ~] = size(x);
X_mat = repmat(x,1,N);
X_bool = real(X_mat' == X_mat);
X = X_bool .* G;
H = sum(sum(X))/2;
end

