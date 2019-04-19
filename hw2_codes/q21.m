%% ���
clc; clear; close;

% ��ȷ��
h = 0.001;
x=0:h:1; 
plot(x,3*exp(x)-2*x-2,'r.'); 
hold on;

h = 0.05;
x=0:h:1; 

% ��ǰŷ����
y1 = 1:length(x);
y1(1)=1;
for k=2:length(x)
    y1(k)=y1(k-1)+h*q21fun(x(k-1),y1(k-1));
end
plot(x,y1,'b.')

% �Ľ�ŷ����
y2 = 1:length(x);
y2(1)=1;
for k=2:length(x)
    yy=y2(k-1)+h*q21fun(x(k-1),y2(k-1));
    y2(k)=y2(k-1)+h*(q21fun(x(k-1),y2(k-1))+q21fun(x(k),yy))/2;
end
plot(x, y2,'bo')

% ��������-����
y0 = 1;
[x, y3] = ode(@q21fun, x, y0);
plot(x, y3, 'go')

% ode23
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);
[x, y4] = ode23(@q21fun, x, y0, opt);
plot(x, y4, 'k.')

% ode45
[x, y5] = ode45(@q21fun, x, y0, opt);
plot(x, y5, 'ko')

leg = legend('Solution','ŷ����','�Ľ�ŷ����','��������-����','ODE23','ODE45','Location','northwest');
set(leg,'Fontsize',12)


%% ������
clc; clear; close;

h = 0.05;
x=0:h:1; 
hold on;

% ��ǰŷ����
y1 = 1:length(x);
y1(1)=1;
for k=2:length(x)
    y1(k)=y1(k-1)+h*q21fun(x(k-1),y1(k-1));
end
plot(x,abs(y1-(3*exp(x)-2*x-2)),'k.')

% �Ľ�ŷ����
y2 = 1:length(x);
y2(1)=1;
for k=2:length(x)
    yy=y2(k-1)+h*q21fun(x(k-1),y2(k-1));
    y2(k)=y2(k-1)+h*(q21fun(x(k-1),y2(k-1))+q21fun(x(k),yy))/2;
end
plot(x, abs(y2-(3*exp(x)-2*x-2)),'go');

% ��������-����
y0 = 1;
[x, y3] = ode(@q21fun, x, y0);
plot(x, abs(y3-(3*exp(x)-2*x-2)), 'ro');

% ode23
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);
[x, y4] = ode23(@q21fun, x, y0, opt);
plot(x, abs(y4-(3*exp(x)-2*x-2)), 'b.');

% ode45
[x, y5] = ode45(@q21fun, x, y0, opt);
plot(x, abs(y5-(3*exp(x)-2*x-2)), 'bo');

leg = legend('ŷ����', '�Ľ�ŷ����',...
    '��������-����',...
    'ODE23',...
    'ODE45',...
    'Location','northwest');
set(leg,'Fontsize',12)

%% ode45
clc; clear; close;

h = 0.001;
x=0:h:1; 
y0=1;
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);
[x, y5] = ode45(@q21fun, x, y0), opt;
plot(x, abs(y5-(3*exp(x)-2*x-2)), 'bo');

leg = legend('ODE45','Location','northwest');
set(leg,'Fontsize',12)


%% ʱ�����
clc; clear; close;

h = 0.05;
x=0:h:1; 

% ��ǰŷ����
cost=1:10;
for c=1:10
    tic
    for i=1:10000
        y1 = 1:length(x);
        y1(1)=1;
        for k=2:length(x)
            y1(k)=y1(k-1)+h*q21fun(x(k-1),y1(k-1));
        end
    end
    cost(c)=toc;
end
mean(cost)
var(cost)

% �Ľ�ŷ����
cost=1:10;
for c=1:10
    tic
    for i=1:10000
        y2 = 1:length(x);
        y2(1)=1;
        for k=2:length(x)
            yy=y2(k-1)+h*q21fun(x(k-1),y2(k-1));
            y2(k)=y2(k-1)+h*(q21fun(x(k-1),y2(k-1))+q21fun(x(k),yy))/2;
        end
    end
    cost(c)=toc;
end
mean(cost)
var(cost)

% ��������-����
y0 = 1;

cost=1:10;
for c=1:10
    tic
    for i=1:10000
        [x, y3] = ode(@q21fun, x, y0);  
    end
    cost(c)=toc;
end
mean(cost)
var(cost)

% ode23
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);

cost=1:10;
for c=1:10
    tic
    for i=1:10000
        [x, y4] = ode23(@q21fun, x, y0);
    end
    cost(c)=toc;
end
mean(cost)
var(cost)

% ode45
cost=1:10;
for c=1:10
    tic
    for i=1:10000
        [x, y5] = ode45(@q21fun, x, y0);
    end
    cost(c)=toc;
end
mean(cost)
var(cost)
