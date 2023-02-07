function  IAT_judge2(i,SOT) 


global data aKey lKey qKey

while data.true_key(i)~=data.judge_key(i)
IAT_pic(i);
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

end