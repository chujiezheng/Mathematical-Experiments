clc; clear; close;

set(gcf, 'position', [0 0 480 240]);
x = 0:0.00001: 0.006;
plot(x,q32fun_month(x),'.');
pause; close;
set(gcf, 'position', [0 0 480 240]);
x = 0.0055:0.000001: 0.006;
plot(x,q32fun_month(x),'.');

%%
%x0 = 0.0058;
x0 = 0.07;
opt=optimset('TolX',1e-8);
x = fzero(@q32fun_month,x0,opt) * 100
%x * 12

%% 
set(gcf, 'position', [0 0 480 240]);
x = 0.06:0.0001: 0.07;
plot(x,q32fun_year(x),'.');

%%
x0 = 0.07;
opt=optimset('TolX',1e-8);
x = fzero(@q32fun_year,x0,opt) * 100