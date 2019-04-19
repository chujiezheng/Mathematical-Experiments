function [xS,k,XX]=SORDD(A,b,m,tol,w)
% SOR iteration
n=length(A);  D=diag(diag(A));
L=-tril(A-D);  U=-(triu(A)-D);

fS=(D-w*L)\(w*b);   
BS=(D-w*L)\((1-w)*D+w*U);  % SOR ��������

xS=ones(n,1); XX=xS;

k=0;

while norm(A*xS-b)/norm(b)>tol && k<m  % ���þ���Ҫ�� 
    k=k+1;  % ��¼��������
    xS=BS*xS+fS;
    XX=[XX,xS];
end
