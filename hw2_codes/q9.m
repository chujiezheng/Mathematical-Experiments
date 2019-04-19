clc; clear; close;

r = [1,1]; n = [100, 100]; x0 = [10, 10];
s = [0.5, 2];
t = 0:0.001:100;
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);
set(gcf, 'position', [0 0 480 480]);

[t, x] = ode45(@q9fun, t, x0, opt, r, n, s);
subplot(2,1,1); plot(t, x(:,1), 'r.', t, x(:,2), 'b.')
xlabel('时间'); ylabel('数量');
leg = legend('甲','乙','Location','east');
set(leg,'Fontsize',12);
subplot(2,1,2); plot(x(:,1), x(:,2), '.')
xlabel('甲'); ylabel('乙');

%%
clc; clear; close;
%%
r = [1,1]; n = [100, 100]; x0 = [10, 10];
%%
s1 = [0.8, 0.7]; s2 = [1.5, 1.7];
t = 0:0.001:100;
opt=odeset('RelTol',1e-6,'AbsTol',1e-9);
set(gcf, 'position', [0 0 960 480]);

[t, x] = ode45(@q9fun, t, x0, opt, r, n, s1);
subplot(2,2,1); plot(t, x(:,1), 'r.', t, x(:,2), 'b.')
xlabel('时间'); ylabel('数量');
leg = legend('甲','乙','Location','east');
set(leg,'Fontsize',12);
subplot(2,2,3); plot(x(:,1), x(:,2), '.')
xlabel('甲'); ylabel('乙');

[t, x] = ode45(@q9fun, t, x0, opt, r, n, s2);
subplot(2,2,2); plot(t, x(:,1), 'r.', t, x(:,2), 'b.')
xlabel('时间'); ylabel('数量');
leg = legend('甲','乙','Location','east');
set(leg,'Fontsize',12);
subplot(2,2,4); plot(x(:,1), x(:,2), '.')
xlabel('甲'); ylabel('乙');

%%
clc; clear; close;

%% (1)
r = [1,1]; n = [100, 100]; x0 = [10, 10];

%% (2)1
r = [5,1]; n = [100, 100]; x0 = [10, 10];

%% (2)2
r = [1,5]; n = [100, 100]; x0 = [10, 10];

%% (2)3
r = [1,1]; n = [300, 100]; x0 = [10, 10];

%% (2)4
r = [1,1]; n = [100, 300]; x0 = [10, 10];

%% (2)5
r = [1,1]; n = [100, 100]; x0 = [20, 10];

%% (2)6
r = [1,1]; n = [100, 100]; x0 = [10, 20];
