function [dP,dQ] =DPQ(Y,node,nPQ,nPV)   %  nPQ��nPVΪ��Ӧ�ڵ����
%% 
n = nPQ + nPV +1;                       % �ܽڵ����
%% 
dP = node(1:n-1,4);                     % ��ƽ��ڵ��⣬���඼��P
dQ = node(1:nPQ,5);                     % ��dP��dQ����ֵ  PV�ڵ㲻�����dQ ƽ��ڵ㲻�������
%% 
for i = 1:n-1                           % ����ѭ��������ȡdP��dQ����ʽ��������P115
    for j = 1:n
        dP(i,1) = dP(i,1)-node(i,2)*node(j,2)*(real(Y(i,j))*cos(node(i,3)-node(j,3))+imag(Y(i,j))*sin(node(i,3)-node(j,3)));
        if i<nPQ+1
            dQ(i,1) = dQ(i,1)-node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
        end
    end
end                                   