function YtYm = YtYm_NR(line)         % 计算线路的等效Yt和Ym
[nl,ml]=size(line);
%% 
YtYm = zeros(nl,5);                   % 对YtYm矩阵赋初值0，和线路行数相同，共5列
YtYm(:,1:2) = line(:,1:2);            % 矩阵前两列为节点编号，后三列分别为线路等效Yt，i侧的等效Ym，j侧的等效Ym
j = sqrt(-1);                         % 用来代表i
%% 
for k=1:nl    
    I=line(k,1);     
    J=line(k,2);    
    Zt=line(k,3)+j*line(k,4);         % 读入线路参数
    if Zt~=0
        Yt=1/Zt;                      % 接地支路不计算Yt
    end
    Ym=line(k,5)+j*line(k,6);         % 计算G+B
    K=line(k,7);                      % 取变压器线路变比
    
    %% 
    if (K==0)&(J~=0)                 % 普通线路: K=0
        YtYm(k,3) = Yt;               
        YtYm(k,4) = Ym;
        YtYm(k,5) = Ym;
    end    
    %% 
    if (K==0)&(J==0)                 % 对地支路: K=0,J=0,R=X=0
        YtYm(k,4) = Ym;    
    end        
    %% 
    if K>0                           % 变压器线路: 参数折算到i侧,K在j侧，参考书上P108        
        YtYm(k,3) = Yt/K;        
        YtYm(k,4) = Ym+Yt*(K-1)/K;        
        YtYm(k,5) = Yt*(1-K)/K/K;    
    end 
    %% 
    if K<0                           % 变压器线路: 参数折算到j侧,K在i侧        
        YtYm(k,3) = -Yt*K;        
        YtYm(k,4) = Ym+Yt*(1+K);        
        YtYm(k,5) = Yt*(K^2+K);     
    end
end