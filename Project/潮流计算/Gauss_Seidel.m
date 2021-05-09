function [U] = Gauss_Seidel(Y,node,nPQ,nPV)            % ��˹���¶��������ѹ
%% 
[nn,mn]=size(node);
U=zeros(nn,1);                                         % ȡ���ڵ�������ʼ���ڵ��ѹ����
Umax1=zeros(nn,1);                                     % �趨Umax������ÿ������������
Umax2=zeros(nn,1);
k=100;                                                 % ��k������while����
%% 
for i=1:nn
    U(i,1) = 1;                                        % ��ֵ��Ϊ1
end
%% 
while k                                                % k��Ϊ0�ͼ�������
    for i=1:nn
        switch node(i,6)                               % �жϽڵ����� 
            case 1                                     % 1ΪPQ�ڵ�
               [U1] = PQ(i,U,node,Y,nPQ);              % ����PQ�ӳ�����
               U(i,1)=U1(i,1);                         % ��ֵ�ŵ�U������
               
            case 2                                     % 2ΪPV�ڵ�
               [U2] = PV(i,U,node,Y,nPV);              % ����PV�ӳ�����
               U(i,1)=U2(i,1);
               
            case 3                                     % 3Ϊƽ��ڵ㣬����
               U(i,1)=node(i,2)*cos(node(i,3))-node(i,2)*sin(node(i,3))*sqrt(-1);
        end  
    end
        k=k-1;
end

                    
                    
                
                
        
                