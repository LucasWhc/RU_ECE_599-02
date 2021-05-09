function s_result = S_result(node,line,YtYm)                  % 计算功率分布，主要参考P108变压器的等值电路图
%% 
[nl,ml]=size(line);
s_result = zeros(nl,7);                                       % 储存线路潮流计算结果
s_result(:,1:2) = line(:,1:2);                                % 前两列为节点
%% 
for k=1:nl
    I = s_result(k,1);
    J = s_result(k,2);                                        % 储存节点
    %%                                     
    if (J~=0)&(I~=0)                                          % 计算非接地支路的潮流，分别计算i侧的功率和j侧的功率然后求和
        s_result(k,3)=node(I,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,4)))-node(I,2)*node(J,2)*(cos(node(I,3))+j*sin(node(I,3)))*(conj(cos(node(J,3))+j*sin(node(J,3))))*conj(YtYm(k,3));
        s_result(k,4)=node(J,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,5)))-node(I,2)*node(J,2)*(conj(cos(node(I,3))+j*sin(node(I,3))))*(cos(node(J,3))+j*sin(node(J,3)))*conj(YtYm(k,3));
        s_result(k,5)=s_result(k,3) + s_result(k,4);
        s_result(k,6)=node(I,2)*(cos(node(I,3))+j*sin(node(I,3)))*(YtYm(k,3)+YtYm(k,4))-node(J,2)*(cos(node(J,3))+j*sin(node(J,3)))*YtYm(k,3);
        s_result(k,7)=node(J,2)*(cos(node(J,3))+j*sin(node(J,3)))*(YtYm(k,3)+YtYm(k,5))-node(I,2)*(cos(node(I,3))+j*sin(node(I,3)))*YtYm(k,3);
    elseif J==0                                               % 利用公式计算接地支路的潮流，上面是i侧，下面是j侧
        s_result(k,3)=node(I,2)^2*conj(YtYm(k,4));
        s_result(k,5)=s_result(k,3)+s_result(k,4);
        s_result(k,6)=node(I,2)*(cos(node(I,3))+j*sin(node(I,3)))*YtYm(k,4);
    else
        s_result(k,4)=node(J,2)^2*conj(YtYm(k,5));
        s_result(k,5)=s_result(k,3)+s_result(k,4);
        s_result(k,7)=node(J,2)*(cos(node(J,3))+j*sin(node(J,3)))*YtYm(k,5);
    end
end