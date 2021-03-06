%% 岭回归(Ridge Regression)

%导入数据
data = load('abalone.txt');
[m,n] = size(data);

dataX = data(:,1:8);%特征
dataY = data(:,9);%标签

%标准化
yMeans = mean(dataY);
for i = 1:m
    yMat(i,:) = dataY(i,:)-yMeans;
end

xMeans = mean(dataX);
xVars = var(dataX);
for i = 1:m
    xMat(i,:) = (dataX(i,:) - xMeans)./xVars;
end

% 运算30次
testNum = 30;
weights = zeros(testNum, n-1);
for i = 1:testNum
    w = ridgeRegression(xMat, yMat, exp(i-10));
    weights(i,:) = w';
end

% 画出随着参数lam
hold on
axis([-9 20 -1.0 2.5]);
xlabel log(lam);
ylabel weights;
for i = 1:n-1
    x = -9:20;
    y(1,:) = weights(:,i)';
    plot(x,y);
end
