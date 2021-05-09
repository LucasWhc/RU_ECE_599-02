function [node,line,nPQ,nPV,nodenum,PH,PV,PQ] = Num(node,line)
%% 
[nn,mn]=size(node);             % get number of buses and number of lines
[nl,ml]=size(line);
%% 
nPH = 0;                        % nPH is the number of slack bus
nPV = 0;                        % nPV is the number of PV bus 
nPQ = 0;                        % nPQ is the number of PQ bus
%% 
for i = 1:nn,                   % nb is the number of buses    
    type= node(i,6);            % check bus type
    if type == 3,       
        nPH = nPH + 1;          % record numbers
        PH(nPH,:)=node(i,:);    % matrix PH for calculating and storing Slack bus   
    elseif type == 2,        
        nPV = nPV +1;       
        PV(nPV,:)=node(i,:);    % matrix PV for calculating and storing PV bus   
    else        
        nPQ = nPQ + 1;      
        PQ(nPQ,:)=node(i,:);    % matrix PQ for calculating and storing PQ bus    
    end  
end
%% 
node=[PQ;PV;PH];                % reorganizing node matrix by bus type
nodenum=[[1:nn]' node(:,1)];    % generating new to old map
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
end                             % reorganizing line matrix through new to old map