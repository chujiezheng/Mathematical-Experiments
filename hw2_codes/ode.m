function [x, y] = ode(f, x, y0)

y = zeros(length(y0),length(x));
y(:,1) = y0;
for i=2:length(x)
    h = x(i)-x(i-1); 
    k1 = f(x(i-1), y(:,i-1));
    k2 = f(x(i-1)+h/2, y(:,i-1)+k1*h/2);
    k3 = f(x(i-1)+h/2, y(:,i-1)+k2*h/2);
    k4 = f(x(i-1)+h, y(:,i-1)+k3*h);
    y(:,i) = y(:,i-1)+h/6*(k1+2*k2+2*k3+k4);
end


