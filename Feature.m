fprintf('\n%%%%%%----Low Level Feature Extraction----%%%%%%\n\n');
initImg = imread('InitSeg.png');
finalImg = imread('Frontalface.png');
layer = lstmLayer(100,'Name','GCapsNet');
inputSize = 12;
numHiddenUnits = 100;
numClasses = 2;
layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];
maxEpochs = 70;
miniBatchSize = 27;
R=finalImg(:,:,1);
G=finalImg(:,:,2);
B=finalImg(:,:,3);
options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',1, ...
    'Verbose',false, ...
    'Plots','training-progress');
outputSizeNet = [8 8 2048];
layers1 = [
    sequenceInputLayer(1,"Name","sequence")
    lstmLayer(128,"Name","GCapsNet")
    fullyConnectedLayer(10,"Name","fc")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","featureExtraction")];
Rchann=mean2(R);
Gchann=mean2(G);
Bchann=mean2(B);
fprintf('Color Feature\n');
fprintf('%f\n',Rchann,Gchann,Bchann);
proc = imbinarize(initImg,'adaptive');
bw = bwareafilt(proc,2);
bw = imfill(bw,'holes');
[out,LM] = bwferet(bw,'MinFeretProperties');
Diameter = out.MinDiameter(1);
L = length(proc);
m = size(proc,1);
n = size(proc,2);
T = 0;
for i = 1:m
    for j = 1:n
        temp = proc(i,j)./(1+(i-j).^2);
        T = T+temp;
    end
end
ThicknessVal = double(T);
fprintf('\nStatistical Feature\nDiameter %0.2f',Diameter);
fprintf('\nLength %0.2f',L);
fprintf('\nThickness %0.2f',ThicknessVal);
a = sum(double(proc(:)));
shapeFeature = 1-(1/(1+a));
textureFeature = bwarea(proc);
fprintf('\n\nShape Feature\n%s\n',shapeFeature);
fprintf('\nTexture Feature\n%0.2s\n',textureFeature);
pause(3);
msgbox('Color, statistical, shape and texture feature extraction is completed');
