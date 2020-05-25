% 姓名：邹鹏
% 学号：2018218779
% 班级：计算机18-2班
% 一、构造拉格朗日插值多项式 p(x)逼近f(x)=x3，要求：
% 1）取节点x0 = -1，x1 = 1 作线性插值

figure(1)
x = [-1, 1]
y = x.^3
plot(x, y, 'o')
xi = -1:0.1:2
yi = lagrange(x, y, xi)
hold on
plot(xi, yi)

% 2）取节点x0 = -1，x1 = 0，x2 = 1作抛物插值
x = [-1, 0, 1]
y = x.^3
plot(x, y, 'o')
xi = -1:0.1:2
yi = lagrange(x, y, xi)
hold on
plot(xi, yi)

% 3）取节点x0 = -1，x1 = 0，x2 = 1，x3 = 2作三次插值
x = [-1, 0, 1, 2]
y = x.^3
plot(x, y, 'o')
xi = -1:0.1:2
yi = lagrange(x, y, xi)
hold on
plot(xi, yi)

% 二、编程实现牛顿插值算法，并完成如下题目，已知sin(0度） = 0，sin（30度） = 0.5，
% sin（45度）= 0.7071，sin（60度）= 0.8660，sin（90度）= 1
% 以此为依据画出sinx在区间[0, pi/2]的图像

figure(2)
x = [0, pi/6, pi/4, pi/3, pi/2]
y = sin(x)
plot(x, y, 'o')
xi = 0 : 0.1 : pi/2
yi = newton(x, y, xi)
hold on
plot(xi, yi)