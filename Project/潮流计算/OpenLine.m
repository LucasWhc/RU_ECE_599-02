function [line] = OpenLine
[dfile,pathname]=uigetfile('*.m','Select Line File');   % 数据文件类型为m文件，窗口标题为“Select Line File”
if pathname == 0  
    error(' you must select a valid data file')         % 如果没有选择有效文件，则出现错误提示
else  
    lfile =length(dfile);                               % 去除文件后缀  
    eval(dfile(1:lfile-2));                             % 打开文件
end