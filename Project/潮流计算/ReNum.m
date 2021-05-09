function [node,line] = ReNum(node,line,nodenum)         % 用来恢复编码
%% 
[nn,mn]=size(node);
[nl,ml]=size(line);
node_temp = zeros(nn,mn);                               % 暂时存放用的矩阵
k = 1;                                                  % node_temp矩阵用于临时存放bus矩阵的数据
%% 
for i = 1 :nn                                           % 利用node矩阵的首列编号重新对node矩阵排序并存入node_temp矩阵中
    for j = 1 : nn
        if node(j,1) == k
            node_temp(k,:) = node(j,:);
            k = k + 1;
        end
    end
end
%% 
node = node_temp;                                       % 重新赋值回node
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
end                                                     % 恢复line的编号