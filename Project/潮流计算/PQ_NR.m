function node = PQ_NR(node,Y,nPQ,nPV)                  % 计算功率注入
%% 
n = nPQ+nPV+1;                                         % n为总节点数
%% 
for i = nPQ+1:n-1                                      % 利用公式计算PV节点的无功注入
    for j = 1:n
        node(i,5)=node(i,5)+node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
    end
end                   
%% 
for j =1:n                                             % 计算平衡节点的无功及有功注入
    node(n,4)=node(n,4)+node(n,2)*node(j,2)*(real(Y(n,j))*cos(node(n,3)-node(j,3))+imag(Y(n,j))*sin(node(n,3)-node(j,3)));
    node(n,5)=node(n,5)+node(n,2)*node(j,2)*(real(Y(n,j))*sin(node(n,3)-node(j,3))-imag(Y(n,j))*cos(node(n,3)-node(j,3)));
end                   