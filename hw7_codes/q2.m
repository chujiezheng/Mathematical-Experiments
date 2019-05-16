clear;clc;close;

rand('seed',233);
N = 100000; n = 100;
a = randn(n,N);
b = sort(a,1,'descend');

set(gcf, 'position', [0 0 720 360]);
[ef,x1] = ecdf(b(1,1:N));
stairs(x1,ef,'r','linewidth',1);
hold on;
mean(b(1,1:N))
var(b(1,1:N))

[ef,x2] = ecdf(b(2,1:N));
stairs(x2,ef,'b','linewidth',1);
hold on;
mean(b(2,1:N))
var(b(2,1:N))

[ef,x3] = ecdf(b(3,1:N));
stairs(x3,ef,'g','linewidth',1);
mean(b(3,1:N))
var(b(3,1:N))

xrange = min(x3):0.1:max(x1);
y1 = normcdf(xrange).^100;
y2 = 100*normcdf(xrange).^99.*(1-normcdf(xrange))+y1;
y3 = 50*99*normcdf(xrange).^98.*(1-normcdf(xrange)).^2+y2;
plot(xrange,y1,'ro',xrange,y2,'bo',xrange,y3,'go','linewidth',2);


xlabel('x'); ylabel('累计值');
leg = legend('X_{(1)}经验分布函数','X_{(2)}经验分布函数','X_{(3)}经验分布函数',...
    'X_{(1)}累积分布函数','X_{(2)}累积分布函数','X_{(3)}累积分布函数',...
    'Location','southeast');
set(leg,'Fontsize',12);





