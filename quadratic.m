% Quadratic 
function [fval] = quadratic(x)
[n,w] = size(x);
fval = 0;
rand('twister',1000');
Q = rand(n,n);
b = rand(n,1);
fval = 1/2 * x'*Q*x -b'*x;

