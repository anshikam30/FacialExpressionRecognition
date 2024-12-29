inputImg = imread('InitSeg.png');
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
figure
proc = imbinarize(inputImg);
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
plot(layerGraph(layers1));
title('Graph-based Capsule Neural Network (GCapsNet)');
TextureFeature = bwarea(proc);
fprintf('\n%%%%%%----High Level Feature Extraction----%%%%%%\n\n');
disp(layer);
fprintf('\nhigh-level features : %s\n',TextureFeature);
pause(3);
msgbox('high-level features extraction is completed');
pause(5);
Feature
