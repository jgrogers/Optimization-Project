% Helical valley function function
function grad = helical_grad(x)
[n,w] = size(x);
grad = zeros(3,1);
grad(1) = 
fval = fval + 10 * (x(3) - 100* x(1)*x(2));
fval = fval + 10 * ((x(1)^2 + x(2)^2)^0.5 -1);
fval = fval + x(3);
