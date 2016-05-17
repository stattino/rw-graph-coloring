function AdjMat = generategraph( N,c )
%GENERATEGRAPH(N,c) generates a random Erdös-Rényi graph with N vertices and density c
% 1. Generates N independent vertices
% 2. Creates an edge with probability c/N between every pair of vertices.
% c>1.
AdjMat = rand(N,N);
U = triu(AdjMat,1);
AdjMat = U + U' + eye(N);%+ diag(diag(AdjMat));
AdjMat = real(AdjMat < c/N);
end

