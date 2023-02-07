function print_pic_material(i,screen_full,time)

global winPt   maketesture_material

Screen('DrawTextures',winPt,maketesture_material(1,i),[],screen_full);
Screen('Flip',winPt);
pause(time);

if i==1
    
KbWait([],2);
end

if i>8
KbWait([],2);
end