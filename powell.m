% Powell function

function [fval] = powell(x)
[n,w] = size(x);
fval = 0;
for i = 1:n,
  if mod(i,n) == 1,
      fval = fval + x(4*i - 3) + 10*(x(4*i-2));
  elseif mod(i,n) == 2,
      fval = fval + sqrt(5)*((x(4*i - 1)) - x(4*i));
  elseif mod(i,n) == 3,
      fval = fval + (x(4*i-2) - 2*(x(4*i-1)))^2
  elseif mod(i,n) == 0,
      fval = fval + sqrt(10) * ((x(4*i-3) - x(4*i))^2)
  end;
end;
