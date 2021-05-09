function YtYm = YtYm_NR(line)         % ������·�ĵ�ЧYt��Ym
[nl,ml]=size(line);
%% 
YtYm = zeros(nl,5);                   % ��YtYm���󸳳�ֵ0������·������ͬ����5��
YtYm(:,1:2) = line(:,1:2);            % ����ǰ����Ϊ�ڵ��ţ������зֱ�Ϊ��·��ЧYt��i��ĵ�ЧYm��j��ĵ�ЧYm
j = sqrt(-1);                         % ��������i
%% 
for k=1:nl    
    I=line(k,1);     
    J=line(k,2);    
    Zt=line(k,3)+j*line(k,4);         % ������·����
    if Zt~=0
        Yt=1/Zt;                      % �ӵ�֧·������Yt
    end
    Ym=line(k,5)+j*line(k,6);         % ����G+B
    K=line(k,7);                      % ȡ��ѹ����·���
    
    %% 
    if (K==0)&(J~=0)                 % ��ͨ��·: K=0
        YtYm(k,3) = Yt;               
        YtYm(k,4) = Ym;
        YtYm(k,5) = Ym;
    end    
    %% 
    if (K==0)&(J==0)                 % �Ե�֧·: K=0,J=0,R=X=0
        YtYm(k,4) = Ym;    
    end        
    %% 
    if K>0                           % ��ѹ����·: �������㵽i��,K��j�࣬�ο�����P108        
        YtYm(k,3) = Yt/K;        
        YtYm(k,4) = Ym+Yt*(K-1)/K;        
        YtYm(k,5) = Yt*(1-K)/K/K;    
    end 
    %% 
    if K<0                           % ��ѹ����·: �������㵽j��,K��i��        
        YtYm(k,3) = -Yt*K;        
        YtYm(k,4) = Ym+Yt*(1+K);        
        YtYm(k,5) = Yt*(K^2+K);     
    end
end