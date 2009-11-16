% Rosenbrock's function

function x0 = rosenbrock_start(n)

x0 = zeros(n,1);

for  i = 1:n
   if mod(i,2) == 1 
       x(i) = -1.2;
   else
       x(i) = 1.0;
   end
end