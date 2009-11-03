% Rosenbrock's function

function [grad] = rosenbrock_grad(x)
[n,w] = size(x);
grad = zeros(n,1); 
for i = 2:n-1;
  grad(i) = -400*(x(i+1)-x(i)^2)*x(i) + 200*(x(i)- x(i-1)^2);
end;
grad(1) = -400*(x(2)-x(1)^2)*x(1) - 2*(1-x(1));
grad(n) = 200*(x(n) - x(n-1)^2);
