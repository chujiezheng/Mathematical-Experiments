%% 1
clear; clc; close;

rand('seed',233);
N = 100; n = 200; p = 0.5;
result = binornd(n,p,1,N);

set(gcf, 'position', [0 0 720 360]);
[ef,x] = ecdf(result);
stairs(x,ef,'r','linewidth',2);
hold on;

xrange = min(result):0.01:max(result);
y = normcdf((xrange-n*p)/sqrt(n*p*(1-p)));
plot(xrange,y,'g','linewidth',2)
hold on;

ye = normcdf(xrange,mean(result),sqrt(var(result)));
plot(xrange,ye,'b','linewidth',2)

mean(result)
var(result)
mean((y-ye).^2)


xlabel('���泯�ϴ���'); ylabel('�ۻ�ֵ');
leg = legend('����ֲ�����','�����۽��ƣ��ۻ��ֲ�����','����̬����+�������ƣ��ۻ��ֲ�����','Location','southeast');
set(leg,'Fontsize',12);


%% 2
clear; clc; close;

rand('seed',223);
N = 100000; n = 200; p = 0.5;
result = binornd(1,p,n,N);
cnt = zeros(1,N);
for i=1:N
    rcd = result(1,i);
    tmp = 1;
    for j=2:n
        if result(j,i)==rcd
            tmp = tmp+1;
        else
            cnt(i) = max(cnt(i), tmp);
            tmp = 1;
        end
        rcd = result(j,i);
    end
    cnt(i) = max(cnt(i), tmp);
end

set(gcf, 'position', [0 0 720 360]);
[ef,x] = ecdf(cnt);
stairs(x,ef,'r','linewidth',2);
hold on;


xrange = min(cnt):0.01:max(cnt);
y = normcdf(xrange,mean(cnt),sqrt(var(cnt)));
plot(xrange,y,'b','linewidth',2)

xlabel('�������'); ylabel('�ۻ�ֵ');
leg = legend('������ȵľ���ֲ�����','����̬����+�������ƣ��ۻ��ֲ�����',...
    'Location','southeast');
    %
    
set(leg,'Fontsize',12);


%% 3
clear; clc; close;

rand('seed',233);
N = 100000; n = 200; p = 0.5;
result = binornd(1,p,n,N);
cnt = zeros(n,N); % ����Ϊ1:n�Ĵ��ڵ�1:N��ʵ�����ж��ٴ�
for i=1:N
    rcd = result(1,i);
    tmp = 1;
    for j=2:n
        if result(j,i)==rcd
            tmp = tmp+1;
        else
            cnt(tmp,i) = cnt(tmp,i)+1;
            tmp = 1;
        end
        rcd = result(j,i);
    end
    cnt(tmp,i) = cnt(tmp,i)+1;
end

%%

[ef,x] = ecdf(cnt(5,1:N));
set(gcf, 'position', [0 0 720 360]);
stairs(x,ef,'r','linewidth',3);
xlabel('����Ϊ5�Ĵ��ĸ���'); ylabel('�ۻ�ֵ');
hold on;
l = mean(cnt(5,1:N))
y = poisscdf(x,l); y(1) = 0;
stairs(x,y,'b','linewidth',2);
leg = legend('����ֲ�����','�����ɼ���+�������ƣ��ۻ��ֲ�����','Location','southeast');
set(leg,'Fontsize',12);
pause;close;

[ef,x] = ecdf(cnt(6,1:N));
set(gcf, 'position', [0 0 720 360]);
stairs(x,ef,'r','linewidth',3);
xlabel('����Ϊ6�Ĵ��ĸ���'); ylabel('�ۻ�ֵ');
hold on;
l = mean(cnt(6,1:N))
y = poisscdf(x,l); y(1) = 0;
stairs(x,y,'b','linewidth',2);
leg = legend('����ֲ�����','�����ɼ���+�������ƣ��ۻ��ֲ�����','Location','southeast');
set(leg,'Fontsize',12);
pause;close;

[ef,x] = ecdf(sum(cnt(7:n,1:N),1));
set(gcf, 'position', [0 0 720 360]);
stairs(x,ef,'r','linewidth',3);
xlabel('���Ȳ�С��7�Ĵ��ĸ���'); ylabel('�ۻ�ֵ');
hold on;
l = mean(sum(cnt(7:n,1:N),1))
y = poisscdf(x,l); y(1) = 0;
stairs(x,y,'b','linewidth',2);
leg = legend('����ֲ�����','�����ɼ���+�������ƣ��ۻ��ֲ�����','Location','southeast');
set(leg,'Fontsize',12);

%%
clc;close;

[ef,x] = ecdf(cnt(4,1:N));
set(gcf, 'position', [0 0 720 360]);
stairs(x,ef,'r','linewidth',3);
xlabel('����Ϊ4�Ĵ��ĸ���'); ylabel('�ۻ�ֵ');
hold on;
l = mean(cnt(4,1:N))
y = poisscdf(x,l); y(1) = 0;
stairs(x,y,'b','linewidth',2);
leg = legend('����ֲ�����','�����ɼ���+�������ƣ��ۻ��ֲ�����','Location','southeast');
set(leg,'Fontsize',12);
pause;close;

[ef,x] = ecdf(cnt(8,1:N));
set(gcf, 'position', [0 0 720 360]);
stairs(x,ef,'r','linewidth',3);
xlabel('����Ϊ8�Ĵ��ĸ���'); ylabel('�ۻ�ֵ');
hold on;
l = mean(cnt(8,1:N))
y = poisscdf(x,l); y(1) = 0;
stairs(x,y,'b','linewidth',2);
leg = legend('����ֲ�����','�����ɼ���+�������ƣ��ۻ��ֲ�����','Location','southeast');
set(leg,'Fontsize',12);
pause;close;

[ef,x] = ecdf(sum(cnt(9:n,1:N),1));
set(gcf, 'position', [0 0 720 360]);
stairs(x,ef,'r','linewidth',3);
xlabel('���Ȳ�С��9�Ĵ��ĸ���'); ylabel('�ۻ�ֵ');
hold on;
l = mean(sum(cnt(9:n,1:N),1))
y = poisscdf(x,l); y(1) = 0;
stairs(x,y,'b','linewidth',2);
leg = legend('����ֲ�����','�����ɼ���+�������ƣ��ۻ��ֲ�����','Location','southeast');
set(leg,'Fontsize',12);

%%
clc;
l = mean(cnt(1,1:N))
l = mean(cnt(2,1:N))
l = mean(cnt(3,1:N))
l = mean(cnt(4,1:N))
l = mean(cnt(5,1:N))
l = mean(cnt(6,1:N))
l = mean(cnt(7,1:N))
l = mean(cnt(8,1:N))
l = mean(cnt(9,1:N))

%%
clc;
l = mean(sum(cnt(1:n,1:N),1))
l = mean(sum(cnt(2:n,1:N),1))
l = mean(sum(cnt(3:n,1:N),1))
l = mean(sum(cnt(4:n,1:N),1))
l = mean(sum(cnt(5:n,1:N),1))
l = mean(sum(cnt(6:n,1:N),1))
l = mean(sum(cnt(7:n,1:N),1))
l = mean(sum(cnt(8:n,1:N),1))
l = mean(sum(cnt(9:n,1:N),1))
