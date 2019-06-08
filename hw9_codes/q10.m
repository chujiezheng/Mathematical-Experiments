clear;clc;close;
format long
data = textread('data10.txt');
y = data(:,2); %�����
n = length(y); %���������
X1 = zeros(n, 6); %�Ա���
X1(:,1) = ones(n,1); %��һ��Ϊ������
X1(:,2) = data(:,3); %x_1��
X1(:,3) = data(:,3) .* data(:,3); %x_1^2��
X1(:,4) = data(:,4); %x_2��
[b1, bint1, r1, rint1, s1] = regress(y, X1(:,1:4))

%%
X1(:,5) = data(:,3) .* data(:,4); %����x_1*x_2��
[b2, bint2, r2, rint2, s2] = regress(y, X1(:,1:5))

%%
X1(:,5) = data(:,4) .* data(:,4); %����x_2^2��
[b3, bint3, r3, rint3, s3] = regress(y, X1(:,1:5))

%%
X1(:,5) = data(:,3) .* data(:,4);
X1(:,6) = data(:,4) .* data(:,4);
[b4, bint4, r4, rint4, s4] = regress(y, X1)