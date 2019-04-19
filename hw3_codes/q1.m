%% (1)
clc; clear; close

n=5;
solution = ones(n, 1);

xk=zeros(n,1);
for k=0:n-1
    xk(k+1)=1+0.1*k;
end
A1 = zeros(n, n);
for k=0:n-1
    A1(1:n,k+1) = xk.^k;
end
b1 = sum(A1, 2);

A2 = hilb(n);
b2 = sum(A2, 2);

%%
clc;
eig(A1)

D=diag(diag(A1));  n=length(A1);
L=-(tril(A1)-D);  U=-(triu(A1)-D);
BJ=D\(L+U); BG = (D-L)\U;
norm(BJ)
norm(BG)
max(eig(BJ))
max(eig(BG))

%%
clc;
eig(A2)

D=diag(diag(A2));  n=length(A2);
L=-(tril(A2)-D);  U=-(triu(A2)-D);
BJ=D\(L+U); BG = (D-L)\U;
norm(BJ)
norm(BG)
max(eig(BJ))
max(eig(BG))


%%
clc;
m=min(n,20); tol=1e-6;

[x1,~]=JacDD(A1,b1,m,tol);
[x2,~]=GSDD(A1,b1,m,tol);
x3 = pcg(A1, b1, tol, m);

norm(solution-(A1\b1))/norm(solution)
norm(solution-x1)/norm(solution)
norm(solution-x2)/norm(solution)
norm(solution-x3)/norm(solution)

%%
[x1,~]=JacDD(A2,b2,m,tol);
[x2,~]=GSDD(A2,b2,m,tol);
x3 = pcg(A2, b2, tol, m);

norm(solution-A2\b2)/norm(solution)
norm(solution-x1)/norm(solution)
norm(solution-x2)/norm(solution)
norm(solution-x3)/norm(solution)

%% (2)
clc; clear; close

for n=[5,7,9]
    xk=zeros(n,1);
    for k=0:n-1
        xk(k+1)=1+0.1*k;
    end
    A1 = zeros(n, n);
    for k=0:n-1
        A1(1:n,k+1) = xk.^k;
    end
    cond(A1)
    
    A2 = hilb(n);
    cond(A2)
end

%%
clc; clear; close

eps = 1e-6;
n=12;
solution = ones(n, 1);

xk=zeros(n,1);
for k=0:n-1
    xk(k+1)=1+0.1*k;
end
A1 = zeros(n, n);
for k=0:n-1
    A1(1:n,k+1) = xk.^k;
end
b1 = sum(A1, 2);

A2 = hilb(n);
b2 = sum(A2, 2);

%%
clc;
delta = zeros(n, n);
delta(n, n) = eps;

m=min(n,20); tol=1e-6;

(A1+delta)\b1
norm(solution-(A1+delta)\b1)/norm(solution)
x = pcg(A1+delta, b1)
norm(solution-x)/norm(solution)
norm(delta)/norm(A1)*cond(A1)


(A2+delta)\b2
norm(solution-(A2+delta)\b2)/norm(solution)
x = pcg(A2+delta, b2)
norm(solution-x)/norm(solution)
norm(delta)/norm(A2)*cond(A2)

%%
clc;
delta = zeros(n, 1);
delta(n) = eps;

A1\(b1+delta)
norm(solution-A1\(b1+delta))/norm(solution)
x  = pcg(A1, b1+delta)
norm(solution-x)/norm(solution)
norm(delta)/norm(b1)*cond(A1)

A2\(b2+delta)
norm(solution-A2\(b2+delta))/norm(solution)
x = pcg(A2, b2+delta)
norm(solution-x)/norm(solution)
norm(delta)/norm(b2)*cond(A2)

