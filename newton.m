% ����������
% ѧ�ţ�2018218779
% �༶�������18-2��
% newton.m
% ��ţ�ٲ�ֵ����ʽֵ
% ���������n+1���ڵ㣬x��yΪn+1ά������xxΪ������ȡ��
% �������������ţ�ٲ�ֵ����󣬷���xx�������Ӧ��yy����ֵ

function yy = newton(x, y, xx)
  m = length(x);
  n = length(y);
  if m ~= n
    error('����x��y�ĳ��ȱ���һ��');
  endif
  
  % ������̾���
  A = zeros(n, n);
  A(:, 1) = y';
  for j = 2 : n
    for i = j : n
      A(i, j) = (A(i, j-1)-A(i-1, j-1))/(x(i)-x(i-j+1));
    endfor
  endfor
  
  % �������ĳ˻�����
  s = ones(1, length(xx)) * A(1,1)
  for k = 1 : length(xx)
    for i = 2 : n
      % ���� (x-x0)* ... *(x0-x(i-1))
      t = 1;
      for j = 1 : i-1
        t *= (xx(k)-x(j));
      endfor 
      s(k) += t * A(i, i);
    endfor
  endfor
  
  yy = s;
endfunction