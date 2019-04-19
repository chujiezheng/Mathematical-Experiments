function f = qaddfun(v, n,lambda)
% y: (n, n), v: (n, n)
h = 1/(n+1);
f = zeros(n, n);
u = zeros(n+2,n+2);
for i=2:n+1
    u(i,2:n+1) = v(i-1,1:n);
end

for i=2:n+1
    for j=2:n+1
        f(i-1,j-1) = u(i-1,j)+u(i+1,j)+u(i,j-1)+u(i,j+1)-...
            4*u(i,j)+lambda*h^2*exp(u(i,j));
    end
end
