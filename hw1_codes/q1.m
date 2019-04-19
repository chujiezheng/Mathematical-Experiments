%% (1)
clc; clear; close

n = 200; % 插值区间数目
m = 20000; % 样本点的区间的数目，即样本点数目-1
xp = -10:(20/n):10; % 插值点的位置
p = 1./(1+xp.^2); % 插值点的值
x = -10:(20/m):10; % 样本点的位置
y = 1./(1+x.^2); % 样本点的真实值


y1 = polyinterp(xp,p,x);       % Lagrange插值
y2 = interp1(xp,p,x);          % 分段线性插值
y3 = interp1(xp,p,x,'cubic');  % 分段三次插值
y4 = interp1(xp,p,x,'spline'); % 三次样条插值

%%
plot(xp,p,'o',x,y1,x,y,'k--')
pause; close
plot(xp,p,'o',x,y2,x,y,'k--')
pause; close
plot(xp,p,'o',x,y3,x,y,'k--')
pause; close
plot(xp,p,'o',x,y4,x,y,'k--')
pause; close

%%
sqrt(mean(y1-y,'omitnan').^2)
sqrt(mean(y2-y,'omitnan').^2)
sqrt(mean(y3-y,'omitnan').^2)
sqrt(mean(y4-y,'omitnan').^2)

%% (2)
clear; close

n = 200;
m = 20000;
k = 1:(n+1);
xp = 10.*cos((2.*k-1)./(2*(n+1)).*pi());
p = 1./(1+xp.^2);
x = -10:(20/m):10; % 样本点的位置
y = 1./(1+x.^2); % 样本点的真实值

y1 = polyinterp(xp,p,x);         % Lagrange插值
y2 = interp1(xp,p,x);          % 分段线性插值
y3 = interp1(xp,p,x,'cubic');  % 分段三次插值
y4 = interp1(xp,p,x,'spline'); % 三次样条插值

%%
plot(xp,p,'o',x,y1,x,y,'k--')
pause; close
plot(xp,p,'o',x,y2,x,y,'k--')
pause; close
plot(xp,p,'o',x,y3,x,y,'k--')
pause; close
plot(xp,p,'o',x,y4,x,y,'k--')
pause; close

%%
sqrt(mean(y1-y,'omitnan').^2)
sqrt(mean(y2-y,'omitnan').^2)
sqrt(mean(y3-y,'omitnan').^2)
sqrt(mean(y4-y,'omitnan').^2)

%% (2) add

clear; close
n = 15;
k = 1:n;
y = 10.*cos((2.*k-1)./(2*n).*pi());
y(8) = 0;
y = 10.*sign(y) - y;
p = 1./(1+y.^2);
x = -10:0.01:10;

y1=polyinterp(y,p,x);        % 多项式插值
y2= interp1(y,p,x);          % 分段线性插值
y3= interp1(y,p,x,'cubic');  % 分段三次插值
y4= interp1(y,p,x,'spline'); % 三次样条插值

close
subplot(2,2,1); plot(y,p,'o',x,y1)
subplot(2,2,2); plot(y,p,'o',x,y2)
subplot(2,2,3); plot(y,p,'o',x,y3)
subplot(2,2,4); plot(y,p,'o',x,y4)
