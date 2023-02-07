function  IAT_judge1(i,SOT) 
global data aKey lKey qKey


KbWait;


[KeyisDown,secs,keyCode] = KbCheck;


if KeyisDown==1
    
    data.judge_time(i)=secs-SOT;
    
    if keyCode(aKey) == 1
        data.judge_key(i)=1;
        
    elseif keyCode(lKey) == 1
        data.judge_key(i)=2;
        
    elseif keyCode(qKey) == 1
        Screen('CloseAll');
    end
  

end