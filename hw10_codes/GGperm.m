function p = GGperm(A)

rng('shuffle')
n = length(A);
B = (rand(n)<1/2)*2-1;
B = B.*A;
p = det(B)^2;