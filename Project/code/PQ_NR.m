function node = PQ_NR(node,Y,nPQ,nPV)                  % calculating injecting power
%% 
n = nPQ+nPV+1;                                         % n is the number of all buses
%% 
for i = nPQ+1:n-1                                      % calculating PV buses' reactive power Q
    for j = 1:n
        node(i,5)=node(i,5)+node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
    end
end                   
%% 
for j =1:n                                             % calculating injecting power for slack bus
    node(n,4)=node(n,4)+node(n,2)*node(j,2)*(real(Y(n,j))*cos(node(n,3)-node(j,3))+imag(Y(n,j))*sin(node(n,3)-node(j,3)));
    node(n,5)=node(n,5)+node(n,2)*node(j,2)*(real(Y(n,j))*sin(node(n,3)-node(j,3))-imag(Y(n,j))*cos(node(n,3)-node(j,3)));
end                   