function [xJ,k,XX]=JacDD(A,b,m,tol)
% Jacobi iteration
D=diag(diag(A));  n=length(A);
L=-(tril(A)-D);  U=-(triu(A)-D);

fJ=D\b;   
BJ=D\(L+U);  % Jacobi ��������

xJ=zeros(n,1); XX=xJ;
k=0; 
while norm(A*xJ-b)/norm(b)>tol && k<m  % ���þ���Ҫ��
    k=k+1;  % ��¼��������
    xJ=BJ*xJ+fJ;
    XX=[XX,xJ];
end

