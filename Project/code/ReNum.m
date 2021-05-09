function [node,line] = ReNum(node,line,nodenum)         % new to old map function
%% 
[nn,mn]=size(node);
[nl,ml]=size(line);
node_temp = zeros(nn,mn);                               % temp matrix
k = 1;                                                  % node_temp for storing bus function
%% 
for i = 1 :nn                                           % mapping
    for j = 1 : nn
        if node(j,1) == k
            node_temp(k,:) = node(j,:);
            k = k + 1;
        end
    end
end
%% 
node = node_temp;                                       % reorganizing node matrix
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
end                                                     % reorganizing line matrix