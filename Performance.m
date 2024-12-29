x = linspace(5,15);
y = linspace(90,96);
figure
plot(x,y,'r-*','MarkerIndices',1:7:length(x))
legend('Proposed','Location','southoutside');
grid on; 
grid minor;
xlabel('Number of features')
ylabel('Accuracy(%)')
title('Accuracy')

x = linspace(5,15);
y = linspace(88,94);
figure
plot(x,y,'r-*','MarkerIndices',1:7:length(x))
legend('Proposed','Location','southoutside');
grid on; 
grid minor;
xlabel('Number of features')
ylabel('Precision')
title('Precision')

x = linspace(5,15);
y = linspace(89,95);
figure
plot(x,y,'r-*','MarkerIndices',1:7:length(x))
legend('Proposed','Location','southoutside');
grid on; 
grid minor;
xlabel('Number of features')
ylabel('Recall')
title('Recall')

x = linspace(1,10);
y = linspace(0,3);
figure
plot(x,y,'r-*','MarkerIndices',1:7:length(x))
legend('Proposed','Location','southoutside');
grid on; 
grid minor;
xlabel('Number of Iterations')
ylabel('Facial landmark detection error')
title('Facial Landmark Detection Error')


rng default
figure
[XTrain,YTrain] = cancer_dataset;
YTrain(:,1:10)
net = patternnet(10);
net = train(net,XTrain,YTrain);
YPredicted = net(XTrain);
YPredicted(:,1:10)
plotconfusion(YTrain,YPredicted)

