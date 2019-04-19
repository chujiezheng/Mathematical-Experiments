%% ���
clc; clear; close;

h = 0.001;
x = 1:h:20; 
x = x*pi()/2;
y = sin(x).*sqrt(2*pi()./x);
plot(x, y, 'r.');
hold on;

h = 0.05;
x = 1:h:20; 
x = x*pi()/2;

% ��ǰŷ����
y1 = zeros(2,length(x));
y1(:,1)=[2,-2/pi()];
for k=2:length(x)
    y1(:,k)=y1(:,k-1)+h*pi()/2*q23fun(x(k-1),y1(:,k-1));
end
plot(x,y1(1,:),'b.')


% �Ľ�ŷ����
y2 = zeros(2,length(x));
y2(:,1)=[2,-2/pi()];
for k=2:length(x)
    yy=y2(:,k-1)+h*pi()/2*q23fun(x(k-1),y2(:,k-1));
    y2(:,k)=y2(:,k-1)+h*pi()/2*(q23fun(x(k-1),y2(:,k-1))+q23fun(x(k),yy))/2;
end
plot(x, y2(1,:),'bo')

% ��������-����
y0 = [2,-2/pi()];
[x, y3] = ode(@q23fun, x, y0);
plot(x, y3(1,:), 'go')

% ode23
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);
[x, y4] = ode23(@q23fun, x, y0, opt);
plot(x, y4(:,1), 'k.')

% ode45
[x, y5] = ode45(@q23fun, x, y0, opt);
plot(x, y5(:,1), 'ko')

leg = legend('Solution','ŷ����','�Ľ�ŷ����','��������-����','ODE23','ODE45','Location','northeast');
set(leg,'Fontsize',12)

%% ���
clc; clear; close;
hold on;

h = 0.05;
x = 1:h:20; 
x = x*pi()/2;

% �Ľ�ŷ����
y2 = zeros(2,length(x));
y2(:,1)=[2,-2/pi()];
for k=2:length(x)
    yy=y2(:,k-1)+h*pi()/2*q23fun(x(k-1),y2(:,k-1));
    y2(:,k)=y2(:,k-1)+h*pi()/2*(q23fun(x(k-1),y2(:,k-1))+q23fun(x(k),yy))/2;
end
plot(x, y2(1,:)-sin(x).*sqrt(2*pi()./x),'b.')

% ��������-����
y0 = [2,-2/pi()];
[x, y3] = ode(@q23fun, x, y0);
plot(x, y3(1,:)-sin(x).*sqrt(2*pi()./x), 'r.')


% ode23
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);
[x, y4] = ode23(@q23fun, x, y0);
plot(x, y4(:,1)-sin(x).*sqrt(2*pi()./x), 'k.')

% ode45
[x, y5] = ode45(@q23fun, x, y0);
plot(x, y5(:,1)-sin(x).*sqrt(2*pi()./x), 'g.')

leg = legend('�Ľ�ŷ����','��������-����','ODE23 (��opt)',...
    'ODE45 (��opt)','Location','northwest');
set(leg,'Fontsize',12)

%% ���
clc; clear; close;

h = 0.05;
x = 1:h:20; 
x = x*pi()/2;

% �Ľ�ŷ����
cost = 1:10;
for c=1:10
    tic
    for i=1:100
        y2 = zeros(2,length(x));
        y2(:,1)=[2,-2/pi()];
        for k=2:length(x)
            yy=y2(:,k-1)+h*pi()/2*q23fun(x(k-1),y2(:,k-1));
            y2(:,k)=y2(:,k-1)+h*pi()/2*(q23fun(x(k-1),y2(:,k-1))+q23fun(x(k),yy))/2;
        end
    end
    cost(c) = toc;
end
mean(cost)
var(cost)

% ��������-����
y0 = [2,-2/pi()];
cost = 1:10;
for c=1:10
    tic
    for i=1:100
        [x, y3] = ode(@q23fun, x, y0);
    end
    cost(c) = toc;
end
mean(toc)
var(toc)


% ode23
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);

cost = 1:10;
for c=1:10
    tic
    for i=1:100
        [x, y4] = ode23(@q23fun, x, y0);
    end
    cost(c) = toc;
end
mean(cost)
var(cost)

% ode45
cost = 1:10;
for c=1:10
    tic
    for i=1:100
        [x, y5] = ode45(@q23fun, x, y0);
    end
    cost(c) = toc;
end
mean(cost)
var(cost)
