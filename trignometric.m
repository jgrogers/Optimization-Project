% Trignometric function
% Translated from Fortran at http://people.sc.fsu.edu/~burkardt/f_src/test_opt/test_opt.f90
function [fval] = trignometric(x)
[n,w] = size(x);
fval = 0;
s1 = 0;
for i = 1:n
   s1 = s1 + cos(x(i));
end
for j = 1:n
    t = n + j - sin(x(j)) - s1 - j * cos(x(j));
    fval = fval + t*t;
end


%for i = 1:n
%    fival = 0;
%    for j = 1:n
%        fival = fival + (cos(x(j))+i*(1-cos(x(i)))-sin(x(i)));
%    end
%    
%  fval = fval + n - fival;
%end
