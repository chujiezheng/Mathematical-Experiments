%% (1)
clc; clear; close

n = 200; % ��ֵ������Ŀ
m = 20000; % ��������������Ŀ������������Ŀ-1
xp = -10:(20/n):10; % ��ֵ���λ��
p = 1./(1+xp.^2); % ��ֵ���ֵ
x = -10:(20/m):10; % �������λ��
y = 1./(1+x.^2); % ���������ʵֵ


y1 = polyinterp(xp,p,x);       % Lagrange��ֵ
y2 = interp1(xp,p,x);          % �ֶ����Բ�ֵ
y3 = interp1(xp,p,x,'cubic');  % �ֶ����β�ֵ
y4 = interp1(xp,p,x,'spline'); % ����������ֵ

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
x = -10:(20/m):10; % �������λ��
y = 1./(1+x.^2); % ���������ʵֵ

y1 = polyinterp(xp,p,x);         % Lagrange��ֵ
y2 = interp1(xp,p,x);          % �ֶ����Բ�ֵ
y3 = interp1(xp,p,x,'cubic');  % �ֶ����β�ֵ
y4 = interp1(xp,p,x,'spline'); % ����������ֵ

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

y1=polyinterp(y,p,x);        % ����ʽ��ֵ
y2= interp1(y,p,x);          % �ֶ����Բ�ֵ
y3= interp1(y,p,x,'cubic');  % �ֶ����β�ֵ
y4= interp1(y,p,x,'spline'); % ����������ֵ

close
subplot(2,2,1); plot(y,p,'o',x,y1)
subplot(2,2,2); plot(y,p,'o',x,y2)
subplot(2,2,3); plot(y,p,'o',x,y3)
subplot(2,2,4); plot(y,p,'o',x,y4)
