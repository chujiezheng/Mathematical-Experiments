function y = q32fun_year(r)
y = (1+r).^20 .* (45-r*500) - 45; % divided by 1000