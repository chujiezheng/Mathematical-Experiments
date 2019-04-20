clear;clc;close;

M=[1.30,1.225,1.149,1.258997;
    1.103,1.290,1.260,1.197526;
    1.216,1.216,1.419,1.364261;
    0.954,0.728,0.922,0.919287;
    0.929,1.144,1.169,1.057080;
    1.056,1.107,0.965,1.055012;
    1.038,1.321,1.133,1.187925;
    1.089,1.305,1.732,1.317130;
    1.090,1.195,1.021,1.240164;
    1.083,1.390,1.131,1.183675;
    1.035,0.928,1.006,0.990108;
    1.176,1.715,1.908,1.526236];
MM = M(1:12,1:3)-1;
va = var(MM);
me = mean(MM);
co = cov(MM);

%%
H = co*2;
c = [0,0,0];
v1 = [0,0,0];
A1 = -me;
b1 = -0.15;
A2 = [1,1,1];
b2 = 1;
[x,fv,ef,out,lag]=quadprog(H,c,A1,b1,A2,b2,v1,[])
A1*x
%%
b = min(me):0.0001:max(me);

fl = zeros(length(b),1);
xl = zeros(length(b),3);

for i=1:length(b)
    [x,fv,ef,out,lag]=quadprog(H,c,A1,-b(i),A2,b2,v1,[]);
    fl(i)=fv;
    xl(i,1:3)=x;
end


plot(b,xl(1:length(b),1),'.r', ...
    b,xl(1:length(b),2),'.b', ...
    b,xl(1:length(b),3),'g.');
leg = legend('股票A','股票B','股票C','Location','North');
set(leg,'Fontsize',12);
xlabel('期望年收益率');
ylabel('投资比例');
pause;close;

plot(b,fl,'.');
xlabel('期望年收益率');
ylabel('最小风险');

%%
H = zeros(4,4);
H(1:3,1:3) = co*2;
c = [0,0,0,0];
v1 = [0,0,0,0];
A1 = [-me,-0.05];
b1 = -0.15;
A2 = [1,1,1,1];
b2 = 1;
[x,fv,ef,out,lag]=quadprog(H,c,A1,b1,A2,b2,v1,[])
A1*x

%%
H = co*2;
c = [0,0,0];
v1 = [0,0,0];
A1 = -me;
b1 = -0.15;
A2 = [1.01,1.01,0.99];
b2 = 1.007;
[x,fv,ef,out,lag]=quadprog(H,c,A1,b1,A2,b2,v1,[])
A1*x

