%%^^^^^^^^^^^^author: jagadeesh
%%^^^^^^^^^^^mail id: g.jagadeesh458@gmail.com
%^^^^^^^project: face and noise and eye detection for matlab image
%processing tool box
clear all
clc
close all

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('Frontalface.png');

%Returns Bounding Box values based on number of objects
face_dtect = step(FDetect,I);
imshow(I); 
for i = 1:size(face_dtect,1)
    rectangle('Position',face_dtect(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','m');
end
title('Face Detection');
hold off;
for i=1:size(v,2)
    z=[z,norm(cv(i,:)-s,2)];
    if(rem(i,20)==0),imshow(reshape(v(:,i),112,92)),end;
    drawnow;
end

[a,i]=min(z);
subplot(122);
imshow(reshape(v(:,i),112,92));title('Found!','FontWeight','bold','Fontsize',16,'color','red');



%%%To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);



face_dtect=step(NoseDetect,I);

imshow(I); 
for i = 1:size(face_dtect,1)
    rectangle('Position',face_dtect(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','m');
end
title('Nose Detection');
hold off;



%To detect Mouth
mouth_detect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);

face_dtect=step(mouth_detect,I);

imshow(I); 
for i = 1:size(face_dtect,1)
 rectangle('Position',face_dtect(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('Mouth Detection');
hold off;