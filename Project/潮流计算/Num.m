function [node,line,nPQ,nPV,nodenum,PH,PV,PQ] = Num(node,line)
%% 
[nn,mn]=size(node);             % 获取nb和nl
[nl,ml]=size(line);
%% 
nPH = 0;                        % nPH为平衡节点个数  
nPV = 0;                        % nPV为PV节点个数  
nPQ = 0;                        % nPQ为PQ节点个数  
%% 
for i = 1:nn,                   % nb为总节点数    
    type= node(i,6);            % 判断节点类型
    if type == 3,       
        nPH = nPH + 1;          % 记录个数
        PH(nPH,:)=node(i,:);    % 矩阵PH计算并储存平衡节点    
    elseif type == 2,        
        nPV = nPV +1;       
        PV(nPV,:)=node(i,:);    % 矩阵PV计算并储存PV节点    
    else        
        nPQ = nPQ + 1;      
        PQ(nPQ,:)=node(i,:);    % 矩阵PQ计算并储存PQ节点    
    end  
end
%% 
node=[PQ;PV;PH];                % 对node矩阵按PQ、PV、平衡节点的顺序重新排序
nodenum=[[1:nn]' node(:,1)];    % 生成新旧节点对照表
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
end                             % 按排序以后的节点顺序对line矩阵重新编号