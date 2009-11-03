% Rosenbrock's function

function [fval] = rosenbrock(x)
[n,w] = size(x);
fval = 0;
for i = 2:n;
  fval = fval + 100*(x(i) - x(i-1)^2)^2;
end;
fval = fval + (1 - x(1))^2;
