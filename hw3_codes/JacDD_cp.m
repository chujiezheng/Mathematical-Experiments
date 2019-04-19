function [xJ,k,XX]=JacDD_cp(a,b,tol, xJ)
% Jacobi iteration
D=diag(diag(a));
L=-(tril(a)-D);  U=-(triu(a)-D);
BJ=D\(L+U); fJ = D\b;

XX=xJ;
k=0; 
while norm(a*xJ-b)/norm(b)>tol  % 设置精度要求
    k=k+1;  % 记录迭代次数
    xJ=BJ*xJ+fJ;
    XX=[XX,xJ];
end

