function im()
% ����ʵ�����
global winPt  maketesture_material maketesture_judge




dis_picture_material= dir([cd,'\pic_material','\*.jpg']);  %ʵ�����
for i = 1:length(dis_picture_material)
    Path_picture_material{i}=[cd,'\pic_material\',dis_picture_material(i).name];
    im_material{i} =imread(Path_picture_material{1,i});
    maketesture_material(i)= Screen('MakeTexture',winPt,im_material{1,i});
end


dis_picture_judge = dir([cd,'\pic_judge','\*.jpg']);  % �ж�ͼƬ
for i = 1:length(dis_picture_judge)
    Path_picture_judge{i}=[cd,'\pic_judge\',dis_picture_judge(i).name]; %#ok<*SAGROW>
    im_judge{i} =imread(Path_picture_judge{1,i});
    maketesture_judge(i)= Screen('MakeTexture',winPt,im_judge{1,i});
end



