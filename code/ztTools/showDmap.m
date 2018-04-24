% created by lhl
clear;
clc;
mydir=uigetdir('/Users/ling/Desktop/','ѡ��һ��Ŀ¼');
if mydir(end)~='/'
 mydir=[mydir,'/'];
end
cd(mydir);

subDIRS = dir(mydir);

checkDIRS = ['/Users/ling/Desktop/','showMap','/'];
if ~exist(checkDIRS,'dir')
     mkdir(checkDIRS); % ��������
end 


for i = 1 : length(subDIRS)    
    if( isequal(subDIRS(i).name, '.' )||...
        isequal(subDIRS(i).name, '..')||...
        isequal(subDIRS(i).name, '.DS_Store')||...
        ~subDIRS(i).isdir)               % �������Ŀ¼������
        continue;
    end
    
    dir_name = [mydir, subDIRS(i).name,'/'];
    display(dir_name);
    DIRS = dir([dir_name,'*.txt']);
    n = length(DIRS);
    display(n);
    
    check_path=[checkDIRS,subDIRS(i).name,'/'];
    if ~exist(check_path,'dir')
        mkdir(check_path); % ��������
    end
  
    for k=1:n
        d_name = [dir_name,DIRS(k).name];
        dmap=load(d_name);
        imagesc(dmap);hold on;
        S = regexp(DIRS(k).name, '.txt', 'split');
        name = char(S(1));
        index = name(1:11);
        save_name1 = [index,'.jpg'];
        save_name = fullfile(check_path,save_name1);

        saveas(gcf,save_name);
        hold off;
        close(figure(gcf));
        
    end
end