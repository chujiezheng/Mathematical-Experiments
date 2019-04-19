function dx = q3fun(t, x)
% x(1) = h, x(2) = v
R = 6.4e06; F = 32000; lambda = 18; k = 0.4; M = 1400; M0 = 320; g0 = 9.8;
dx = zeros(2,1);
dx(1) = x(2);
if t <= 60
    dx(2)=(F-k*(x(2))^2+lambda*x(2))/(M-lambda*t)-g0*R^2/(R+x(1))^2;
elseif t <= 71.552
    dx(2)=-k*(x(2))^2/M0-g0*R^2/(R+x(1))^2;
else
    dx(2)=k*(x(2))^2/M0-g0*R^2/(R+x(1))^2;
end