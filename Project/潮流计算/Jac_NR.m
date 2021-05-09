function Jac = Jac_NR(node,Y,nPQ)              % 计算雅可比矩阵
%% 
[nn,mn]=size(node);
%% 
H = zeros(nn-1,nn-1);
N = zeros(nn-1,nPQ);
J = zeros(nPQ,nn-1);
L = zeros(nPQ,nPQ);                            % 将雅克比矩阵分四块，书上P117
%% 
Qi = zeros(nn-1,1);                            % 设定存储Q和P的矩阵
Pi = zeros(nn-1,1);                         
%% 
for i = 1:nn-1                                 % 初始化并计算Qi和Pi，书上P115页公式
    for j = 1:nn
        Pi(i,1)=Pi(i,1)+node(i,2)*node(j,2)*(real(Y(i,j))*cos(node(i,3)-node(j,3))+imag(Y(i,j))*sin(node(i,3)-node(j,3)));
        Qi(i,1)=Qi(i,1)+node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
    end
end                            
%% 
for i = 1:nn-1                                 % 去平衡节点
    %% 
    for j = 1:nn-1                             % 分别计算H矩阵的对角及非对角元素
        %% 
        if i~=j                                
            H(i,j)=-node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
        else
            H(i,j)=Qi(i,1)+imag(Y(i,j))*((node(i,2))^2);
        end                         
        %% 
        if  j < nPQ+1                          % 分别计算N矩阵的对角及非对角元素 
            if i~=j
                N(i,j)=-node(i,2)*node(j,2)*(real(Y(i,j))*cos(node(i,3)-node(j,3))+imag(Y(i,j))*sin(node(i,3)-node(j,3)));
            else
                N(i,j)=-Pi(i,1)-real(Y(i,j))*((node(i,2))^2);
            end
        end                           
        %% 
        if  i < nPQ+1                          % 分别计算J矩阵的对角及非对角元素
            if i~=j
                J(i,j)=node(i,2)*node(j,2)*(real(Y(i,j))*cos(node(i,3)-node(j,3))+imag(Y(i,j))*sin(node(i,3)-node(j,3)));
            else
                J(i,j)=-Pi(i,1)+real(Y(i,j))*((node(i,2))^2);
            end                                               
            %% 
            if j < nPQ+1                        % 分别计算L矩阵的对角及非对角元素 
                if i~=j
                    L(i,j)=-node(i,2)*node(j,2)*(real(Y(i,j))*sin(node(i,3)-node(j,3))-imag(Y(i,j))*cos(node(i,3)-node(j,3)));
                else
                    L(i,j)=-Qi(i,1)+imag(Y(i,j))*((node(i,2))^2);
                end
            end            
        end
    end
end   
Jac = [H   N; J   L];                            % 生成雅克比矩阵，上面是H和N，下面是J和L