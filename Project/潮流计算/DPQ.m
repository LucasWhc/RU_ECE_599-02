function [dP,dQ] =DPQ(Y,node,nPQ,nPV)   %  nPQ、nPV为相应节点个数
%% 
n = nPQ + nPV +1;                       % 总节点个数
%% 
dP = node(1:n-1,4);                     % 除平衡节点外，其余都有P
dQ = node(1:nPQ,5);                     % 对dP和dQ赋初值  PV节点不需计算dQ 平衡节点不参与计算
%% 
for i = 1:n-1                           % 利用循环计算求取dP和dQ，公式就是书上P115
    for j = 1:n
        dP(i,1) = dP(i,1)-node(i,2)*node(j,2)*(real(Y(i,j))*cos(node(i,3)-node(j,3))+imag(Y(i,j))*sin(node(i,3)-node(j,3)));
        if i<nPQ+1
            dQ(i,1) = dQ(i,1)-node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
        end
    end
end                                   