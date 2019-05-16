function f = q5fun(x,y)

rho = 0.4; sx = 80; sy = 50;
f = 1/(2*pi*sx*sy*sqrt(1-rho^2))*...
    exp(-0.5/(1-rho^2)*((x.^2/sx^2+y.^2/sy^2-2*rho*x.*y/(sx*sy))));


