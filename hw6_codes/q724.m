clear;clc;close;
format short
x0=[3,1];

opt0=optimset('fminunc'); % 程序fminunc缺省的控制参数
%opt0=optimset(opt0,'Disp','iter'); %设定输出中间结果
opt0=optimset(opt0,'LargeScale','off','tolx',1e-8,'tolf',1e-8);

'数值梯度  quasi_newton  bfgs'
opt=optimset(opt0,'HessUpdate','bfgs');
[x,f,ef,out]=fminunc(@qfun724,x0,opt)
pause;

'分析梯度  quasi_newton  bfgs'
opt=optimset(opt0,'GradObj','on');
opt=optimset(opt,'HessUpdate','bfgs');
[x,f,ef,out]=fminunc(@qfun724,x0,opt)
pause;

'数值梯度  quasi_newton  dfp'
opt=optimset(opt0,'HessUpdate','dfp');
[x,f,ef,out]=fminunc(@qfun724,x0,opt)
pause;

'分析梯度  quasi_newton  dfp'
opt=optimset(opt0,'GradObj','on');
opt=optimset(opt,'HessUpdate','dfp');
[x,f,ef,out]=fminunc(@qfun724,x0,opt)
pause;

'数值梯度  quasi_newton  steepdesc'
opt=optimset(opt0,'HessUpdate','steepdesc');
[x,f,ef,out]=fminunc(@qfun724,x0,opt)
pause;

'分析梯度  quasi_newton  steepdesc'
opt=optimset(opt0,'GradObj','on');
opt=optimset(opt,'HessUpdate','steepdesc');
[x,f,ef,out]=fminunc(@qfun724,x0,opt)
pause;

'trust-region'
opt=optimset(opt0,'GradObj','on');
opt=optimset(opt,'algorithm','trust-region');
[x,f,ef,out]=fminunc(@qfun724,x0,opt)

%%
x1 = 2:0.01:6;
x2 = 2:0.01:6;

gd = zeros(length(x1), length(x2));
for i=1:length(x1)
    for j=1:length(x2)
        xt = [x1(i),x2(j)];
        [ff,g] = qfun724(xt);
        gd(i,j) = ff;
    end
end

[xx1,xx2]=meshgrid(x1,x2);
mesh(xx1,xx2,gd);