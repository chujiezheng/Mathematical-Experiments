clear;clc;close;
data = textread('data11.txt');
y = data(:,2);
n = length(y);
X = zeros(n, 8);
X(:,1) = data(:,3); %x_1项
X(:,2) = data(:,4); %x_2项
X(:,3) = data(:,5); %x_3项
X(:,4) = data(:,3) .* data(:,3); %x_1^2项
X(:,5) = data(:,3) .* data(:,4); %x_1*x_2项
X(:,6) = data(:,3) .* data(:,5); %x_1*x_3项
X(:,7) = data(:,4) .* data(:,5); %x_2*x_3项
X(:,8) = data(:,5) .* data(:,5); %x_3^2项

stepwise(X, y, [2,5,7])


%%
set(gcf, 'position', [0 0 720 360]);
plot(data(:,3),y,'o');
pause;close;

set(gcf, 'position', [0 0 720 360]);
plot(data(:,4),y,'o');
pause;close;

set(gcf, 'position', [0 0 720 360]);
plot(data(:,5),y,'o');
pause;close;

set(gcf, 'position', [0 0 720 360]);
plot(data(:,3).*data(:,3),y,'o');
pause;close;

set(gcf, 'position', [0 0 720 360]);
plot(data(:,3).*data(:,4),y,'o');
pause;close;

set(gcf, 'position', [0 0 720 360]);
plot(data(:,3).*data(:,5),y,'o');
pause;close;

set(gcf, 'position', [0 0 720 360]);
plot(data(:,4).*data(:,4),y,'o');
pause;close;

set(gcf, 'position', [0 0 720 360]);
plot(data(:,4).*data(:,5),y,'o');
pause;close;

set(gcf, 'position', [0 0 720 360]);
plot(data(:,5).*data(:,5),y,'o');
pause;close;



