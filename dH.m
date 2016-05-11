function deltaH = dH(G, x_old,x_new )
%DH(G,x_old,x_new) Helpfunction to calc. diff of hamiltonian
deltaH = Hamiltonian(G,x_new) - Hamiltonian(G,x_old);
end

