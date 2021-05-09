function [line] = OpenLine
[dfile,pathname]=uigetfile('*.m','Select Line File');   % selecting .m file for line information 
if pathname == 0  
    error(' you must select a valid data file')         % error warning for no file selected
else  
    lfile =length(dfile);                               % exclude .m  
    eval(dfile(1:lfile-2));                             % open file
end