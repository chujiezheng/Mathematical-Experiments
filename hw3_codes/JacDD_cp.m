function [xJ,k,XX]=JacDD_cp(a,b,tol, xJ)
% Jacobi iteration
D=diag(diag(a));
L=-(tril(a)-D);  U=-(triu(a)-D);
BJ=D\(L+U); fJ = D\b;

XX=xJ;
k=0; 
while norm(a*xJ-b)/norm(b)>tol  % ���þ���Ҫ��
    k=k+1;  % ��¼��������
    xJ=BJ*xJ+fJ;
    XX=[XX,xJ];
end

