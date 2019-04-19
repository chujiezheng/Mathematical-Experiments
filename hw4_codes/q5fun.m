function y = q5fun(alpha)
a = 0.8; b = 0.25; r = 0.04; l = 0.5; p = 1e4; gamma = 1.4; F=25;
y = a*F*cos(alpha)-pi()*b*r^2*p*((l./(l-b*tan(alpha))).^gamma-1);