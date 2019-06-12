function p = Rperm(A)

rng('shuffle')
n = length(A);
B = randn(n);
B = B.*A;
p = det(B)^2;