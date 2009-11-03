function iter = GD_inexact(fn, grad, x0,eps)

preval = feval(fn, x0)
xk = GradientDescentStep_inexact(fn, grad,x0)
newval = feval(fn,xk)
err = abs(preval - newval)
iter = 1;    
errs(iter)= err;

while norm(feval(grad, xk)) > eps
    xkp1 = GradientDescentStep_inexact(fn, grad,xk);
    newval = feval(fn, xkp1);
    err = abs(newval - preval);
    preval = newval;
    xk = xkp1;
    iter = iter + 1;
    errs(iter)= norm(feval(grad,xk));%err;
    plot(errs);
end
plot(errs);
xk
