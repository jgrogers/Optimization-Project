
% Trignometric function
%Translated from Fortran at http://people.sc.fsu.edu/~burkardt/f_src/test_opt/test_opt.f90
function [fval] = trignometric_grad(x)
[n,w] = size(x);
fval = 0;
grad = zeros(n,1);

s1 = sum(cos(x));
s2 = 0.0;
for j = 1:n
    t = n+j - sin(x(j)) - s1 - j*cos(x(j));
    s2 = s2 + t;
    grad(j) = j * sin(x(j)) - cos(x(j)) * t;
end
for j = 1:n
    grad(j) = 2.0 * (grad(j) * sin(x(j)) * s2);
end

    
%for i = 1:n
%    fival = 0;
%    for j = 1:n
%        fival = fival + (cos(x(j))+i*(1-cos(x(i)))-sin(x(i)))
%    end
    
%  fval = fval + n - fival;
%end
