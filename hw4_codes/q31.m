clc; clear; close;

set(gcf, 'position', [0 0 480 240]);
x = 0:0.00001: 0.0025;
plot(x,q31fun(x),'.');

%%
x0 = 0.002;
opt=optimset('TolX',1e-8);
x = fzero(@q31fun,x0,opt);
x * 100
x*12 * 100