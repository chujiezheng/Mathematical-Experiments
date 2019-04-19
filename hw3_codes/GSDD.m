function [xG,k,XX]=GSDD(A,b,m,tol)
% Gauss-Seidel iteration
n=length(A);  D=diag(diag(A));
L=tril(A);  U=-(triu(A)-D);

fG=L\b;   
BG=L\U;  % Gauss-Seidel ��������

xG=zeros(n,1); XX=xG;

k=0;
while norm(A*xG-b)/norm(b)>tol && k<m  % ���þ���Ҫ�� 
    k=k+1;  % ��¼��������
    xG=BG*xG+fG;
    XX=[XX,xG];
end

