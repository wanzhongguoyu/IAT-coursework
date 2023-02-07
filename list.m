function  dt=list()


% ID gender date block  pn true_key  judge_key judge_time

% ex_1 ex_2 test_1  test_2  ex_3   test_3   test_4
each_pic=5;
test_num=4;
group=2;
group_test=2;

global  ex_1 ex_2 test_1  test_2  ex_3   test_3   test_4 total_pic


ex_1=each_pic*test_num;
ex_2=each_pic*test_num;
test_1=each_pic*group*group_test;
test_2=each_pic*group*test_num;
ex_3=each_pic*test_num;
test_3=each_pic*group*group_test;
test_4=each_pic*group*test_num;
total_pic=ex_1+ex_2+test_1+test_2+ex_3+test_3+test_4;



prompt = {'ID:','Gender:'};
dlgtitle = 'ID and Gender';
dims = [1 20];

ID_gender= inputdlg(prompt,dlgtitle,dims);
ID=ID_gender{1,1};  Gender=ID_gender{2,1};

ID =str2double(ID)*ones(total_pic,1);
Gender=str2double(Gender)*ones(total_pic,1);
Date = repmat(datestr(now,30),(total_pic),1);

block=[ones(ex_1,1);ones(ex_2,1)+1;ones(test_1,1)+2;ones(test_2,1)+3;ones(ex_3,1)+4;ones(test_3,1)+5;ones(test_4,1)+6;];

ex_1_pic=[reshape(repmat(randperm(each_pic*2),2,1),[],1),randperm(ex_1)'];ex_1_pic=sortrows(ex_1_pic,2);ex_1_pic=ex_1_pic(:,1);
ex_2_pic=[reshape(repmat(randperm(each_pic*2)+10,2,1),[],1),randperm(ex_2)'];ex_2_pic=sortrows(ex_2_pic,2);ex_2_pic=ex_2_pic(:,1);

test_1_pic=randperm(test_1)';
test_2_pic=[reshape(repmat(randperm(each_pic*test_num),2,1),[],1),randperm(test_2)'];test_2_pic=sortrows(test_2_pic,2);test_2_pic=test_2_pic(:,1);

ex_3_pic=[reshape(repmat(randperm(each_pic*2)+10,2,1),[],1),randperm(ex_3)'];ex_3_pic=sortrows(ex_3_pic,2);ex_3_pic=ex_3_pic(:,1);

test_3_pic=randperm(test_1)';
test_4_pic=[reshape(repmat(randperm(each_pic*test_num),2,1),[],1),randperm(test_4)'];test_4_pic=sortrows(test_4_pic,2);test_4_pic=test_4_pic(:,1);


pn=[ex_1_pic;ex_2_pic;test_1_pic;test_2_pic;ex_3_pic;test_3_pic;test_4_pic];

true_key=zeros(total_pic,1);
judge_key=zeros(total_pic,1);
judge_time=zeros(total_pic,1);

dt=table(ID,Gender,Date,block,pn,true_key,judge_key,judge_time);

for i=1:size(dt,1)
    
    if dt.block(i)==1&&dt.pn(i)<=5
        dt.true_key(i)=1;
    elseif dt.block(i)==1&&dt.pn(i)>=6
        dt.true_key(i)=2;
    end
    
    
    if dt.block(i)==2&&dt.pn(i)<=15
        dt.true_key(i)=1;
    elseif dt.block(i)==2&&dt.pn(i)>=16
        dt.true_key(i)=2;
    end
    
    if dt.block(i)==3&&dt.pn(i)<=5
        dt.true_key(i)=1;
    elseif dt.block(i)==3&&dt.pn(i)<=10&&dt.pn(i)>5
        dt.true_key(i)=2;
    elseif dt.block(i)==3&&dt.pn(i)<=15&&dt.pn(i)>10
        dt.true_key(i)=1;
    elseif dt.block(i)==3&&dt.pn(i)<=20&&dt.pn(i)>15
        dt.true_key(i)=2;
    end
    if dt.block(i)==4&&dt.pn(i)<=5
        dt.true_key(i)=1;
    elseif dt.block(i)==4&&dt.pn(i)<=10&&dt.pn(i)>5
        dt.true_key(i)=2;
    elseif dt.block(i)==4&&dt.pn(i)<=15&&dt.pn(i)>10
        dt.true_key(i)=1;
    elseif dt.block(i)==4&&dt.pn(i)<=20&&dt.pn(i)>15
        dt.true_key(i)=2;
    end
    
    if dt.block(i)==5&&dt.pn(i)>=16
        dt.true_key(i)=1;
    elseif dt.block(i)==5&&dt.pn(i)<=15
        dt.true_key(i)=2;
    end
    
    if dt.block(i)==6&&dt.pn(i)<=5
        dt.true_key(i)=1;
    elseif dt.block(i)==6&&dt.pn(i)<=10&&dt.pn(i)>5
        dt.true_key(i)=2;
    elseif dt.block(i)==6&&dt.pn(i)<=15&&dt.pn(i)>10
        dt.true_key(i)=2;
    elseif dt.block(i)==6&&dt.pn(i)<=20&&dt.pn(i)>15
        dt.true_key(i)=1;
    end
    
    if dt.block(i)==7&&dt.pn(i)<=5
        dt.true_key(i)=1;
    elseif dt.block(i)==7&&dt.pn(i)<=10&&dt.pn(i)>5
        dt.true_key(i)=2;
    elseif dt.block(i)==7&&dt.pn(i)<=15&&dt.pn(i)>10
        dt.true_key(i)=2;
    elseif dt.block(i)==7&&dt.pn(i)<=20&&dt.pn(i)>15
        dt.true_key(i)=1;
    end
end

