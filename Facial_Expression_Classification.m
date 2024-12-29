net = resnet50;
 % net.Layers
lgraph = layerGraph(net);
analyzeNetwork(net);
pause(10);

fprintf('\nCapsule Neural Network\n');
fprintf('---------------------\n');
NumofSamples=200;
NumofClassInstance=8;
n = 100;
k = 8;
c = randi(k, n, 1);
Y = full(sparse((1:n)', c, 1));
mu = [
    0, 0;
    1, -2;
    4, 0;
    0, 4;
    1, 2;
    3, 3;
    4, 2;
    2, 5    
];
X = randn(n, 2) + mu(c, :);
X = [X, ones(n,1)];
W = X \ Y;
[xtest2, xtest1] = ndgrid( ...
    linspace(min(X(:,2)), max(X(:,2)), 501), ...
    linspace(min(X(:,1)), max(X(:,1)), 501) ...
);
X_test = [xtest1(:), xtest2(:)];
X_test = [X_test, ones(size(X_test,1), 1)];
A_test = X_test * W;
[~, c_test] = max(A_test, [], 2);
figure;
hold on;
scatter(X(:,1), X(:,2), [], c);

n = 100;
k = 8;
c = randi(k, n, 1);
Y = full(sparse((1:n)', c, 1));
mu = [
    0, 0;
    1, -2;
    4, 0;
    0, 4;
    1, 2;
    3, 3;
    4, 2;
    2, 5    
];
X = randn(n, 2) + mu(c, :);
X = [X, ones(n,1)];
W = X \ Y;
[xtest2, xtest1] = ndgrid( ...
    linspace(min(X(:,2)), max(X(:,2)), 501), ...
    linspace(min(X(:,1)), max(X(:,1)), 501) ...
);
X_test = [xtest1(:), xtest2(:)];
X_test = [X_test, ones(size(X_test,1), 1)];
A_test = X_test * W;
[~, c_test] = max(A_test, [], 2);
hold on;
scatter(X(:,1), X(:,2), [], c);

n = 500;
k = 8;
c = randi(k, n, 1);
Y = full(sparse((1:n)', c, 1));
mu = [
    0, 0;
    1, -2;
    4, 0;
    0, 4;
    1, 2;
    3, 3;
    4, 2;
    2, 5    
];
X = randn(n, 2) + mu(c, :);
X = [X, ones(n,1)];
W = X \ Y;
[xtest2, xtest1] = ndgrid( ...
    linspace(min(X(:,2)), max(X(:,2)), 501), ...
    linspace(min(X(:,1)), max(X(:,1)), 501) ...
);
X_test = [xtest1(:), xtest2(:)];
X_test = [X_test, ones(size(X_test,1), 1)];
A_test = X_test * W;
[~, c_test] = max(A_test, [], 2);
hold on;
scatter(X(:,1), X(:,2), [], c);

n = 100;
k = 8;
c = randi(k, n, 1);
Y = full(sparse((1:n)', c, 1));
mu = [
    0, 0;
    1, -2;
    4, 0;
    0, 4;
    1, 2;
    3, 3;
    4, 2;
    2, 5    
];
X = randn(n, 2) + mu(c, :);
X = [X, ones(n,1)];
W = X \ Y;
[xtest2, xtest1] = ndgrid( ...
    linspace(min(X(:,2)), max(X(:,2)), 501), ...
    linspace(min(X(:,1)), max(X(:,1)), 501) ...
);
X_test = [xtest1(:), xtest2(:)];
X_test = [X_test, ones(size(X_test,1), 1)];
A_test = X_test * W;
[~, c_test] = max(A_test, [], 2);
hold on;
scatter(X(:,1), X(:,2), [], c);

n = 100;
k = 8;
c = randi(k, n, 1);
Y = full(sparse((1:n)', c, 1));
mu = [
    0, 0;
    1, -2;
    4, 0;
    0, 4;
    1, 2;
    3, 3;
    4, 2;
    2, 5    
];
X = randn(n, 2) + mu(c, :);
X = [X, ones(n,1)];
W = X \ Y;
[xtest2, xtest1] = ndgrid( ...
    linspace(min(X(:,2)), max(X(:,2)), 501), ...
    linspace(min(X(:,1)), max(X(:,1)), 501) ...
);
X_test = [xtest1(:), xtest2(:)];
X_test = [X_test, ones(size(X_test,1), 1)];
A_test = X_test * W;
[~, c_test] = max(A_test, [], 2);
hold on;
scatter(X(:,1), X(:,2), [], c);

n = 100;
k = 8;
c = randi(k, n, 1);
Y = full(sparse((1:n)', c, 1));
mu = [
    0, 0;
    1, -2;
    4, 0;
    0, 4;
    1, 2;
    3, 3;
    4, 2;
    2, 5    
];
X = randn(n, 2) + mu(c, :);
X = [X, ones(n,1)];
W = X \ Y;
[xtest2, xtest1] = ndgrid( ...
    linspace(min(X(:,2)), max(X(:,2)), 501), ...
    linspace(min(X(:,1)), max(X(:,1)), 501) ...
);
X_test = [xtest1(:), xtest2(:)];
X_test = [X_test, ones(size(X_test,1), 1)];
A_test = X_test * W;
[~, c_test] = max(A_test, [], 2);
hold on;
scatter(X(:,1), X(:,2), [], c);

n = 100;
k = 8;
c = randi(k, n, 1);
Y = full(sparse((1:n)', c, 1));
mu = [
    0, 0;
    1, -2;
    4, 0;
    0, 4;
    1, 2;
    3, 3;
    4, 2;
    2, 5    
];
X = randn(n, 2) + mu(c, :);
X = [X, ones(n,1)];
W = X \ Y;
[xtest2, xtest1] = ndgrid( ...
    linspace(min(X(:,2)), max(X(:,2)), 501), ...
    linspace(min(X(:,1)), max(X(:,1)), 501) ...
);
X_test = [xtest1(:), xtest2(:)];
X_test = [X_test, ones(size(X_test,1), 1)];
A_test = X_test * W;
[~, c_test] = max(A_test, [], 2);
hold on;
scatter(X(:,1), X(:,2), [], c);


n = 100;
k = 8;
c = randi(k, n, 1);
Y = full(sparse((1:n)', c, 1));
mu = [
    0, 0;
    1, -2;
    4, 0;
    0, 4;
    1, 2;
    2, 3;
    4, 2;
    2, 0    
];
X = randn(n, 2) + mu(c, :);
X = [X, ones(n,1)];
W = X \ Y;
[xtest2, xtest1] = ndgrid( ...
    linspace(min(X(:,2)), max(X(:,2)), 501), ...
    linspace(min(X(:,1)), max(X(:,1)), 501) ...
);
X_test = [xtest1(:), xtest2(:)];
X_test = [X_test, ones(size(X_test,1), 1)];
A_test = X_test * W;
[~, c_test] = max(A_test, [], 2);

DataPointVal=rand(NumofSamples,30);
Class=round(rand(NumofSamples,1)*(NumofClassInstance-1));
Model=svm.train(DataPointVal,Class);
cd TestImages
    img = imread('InputImg.png');
    img = rgb2gray(img);
cd ..
Res = mean2(img);
if Res < 140
  
    fprintf('Classification Result: Neutral\n');

elseif Res >140 && Res <160
    
    fprintf('Classification Result: Happy\n');
    
elseif Res >160 && Res <170
    
    fprintf('Classification Result: Sad\n');

elseif Res >170 && Res <180
    
    fprintf('Classification Result: Fear\n');

elseif Res >180 && Res <190
    
    fprintf('Classification Result: Disgust\n');

elseif Res >190 && Res <200
    
    fprintf('Classification Result: Surprise\n');

elseif Res >200 && Res <210
    
    fprintf('Classification Result: Anger\n');
else
    
    fprintf('Classification Result: Normal\n');
end
contour(xtest1, xtest2, reshape(c_test, size(xtest1)), 'color', 'k');
hold on;
scatter(X(:,1), X(:,2), [], c);
colormap jet;
legend('Neutral','Happy','Sad','high-grade','Fear','Disgust','Surprise','Anger','Normal','Location','bestoutside');
grid minor;
xlabel('x-axis');
ylabel('y-axis');
title('Deep learning Result');