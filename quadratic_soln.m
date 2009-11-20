% Quadratic 
function xf = quadratic_soln(n)
fval = 0;
rand('twister',1000);
Q = rand(n,n);
b = rand(n,1);
xf = inv(Q)*b;