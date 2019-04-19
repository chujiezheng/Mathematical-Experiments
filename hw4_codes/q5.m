clear;clc;close;

set(gcf, 'position', [0 0 480 240]);
x = 0:0.001:0.8;
y = q5fun(x);
plot(x,y,'.')

%%
x0 = 0.7;
opt=optimset('TolX',1e-8);
x = fzero(@q5fun,x0,opt)
x*180/pi()