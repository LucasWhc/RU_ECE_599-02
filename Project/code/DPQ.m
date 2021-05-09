function [dP,dQ] =DPQ(Y,node,nPQ,nPV)   %  nPQ¡¢nPV is the number of coressponding buses
%% 
n = nPQ + nPV +1;                       % calculating total buses number
%% 
dP = node(1:n-1,4);                     % Except slack bus, other buses do have power
dQ = node(1:nPQ,5);                     % Initializing dP and dQ  For PV, dQ is not needed, no slack bus
%% 
for i = 1:n-1                           % Calculating dP and dQ
    for j = 1:n
        dP(i,1) = dP(i,1)-node(i,2)*node(j,2)*(real(Y(i,j))*cos(node(i,3)-node(j,3))+imag(Y(i,j))*sin(node(i,3)-node(j,3)));
        if i<nPQ+1
            dQ(i,1) = dQ(i,1)-node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
        end
    end
end                                   