function Jac = Jac_NR(node,Y,nPQ)              % calculating Jacobian matrix function
%% 
[nn,mn]=size(node);
%% 
H = zeros(nn-1,nn-1);
N = zeros(nn-1,nPQ);
J = zeros(nPQ,nn-1);
L = zeros(nPQ,nPQ);                            % dividing Jacobian function to 4 sub matrix
%% 
Qi = zeros(nn-1,1);                            % storing P and Q
Pi = zeros(nn-1,1);                         
%% 
for i = 1:nn-1                                 % initializing and calculating Pi and Qi
    for j = 1:nn
        Pi(i,1)=Pi(i,1)+node(i,2)*node(j,2)*(real(Y(i,j))*cos(node(i,3)-node(j,3))+imag(Y(i,j))*sin(node(i,3)-node(j,3)));
        Qi(i,1)=Qi(i,1)+node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
    end
end                            
%% 
for i = 1:nn-1                                 % exclude slack bus
    %% 
    for j = 1:nn-1                             % calculating H matrix
        %% 
        if i~=j                                
            H(i,j)=-node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
        else
            H(i,j)=Qi(i,1)+imag(Y(i,j))*((node(i,2))^2);
        end                         
        %% 
        if  j < nPQ+1                          % calculating N matrix
            if i~=j
                N(i,j)=-node(i,2)*node(j,2)*(real(Y(i,j))*cos(node(i,3)-node(j,3))+imag(Y(i,j))*sin(node(i,3)-node(j,3)));
            else
                N(i,j)=-Pi(i,1)-real(Y(i,j))*((node(i,2))^2);
            end
        end                           
        %% 
        if  i < nPQ+1                          % calculating J matrix 
            if i~=j
                J(i,j)=node(i,2)*node(j,2)*(real(Y(i,j))*cos(node(i,3)-node(j,3))+imag(Y(i,j))*sin(node(i,3)-node(j,3)));
            else
                J(i,j)=-Pi(i,1)+real(Y(i,j))*((node(i,2))^2);
            end                                               
            %% 
            if j < nPQ+1                        % calculating L matrix 
                if i~=j
                    L(i,j)=-node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
                else
                    L(i,j)=-Qi(i,1)+imag(Y(i,j))*((node(i,2))^2);
                end
            end            
        end
    end
end   
Jac = [H   N; J   L];                            % generating Jacobian matrix