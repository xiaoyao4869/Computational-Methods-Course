% ����������
% ѧ�ţ�2018218779
% �༶�������18-2��
% lagrange.m
% ���������ղ�ֵ����ʽֵ
% ���������n+1���ڵ㣬x��yΪn+1ά������xxΪ������ȡ��
% ��������������������ղ�ֵ����󣬷���xx�������Ӧ��yy����ֵ

function yy = lagrange(x, y, xx)
  m = length(x);
  n = length(y);
  if m ~= n
    error('����x��y�ĳ��ȱ���һ��');
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