% Quadratic  grad
function grad = quadratic_grad(x)
[n,w] = size(x);
fval = 0;
rand('twister',1000');
Q = rand(n,n);
b = rand(n,1);
grad = Q*x -b;
