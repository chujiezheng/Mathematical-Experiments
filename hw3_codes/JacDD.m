function [xJ,k,XX]=JacDD(A,b,m,tol)
% Jacobi iteration
D=diag(diag(A));  n=length(A);
L=-(tril(A)-D);  U=-(triu(A)-D);

fJ=D\b;   
BJ=D\(L+U);  % Jacobi 迭代矩阵

xJ=zeros(n,1); XX=xJ;
k=0; 
while norm(A*xJ-b)/norm(b)>tol && k<m  % 设置精度要求
    k=k+1;  % 记录迭代次数
    xJ=BJ*xJ+fJ;
    XX=[XX,xJ];
end

