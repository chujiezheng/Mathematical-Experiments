%%
clc; clear; close
n = 20;
a1 = sparse(1:n, 1:n, 3, n, n);
a2 = sparse(1:n-1, 2:n, -1/2, n, n);
a3 = sparse(1:n-2, 3:n, -1/4, n, n);
a = a1+a2+a2'+a3+a3';

condest(a)

sum(eig(a)>0) == n

D=diag(diag(a));
L=-(tril(a)-D);  U=-(triu(a)-D);
BJ=D\(L+U); BG = (D-L)\U;
max(eigs(BJ))
max(eigs(BG))


%%
clc;
x = rand(n,1);
b = a * x;
tol = 1e-6;

for r = [-500, -100, -10, -2, 0, 2, 10, 100, 500]
    x0 = rand(n, 1)+r;
    [x1,k1, XX1] = JacDD_cp(a, b,tol, x0);
    [x2,k2, XX2] = GSDD_cp(a, b, tol, x0);
    k1
    k2
end

%%
clc;
x = rand(n,1);
b = a * x;
tol = 1e-12;

K1 = [];
K2 = [];
u = 1;
for r = 0:5:500
    r = pow2(r);
    x0 = rand(n, 1)+r;
    [x1,k1, XX1] = JacDD_cp(a, b,tol, x0);
    [x2,k2, XX2] = GSDD_cp(a, b, tol, x0);
    K1(u) = k1; K2(u) = k2; u = u+1;
end

set(gcf, 'position', [0 0 960 480]);
plot(K1, 'r-', 'Linewidth', 2);
hold on;
plot(K2, 'b-', 'Linewidth', 2);

%%
clc; clear; close
n = 20;

re = zeros(11, 1);
j = 1;
for scale = 0:5:50
    scale = pow2(scale)
    a1 = sparse(1:n, 1:n, 3, n, n);
    a2 = sparse(1:n-1, 2:n, -1/2, n, n);
    a3 = sparse(1:n-2, 3:n, -1/4, n, n);
    a = a1+a2+a2'+a3+a3';

    x = ones(n,1);
    b = a * x;
    tol = 1e-5;
    xJ = ones(n,1)+1e250;
    x0 = ones(n, 1);

    a = a + diag(diag(a)) * scale;

    D=diag(diag(a));
    L=-(tril(a)-D);  U=-(triu(a)-D);
    BJ=D\(L+U); fJ = D\b;
    max(eigs(BJ))

    k = 0;
    while norm(xJ-x0,inf) >= tol
        k = k + 1;
        x0 = xJ;
        xJ=BJ*x0+fJ;
    end
    k
    re(j) = k;

    j = j + 1;
end

%%

clc; clear; close
n = 20;

re = zeros(11, 1);
j = 1;
for scale = 0:5:50
    scale = pow2(scale)
    a1 = sparse(1:n, 1:n, 3, n, n);
    a2 = sparse(1:n-1, 2:n, -1/2, n, n);
    a3 = sparse(1:n-2, 3:n, -1/4, n, n);
    a = a1+a2+a2'+a3+a3';

    x = ones(n,1);
    b = a * x;
    tol = 1e-5;
    xG = ones(n,1)+1e250;
    x0 = ones(n, 1);

    a = a + diag(diag(a)) * scale;

    D=diag(diag(a));
    L=-(tril(a)-D);  U=-(triu(a)-D);
    BG = (D-L)\U; fG = (D-L)\b;
    max(abs(eigs(BG)))

    k = 0;
    while norm(xG-x0,inf) >= tol
        k = k + 1;
        x0 = xG;
        xG=BG*xG+fG;
    end
    k
    re(j) = k;

    j = j + 1;
end
