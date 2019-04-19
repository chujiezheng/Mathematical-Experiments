%% (1)制作查值表
clc; clear; close

h = 0.001;
n = 20 / h; % 区间数
t = zeros(1, n+1);
for i=1:(n+1)
    t(i) = -10+(i-1)*h;
end

table_simpson = zeros(1,n+1);
for i=1:(n+1)
    table_simpson(i) = comSimpson(t(i));
end
save table_simpson.mat table_simpson h n t;

%%
table_quad = zeros(1,n+1);
for i=1:(n+1)
    table_quad(i) = quad(@q2fun,-10,t(i),1e-12);
end
save table_quad.mat table_quad h n t;

%% (2) 比较精度
clc; clear; close

load table_simpson.mat;
load table_quad.mat;

bias_simpson = zeros(1,n/2);
bias_quad = zeros(1,n/2);

for i=1:n/2
    bias_simpson(i) = table_simpson(i)+table_simpson(n+2-i)-1;
    bias_quad(i) = table_quad(i)+table_quad(n+2-i)-1;
end

format short

mean(bias_simpson)
mean(bias_quad)
var(bias_simpson)
var(bias_quad)
mean(abs(bias_simpson))
mean(abs(bias_quad))
var(abs(bias_simpson))
var(abs(bias_quad))

signtest(abs(bias_simpson), abs(bias_quad))

%%
bias_normcdf = zeros(1,n/2);
for i=1:n/2
    bias_normcdf = normcdf(t(i))+...
        normcdf(t(n+2-i))-1;
end

mean(bias_normcdf)
var(bias_normcdf)
mean(abs(bias_normcdf))
var(abs(bias_normcdf))

%% (2.2)
clc;

bias_simpson = zeros(1,n+1);
bias_quad = zeros(1,n+1);

for i=1:(n+1)
    bias_simpson(i) = (table_simpson(i)-normcdf(t(i)));
    bias_quad(i) = (table_quad(i)-normcdf(t(i)));
end

mean(bias_simpson)
mean(bias_quad)
var(bias_simpson)
var(bias_quad)
mean(abs(bias_simpson))
mean(abs(bias_quad))
var(abs(bias_simpson))
var(abs(bias_quad))


%% (3) 与normcdf对比
clc; clear; close

load table_simpson.mat;

bias = table_simpson - normcdf(t);
plot(t, bias, '.')
mean(bias)
var(bias)
mean(abs(bias))
var(abs(bias))
max(abs(bias))

%%
clc; clear; close
h = 0.0001;
n = 20 / h;
x = -10:h:10;
bias = normcdf_new(x) - normcdf(x);
plot(x, bias, '.')%, '.r',x, y,'.b')%, x, bias+y, 'g')
mean(bias)
var(bias)
mean(abs(bias))
var(abs(bias))
max(abs(bias))

%%
close;
y = 1/sqrt(2*pi()) * exp(-x.^2/2) .* (3*x-x.^3);
plot(x, y, '.r')

%%
clc; close;
bias = normcdf_new(x) - normcdf(x);
max(abs(bias(1:(n/2))))
y = -y * max(abs(bias(1:(n/2)))) / max(y);
plot(x, bias, '.', x, y,'.r')%, x, bias+y, 'g')
mean(bias)
mean(abs(bias))
max(abs(bias))

