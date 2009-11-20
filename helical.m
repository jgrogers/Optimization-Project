% Helical valley function function
function [fval] = helical(x)
[n,w] = size(x);
fval = 0;
fval = fval + 10 * (x(3) - 10*(1/(2*pi)* arctan(x(2)/x(1))* x(1)*x(2));
fval = fval + 10 * ((x(1)^2 + x(2)^2)^0.5 -1);
fval = fval + x(3);
