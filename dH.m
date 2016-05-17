function deltaH = dH(G, x_new, old_H)
%DH(G,x_old,x_new) Helpfunction to calc. diff of hamiltonian
deltaH = Hamiltonian(G,x_new) - old_H;
end

