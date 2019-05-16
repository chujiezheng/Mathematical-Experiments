clear;clc;close;

n = 100000; K = 1000;
r = zeros(1,K);
rand('seed',233);

for ii=1:K
    x = rand(3,n)*2-1;
    x(3,1:n) = x(3,1:n) + 1;
    k=0;
    for i=1:n
        if x(3,i) > sqrt(x(1,i)^2+x(2,i)^2) &&...
                x(1,i)^2+x(2,i)^2+(x(3,i)-1)^2<1 &&...
                x(3,i) < sqrt(1-x(1,i)^2+x(2,i)^2)+1
            k = k+1;
        end
    end
    r(ii) = k/n*8;
end

mean(r)
var(r)