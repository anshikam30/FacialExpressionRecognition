% The Grayscale algorithm.

function Grayscale_image() 

% Define convergence threshold.
threshold = 0.01;

% Read the sunset image and convert the color image into grayscale image.
Im = imread('E:\Matlab\GCapsNet Multi-Feature Aware Pose and Geometry based Facial Expression Recognition using Deep Learning\Code\Proposed - GCapsNet\TestImages\InputImg.png');
Im = rgb2gray(Im);
Hist = imhist(Im,256)';

% Show the Grayscale results.
figure;
imshow(Im);
title('Grayscale image');


imwrite(Im,'E:\Matlab\GCapsNet Multi-Feature Aware Pose and Geometry based Facial Expression Recognition using Deep Learning\Code\Proposed - GCapsNet\facial.png')


