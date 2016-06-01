function deltaH = dH2(G, xnewvalue, x_old, inxX)
%DH(G,x_old,x_new) Helpfunction to calc. diff of hamiltonian
%deltaH = Hamiltonian(G,x_new) - old_H;

conn = logical(G(:,inxX));
x_new = x_old;
Hnew = sum(xnewvalue == x_old(conn));
Hold = sum(x_old(inxX) == x_old(conn));
deltaH = Hnew - Hold;
end

