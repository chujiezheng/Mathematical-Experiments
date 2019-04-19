clc; clear; close;

t = 0:0.001:250;
x0 = [0, 0];
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);
[t, x] = ode45(@q3fun, t, x0, opt);
a = zeros(1,length(t));
for i=1:length(t)
    dx = q3fun(t(i), x(i,:));
    a(i) = dx(2);
end

x(length(t),1)
x(length(t),2)
a(length(t))

set(gcf, 'position', [0 0 960 480]);
subplot(1,3,1); plot(t, x(:,1), '.');
xlabel('ʱ��'); ylabel('�߶�');
subplot(1,3,2); plot(t, x(:,2), '.');
xlabel('ʱ��'); ylabel('�ٶ�');
subplot(1,3,3); plot(t, a, '.');
xlabel('ʱ��'); ylabel('���ٶ�');

%%
for m=1:length(t)
    if x(m,1)<0
        break
    end
end
m = m-1
t(m)

%%
close
x(m,1)
x(m,2)
a(m)

set(gcf, 'position', [0 0 960 480]);
subplot(1,3,1); plot(t(1:m), x(1:m,1), '.');
xlabel('ʱ��'); ylabel('�߶�');
subplot(1,3,2); plot(t(1:m), x(1:m,2), '.');
xlabel('ʱ��'); ylabel('�ٶ�');
subplot(1,3,3); plot(t(1:m), a(1:m), '.');
xlabel('ʱ��'); ylabel('���ٶ�');