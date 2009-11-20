% Wood function
function [fval] = wood(x)
[n,w] = size(x);
fval = 0;

fval = 100*(x(1)^2 - x(2))^2 + (1-x(1))^2 + 90 * (x(3)^2 - x(4))^2;
fval = fval + (1-x(3))^2 + 10.1*((1-x(2))^2 + (1-x(4))^2)+ 19.8*(1-x(2))*(1-x(4));
