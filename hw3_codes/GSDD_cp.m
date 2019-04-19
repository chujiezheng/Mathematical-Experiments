function [xG,k,XX]=GSDD_cp(a,b,tol,xG)
% Gauss-Seidel iteration
D=diag(diag(a));
L=-(tril(a)-D);  U=-(triu(a)-D);
BG = (D-L)\U; fG = (D-L)\b;

XX=xG;

k=0;
while norm(a*xG-b)/norm(b)>tol  % ���þ���Ҫ�� 
    k=k+1;  % ��¼��������
    xG=BG*xG+fG;
    XX=[XX,xG];
end

