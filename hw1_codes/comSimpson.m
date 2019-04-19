function y = comSimpson(x) 

if x <= -10
    y = 0;
elseif x >= 10
    y = 1;
else
    n = 10000; % n¸öÇø¼ä
    h = (x+10) / n;
    xs = zeros(1,n+1);
    for i=1:n+1
        xs(i) = -10+(i-1)*h;
    end
    mids = (xs(2:(n+1)) + xs(1:n))/2;
    y = h/6 .* (q2fun(-10) + q2fun(x) + ...
        4*sum(q2fun(mids)) + 2*sum(q2fun(xs(2:n))));
end