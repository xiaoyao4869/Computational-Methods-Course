% ����������
% ѧ�ţ�2018218779
% �༶�������18-2��
% һ�������������ղ�ֵ����ʽ p(x)�ƽ�f(x)=x3��Ҫ��
% 1��ȡ�ڵ�x0 = -1��x1 = 1 �����Բ�ֵ

figure(1)
x = [-1, 1]
y = x.^3
plot(x, y, 'o')
xi = -1:0.1:2
yi = lagrange(x, y, xi)
hold on
plot(xi, yi)

% 2��ȡ�ڵ�x0 = -1��x1 = 0��x2 = 1�������ֵ
x = [-1, 0, 1]
y = x.^3
plot(x, y, 'o')
xi = -1:0.1:2
yi = lagrange(x, y, xi)
hold on
plot(xi, yi)

% 3��ȡ�ڵ�x0 = -1��x1 = 0��x2 = 1��x3 = 2�����β�ֵ
x = [-1, 0, 1, 2]
y = x.^3
plot(x, y, 'o')
xi = -1:0.1:2
yi = lagrange(x, y, xi)
hold on
plot(xi, yi)

% �������ʵ��ţ�ٲ�ֵ�㷨�������������Ŀ����֪sin(0�ȣ� = 0��sin��30�ȣ� = 0.5��
% sin��45�ȣ�= 0.7071��sin��60�ȣ�= 0.8660��sin��90�ȣ�= 1
% �Դ�Ϊ���ݻ���sinx������[0, pi/2]��ͼ��

figure(2)
x = [0, pi/6, pi/4, pi/3, pi/2]
y = sin(x)
plot(x, y, 'o')
xi = 0 : 0.1 : pi/2
yi = newton(x, y, xi)
hold on
plot(xi, yi)