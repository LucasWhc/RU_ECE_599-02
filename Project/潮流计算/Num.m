function [node,line,nPQ,nPV,nodenum,PH,PV,PQ] = Num(node,line)
%% 
[nn,mn]=size(node);             % ��ȡnb��nl
[nl,ml]=size(line);
%% 
nPH = 0;                        % nPHΪƽ��ڵ����  
nPV = 0;                        % nPVΪPV�ڵ����  
nPQ = 0;                        % nPQΪPQ�ڵ����  
%% 
for i = 1:nn,                   % nbΪ�ܽڵ���    
    type= node(i,6);            % �жϽڵ�����
    if type == 3,       
        nPH = nPH + 1;          % ��¼����
        PH(nPH,:)=node(i,:);    % ����PH���㲢����ƽ��ڵ�    
    elseif type == 2,        
        nPV = nPV +1;       
        PV(nPV,:)=node(i,:);    % ����PV���㲢����PV�ڵ�    
    else        
        nPQ = nPQ + 1;      
        PQ(nPQ,:)=node(i,:);    % ����PQ���㲢����PQ�ڵ�    
    end  
end
%% 
node=[PQ;PV;PH];                % ��node����PQ��PV��ƽ��ڵ��˳����������
nodenum=[[1:nn]' node(:,1)];    % �����¾ɽڵ���ձ�
%%                          
for i=1:nl      
    for j=1:2          
        for k=1:nn              
            if  line(i,j)==nodenum(k,2)
                line(i,j)=nodenum(k,1);                 
                break              
            end          
        end      
    end  
end                             % �������Ժ�Ľڵ�˳���line�������±��