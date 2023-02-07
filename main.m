% main
clear;clc
AssertOpenGL;
Screen('Preference', 'SkipSyncTests',1);
Screen('Preference','VisualDebugLevel',3);
Screen('Preference','SuppressAllWarnings',1);


global k data t1 t3 aKey lKey qKey 

data=list();

k=1;
t1=5*k;  % 指导语时间
t2=(rand(1)/2+0.5)*k; % 注视点时间
t3=1*k; % relax 时间

KbName('UnifyKeyNames');
aKey= KbName('A');
lKey= KbName('L');
qKey= KbName('Q');

% [winPt,winRect] = Screen('OpenWindow',0,[125,125,125]);
% HideCursor
global winPt 
[winPt,winRect] = Screen('OpenWindow',0,[125,125,125],[0,0,1920,1080]);  % [clicks,x,y,whichButton] =GetClicks();
Xmax=winRect(3);
Ymax=winRect(4);

global    screen_left1 screen_left2 screen_right1 screen_right2 screen_judge screen_wrong
screen_full=[0 0 Xmax Ymax];
screen_left1=[0 0 0.16*Xmax 0.16*Ymax];  % 左上1
screen_left2=[0 0.16*Ymax 0.16*Xmax 0.32*Ymax]; % 左上2

screen_right1=[0.84*Xmax 0 Xmax 0.16*Ymax];  % 右上1
screen_right2=[0.84*Xmax 0.16*Ymax Xmax 0.32*Ymax];  % 右上2

screen_judge=[(0.5*Xmax-200) (0.5*Ymax-150) (0.5*Xmax+200) (0.5*Ymax+150) ];  % 判断图片
screen_wrong=[848,843,1073,968];  % 错误

im();
global  ex_1 ex_2 test_1  test_2  ex_3   test_3   test_4 total_pic


for i=1:total_pic
    if i==1
        print_pic_material(1,screen_full,t1); %指导语1
    elseif i==ex_1+1
        print_pic_material(9,screen_full,t1); %指导语2
    elseif i==ex_1+1+ex_2
        print_pic_material(10,screen_full,t1); %指导语3
    elseif i==ex_1+1+ex_2+test_1
        print_pic_material(11,screen_full,t1); %指导语4
    elseif i==ex_1+1+ex_2+test_1+test_2
        print_pic_material(12,screen_full,t1); %指导语5
    elseif i==ex_1+1+ex_2+test_1+test_2+ex_3
        print_pic_material(13,screen_full,t1); %指导语6
    elseif i==ex_1+1+ex_2+test_1+test_2+ex_3+test_3
        print_pic_material(14,screen_full,t1); %指导语7
    end
    
    print_pic_material(2,screen_full,(rand(1)/2+0.5)*k); %注视点
    SOT=IAT_pic(i);
    IAT_judge1(i,SOT) ;
    IAT_judge2(i,SOT);
    
    if i==ex_1+1+ex_2+test_1+test_2+ex_3+test_3+test_4
        print_pic_material(15,screen_full,t1); %结束
    end
    
end


Path = [cd,'\'];
ID=data.ID(1);
mkdir([Path,'D',num2str(ID(1))]);
writetable(data,[Path,'D',num2str(ID(1)),'\',num2str(ID(1)),'Dt.xlsx']);

Screen('CloseAll');