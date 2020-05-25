% 姓名：邹鹏
% 学号：2018218779
% 班级：计算机18-2班
% newton.m
% 求牛顿插值多项式值
% 输入变量：n+1个节点，x、y为n+1维向量，xx为横坐标取点
% 输出变量：进行牛顿插值运算后，返回xx横坐标对应的yy函数值

function yy = newton(x, y, xx)
  m = length(x);
  n = length(y);
  if m ~= n
    error('向量x与y的长度必须一致');
  endif
  
  % 构造差商矩阵
  A = zeros(n, n);
  A(:, 1) = y';
  for j = 2 : n
    for i = j : n
      A(i, j) = (A(i, j-1)-A(i-1, j-1))/(x(i)-x(i-j+1));
    endfor
  endfor
  
  % 进行最后的乘积运算
  s = ones(1, length(xx)) * A(1,1)
  for k = 1 : length(xx)
    for i = 2 : n
      % 计算 (x-x0)* ... *(x0-x(i-1))
      t = 1;
      for j = 1 : i-1
        t *= (xx(k)-x(j));
      endfor 
      s(k) += t * A(i, i);
    endfor
  endfor
  
  yy = s;
endfunction