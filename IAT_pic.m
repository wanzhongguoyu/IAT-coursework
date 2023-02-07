function SOT=IAT_pic(i)

global  data  winPt    maketesture_material  screen_left1 screen_right1  screen_left2 screen_right2

global maketesture_judge   screen_judge

global screen_wrong

if data.block(i)==1
    Screen('DrawTextures',winPt,maketesture_material(3),[],screen_left1);
    Screen('DrawTextures',winPt,maketesture_material(4),[],screen_right1);
elseif  data.block(i)==2
    Screen('DrawTextures',winPt,maketesture_material(6),[],screen_left1);
    Screen('DrawTextures',winPt,maketesture_material(5),[],screen_right1);
    
    
elseif  data.block(i)==3||data.block(i)==4
    Screen('DrawTextures',winPt,maketesture_material(3),[],screen_left1);
    Screen('DrawTextures',winPt,maketesture_material(6),[],screen_left2);
    Screen('DrawTextures',winPt,maketesture_material(4),[],screen_right1);
    Screen('DrawTextures',winPt,maketesture_material(5),[],screen_right2);
    
elseif data.block(i)==5
    Screen('DrawTextures',winPt,maketesture_material(5),[],screen_left1);
    Screen('DrawTextures',winPt,maketesture_material(6),[],screen_right1);
    
elseif  data.block(i)==6||data.block(i)==7
    Screen('DrawTextures',winPt,maketesture_material(3),[],screen_left1);
    Screen('DrawTextures',winPt,maketesture_material(5),[],screen_left2);
    Screen('DrawTextures',winPt,maketesture_material(4),[],screen_right1);
    Screen('DrawTextures',winPt,maketesture_material(6),[],screen_right2);
    
end
Screen('DrawTextures',winPt,maketesture_judge(1,data.pn(i)),[],screen_judge);

if data.judge_time(i)~=0&&data.true_key(i)~=data.judge_key(i)
Screen('DrawTextures',winPt,maketesture_material(7),[],screen_wrong);
end

SOT=Screen('Flip',winPt);

