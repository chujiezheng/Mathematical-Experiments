clear;clc;close;

n=30;
u0=zeros(n,n)-100;
lambda=1;
opt=optimset('TolX',1e-8);

tic;
v = fsolve(@(u) qaddfun(u,n,lambda),u0,opt);
toc

u = zeros(n+2,n+2);
for i=2:n+1
    u(i,2:n+1) = v(i-1,1:n);
end

c=linspace(0,1,n+2);
[X,Y]=meshgrid(c, c);
mesh(X,Y,u);

