function [node,line] = ReNum(node,line,nodenum)         % �����ָ�����
%% 
[nn,mn]=size(node);
[nl,ml]=size(line);
node_temp = zeros(nn,mn);                               % ��ʱ����õľ���
k = 1;                                                  % node_temp����������ʱ���bus���������
%% 
for i = 1 :nn                                           % ����node��������б�����¶�node�������򲢴���node_temp������
    for j = 1 : nn
        if node(j,1) == k
            node_temp(k,:) = node(j,:);
            k = k + 1;
        end
    end
end
%% 
node = node_temp;                                       % ���¸�ֵ��node
%% 
for i=1:nl      
    for j=1:2          
        for k=1:nn              
            if  line(i,j)==nodenum(k,1)
                line(i,j)=nodenum(k,2);                 
                break              
            end          
        end      
    end  
end                                                     % �ָ�line�ı��