% 姓名：邹鹏
% 学号：2018218779
% 班级：计算机18-2班
% lagrange.m
% 求拉格朗日插值多项式值
% 输入变量：n+1个节点，x、y为n+1维向量，xx为横坐标取点
% 输出变量：进行拉格朗日插值运算后，返回xx横坐标对应的yy函数值

function yy = lagrange(x, y, xx)
  m = length(x);
  n = length(y);
  if m ~= n
    error('向量x与y的长度必须一致');
  endif
  s = 0;
  for i = 1 : n
    t = ones(1, length(xx));
    for j = 1 : n
        if j ~= i
          t = t.*(xx - x(j)) / (x(i) - x(j));
        endif
    endfor
    s += t * y(i);
  endfor
  yy = s;
endfunction