function YtYm = YtYm_NR(line)         % function for calculating Yt and Ym
[nl,ml]=size(line);
%% 
YtYm = zeros(nl,5);                   % creating YtYm matrix
YtYm(:,1:2) = line(:,1:2);            % first two column for bus number£¬last three columns for Yt
j = sqrt(-1);                         % j value
%% 
for k=1:nl    
    I=line(k,1);     
    J=line(k,2);    
    Zt=line(k,3)+j*line(k,4);         % reading line info
    if Zt~=0
        Yt=1/Zt;                      % line connected to ground does not add Yt
    end
    Ym=line(k,5)+j*line(k,6);         % calculating G+B
    K=line(k,7);                      % get transformers K
    
    %% 
    if (K==0)&(J~=0)                 % normal line: K=0
        YtYm(k,3) = Yt;               
        YtYm(k,4) = Ym;
        YtYm(k,5) = Ym;
    end    
    %% 
    if (K==0)&(J==0)                 % line connected to the ground: K=0,J=0,R=X=0
        YtYm(k,4) = Ym;    
    end        
    %% 
    if K>0                           % transformers line for K>0
        YtYm(k,3) = Yt/K;        
        YtYm(k,4) = Ym+Yt*(K-1)/K;        
        YtYm(k,5) = Yt*(1-K)/K/K;    
    end 
    %% 
    if K<0                           % transformers line for K<0  
        YtYm(k,3) = -Yt*K;        
        YtYm(k,4) = Ym+Yt*(1+K);        
        YtYm(k,5) = Yt*(K^2+K);     
    end
end