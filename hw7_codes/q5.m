clear;clc;close;

K = 1000; n = 100000;
r = zeros(1,K);
rand('seed',233);

for ii=1:K
    x = rand(2,n)*200-100;
    y = q5fun(x(1,1:n),x(2,1:n));
    r(ii) = sum(y.*(x(1,1:n).^2+x(2,1:n).^2<100^2))*200^2/n;
end

mean(r)
var(r)