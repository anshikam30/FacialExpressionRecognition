

I = imread('Normalized.png');
targetSize = [300 400];
r = centerCropWindow2d(size(I),targetSize);
J = imcrop(I,r);

imwrite(J,'E:\Matlab\GCapsNet Multi-Feature Aware Pose and Geometry based Facial Expression Recognition using Deep Learning\Code\Proposed - GCapsNet\seimg.png')

%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('seimg.png');

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;

 %To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);

BB=step(NoseDetect,I);

imshow(I);
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
end
title('Nose Detection');
hold off;

 %To detect Mouth
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);

BB=step(MouthDetect,I);

imshow(I);
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('Facial Detection');
hold off;

