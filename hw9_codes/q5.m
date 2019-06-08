clear;clc;clear;
data = textread('data5.txt');
y = data(:,2);
n = length(y);

%set(gcf, 'position', [0 0 360 360]);
plot(data(:,3), y, 'o');
pause;close;
plot(data(:,4), y, 'o');
pause;close;
plot(data(:,5), y, 'o');
pause;close;

%%
clear;clc;clear;
data = textread('data5.txt');
y = data(:,2);
n = length(y);
X1 = [ones(n,1), data(:,3:4)];
X2 = [ones(n,1), data(:,3), data(:,5)];
X3 = [ones(n,1), data(:,4:5)];
[b1, bint1, r1, rint1, s1] = regress(y, X1)
[b2, bint2, r2, rint2, s2] = regress(y, X2)
[b3, bint3, r3, rint3, s3] = regress(y, X3)

%%
clc;
X1 = [ones(n,1), data(:,3)];
X2 = [ones(n,1), data(:,4)];
X3 = [ones(n,1), data(:,5)];
[b1, bint1, r1, rint1, s1] = regress(y, X1)
[b2, bint2, r2, rint2, s2] = regress(y, X2)
[b3, bint3, r3, rint3, s3] = regress(y, X3)

%%
clc;
X1 = [ones(n,1), data(:,3:5)];
[b1, bint1, r1, rint1, s1] = regress(y, X1)


%%
clc;
X1 = [ones(n,1), data(:,3:4)];
[b1, bint1, r1, rint1, s1] = regress(y, X1)
set(gcf, 'position', [0 0 720 360]);
rcoplot(r1, rint1)
pause;close;

y5 = [y(1:7,1); y(9:19,1)]; %剔除异常点
X5 = [data(1:7,3:4); data(9:19,3:4)];
X5 = [ones(18,1), X5]; %剔除异常点
[b5, bint5, r5, rint5, s5] = regress(y5, X5)
set(gcf, 'position', [0 0 720 360]);
rcoplot(r5, rint5)
pause;close;
