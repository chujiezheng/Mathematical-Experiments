function y = normcdf_new(x)

load table_simpson.mat;
y = interp1(t,table_simpson,x,'spline');
y(x > 10) = 1;
y(x < -10) = 0;