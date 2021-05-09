function Y = Yij(node,line)
%% 
[nn,mn]=size(node);
[nl,ml]=size(line);
%% 
Y=zeros(nn,nn);                        % 对导纳矩阵赋初值0 
%% 
for k=1:nl    
    I=line(k,1);   
    J=line(k,2);    
    Zt=line(k,3)+j*line(k,4);          % 读入线路参数 
    if Zt~=0
        Yt=1/Zt;                       % 接地支路不计算Yt
    end
    Ym=line(k,5)+j*line(k,6);          % 计算G+B
    K=line(k,7);                       % 取变压器线路变比
    
    %% 
    if (K==0)&(J~=0)                   % 普通线路: K=0
        Y(I,I)=Y(I,I)+Yt+Ym;           % YII为自导纳
        Y(J,J)=Y(J,J)+Yt+Ym;           
        Y(I,J)=Y(I,J)-Yt;              % 互导纳
        Y(J,I)=Y(I,J);    
    end                                %求解导纳
    %% 
    if (K==0)&(J==0)                   % 对地支路: K=0,J=0,R=X=0
        Y(I,I)=Y(I,I)+Ym;              % 直接加到自导纳上
    end        
    %% 
    if K>0                             % 变压器线路:折算到i侧,K在j侧，参考书上P108        
        Y(I,I)=Y(I,I)+Yt+Ym;        
        Y(J,J)=Y(J,J)+Yt/K/K;        
        Y(I,J)=Y(I,J)-Yt/K;        
        Y(J,I)=Y(I,J);    
    end        
    %% 
    if K<0                             % 变压器线路:折算到j侧,K在i侧        
        Y(I,I)=Y(I,I)+Yt+Ym;        
        Y(J,J)=Y(J,J)+K*K*Yt;        
        Y(I,J)=Y(I,J)+K*Yt;        
        Y(J,I)=Y(I,J);    
    end
%disp(Y);    
end