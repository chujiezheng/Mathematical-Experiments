function dy = q23fun(x, y)
% y(1)=y, y(2)=y'=y1'=y2
dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -y(2)/x+(1/(4*x^2)-1)*y(1);
