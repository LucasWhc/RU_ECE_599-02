function [node] = OpenNode
[dfile,pathname]=uigetfile('*.m','Select Node File');   % selecting .m file for bus information 
if pathname == 0  
    error(' you must select a valid data file')         % error warning for no file selected
else  
    lfile =length(dfile);                               % exclude .m
    eval(dfile(1:lfile-2));                             % open file
end