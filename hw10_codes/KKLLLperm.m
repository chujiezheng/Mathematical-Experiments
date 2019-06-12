function p = KKLLLperm(A)

rng('shuffle')
n = length(A);
B = rand(n);
B = (B>1/3).*(B<2/3)+(-1/2+sqrt(3)/2*1i)*(B<1/3)+(-1/2-sqrt(3)/2*1i)*(B>2/3);
B = B.*A;
p = det(B);
p = p*p';