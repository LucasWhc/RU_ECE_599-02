function [U] = Gauss_Seidel(Y,node,nPQ,nPV)            % Gauss-Seidal function
%% 
[nn,mn]=size(node);
U=zeros(nn,1);                                         % initializing voltage matrix
Umax1=zeros(nn,1);                                     % Umax for storing bias each bus
Umax2=zeros(nn,1);
k=100;                                                 % number of iterations
%% 
for i=1:nn
    U(i,1) = 1;                                        % Initial guess
end
%% 
while k                                                % iteration
    for i=1:nn
        switch node(i,6)                               % switch for different bus type
            case 1                                     % 1 for PQ bus
               [U1] = PQ(i,U,node,Y,nPQ);              % PQ bus calculation
               U(i,1)=U1(i,1);                         % storing data in U matrix
               
            case 2                                     % 2 for PV bus
               [U2] = PV(i,U,node,Y,nPV);              % PV bus calculation
               U(i,1)=U2(i,1);
               
            case 3                                     % 3 for slack bus
               U(i,1)=node(i,2)*cos(node(i,3))-node(i,2)*sin(node(i,3))*sqrt(-1);
        end  
    end
        k=k-1;
end

                    
                    
                
                
        
                