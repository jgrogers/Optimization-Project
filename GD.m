function iter = GD(fn, grad, step, prob, x0,eps)

preval = feval(fn,prob,x0)
xk = GradientDescentStep(fn, grad,step,prob,x0)
newval = feval(fn,prob,xk)
err = abs(preval - newval)
iter = 1;    
errs(iter)= err;

while norm(feval(grad,prob,xk)) > eps
    xkp1 = GradientDescentStep(fn, grad,step,prob,xk);
    newval = feval(fn,prob,xkp1);
    err = abs(newval - preval);
    preval = newval;
    xk = xkp1;
    iter = iter + 1;
    errs(iter)= err;

end
plot(errs);
xk;
