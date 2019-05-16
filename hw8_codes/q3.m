%%
clear;clc;close;
rng(548);

lr = 1000;

T = 1500;
n = 100;
N = 1000;

e1 = zeros(1,N);
e2 = zeros(1,N);
e3 = zeros(1,N);

cnt = 1;
while cnt<=N
    x = rand(1,n);
    sample = -log(x)*lr;
    %y = min(sample,T);
    y = sample;
    %
    val1 = mean(y<T);
    est1 = -T / log(1-val1);
    %
    val2 = mean(y(y<T));
    fun2 = @(x) (x-(x+T).*exp(-T./x))./(1-exp(-T./x))-val2;
    opt=optimset('TolX',1e-8);
    est2 = fzero(fun2,1000,opt);
    if est2<0
        continue
    end
    %
    val3 = mean(y);
    fun3 = @(x) (x-x.*exp(-T./x))-val3;
    est3 = fzero(fun3,1000,opt);
    
    e1(cnt) = est1;
    e2(cnt) = est2;
    e3(cnt) = est3;
    cnt = cnt + 1;
end

mean(e1)
std(e1)
mean(e2)
std(e2)
mean(e3)
std(e3)

%%
clc;clear;close;
matrix = [1.0253e+03,168.3731,775.3803,387.4510,973.1579,157.0439;
    1.0117e+03,143.6945,956.8097,364.5517,984.7605,131.7906;
    1.0102e+03,135.4621,998.0327,333.1325,991.7076,123.7015;
    1.0077e+03,130.4052,1.0276e+03,306.7120,997.9908,119.5962;
    1.0014e+03,129.4059,1.0485e+03,274.5942,1.0027e+03,117.1653;
    994.4105,132.0054,1.0424e+03,219.7614,1.0054e+03,113.1938;
    991.3340,139.6403,1.0267e+03,182.5774,1.0047e+03,110.3538;
    977.5851,171.6408,1.0189e+03,154.5444,1.0034e+03,108.0402;
    837.0220,418.9509,1.0099e+03,129.1457,1.0014e+03,105.4702];
x = [500,800,1000,1200,1500,2000,2500,3000,4000];
line = zeros(size(x));

set(gcf, 'position', [0 0 720 360]);
plot(x,matrix(:,1)-1000,'linewidth',2);
hold on;
plot(x,matrix(:,3)-1000,'linewidth',2);
plot(x,matrix(:,5)-1000,'linewidth',2);
plot(x,line,'linewidth',1.5)

xlabel('T')
ylabel('估计值与真实值的偏差')
legend('方法1', '方法2','方法3', 'Location', 'south')
saveas(gcf, 'bias.png')

pause;close;
set(gcf, 'position', [0 0 720 360]);
plot(x,matrix(:,2),'linewidth',2);
hold on;
plot(x,matrix(:,4),'linewidth',2);
plot(x,matrix(:,6),'linewidth',2);

xlabel('T')
ylabel('标准差')
legend('方法1', '方法2','方法3', 'Location', 'north')
saveas(gcf, 'std.png')








