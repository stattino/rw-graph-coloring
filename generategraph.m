function [ AdjMat ] = generategraph( N,c )
%GENERATEGRAPH generates a random Erd�s-R�nyi graph with N vertices and density c
% 1. Generates N independent vertices
% 2. Creates an edge with probability c/N between every pair of vertices.
% c>1.
AdjMat = rand(N,N);
AdjMat = real(AdjMat < c/N);
end

