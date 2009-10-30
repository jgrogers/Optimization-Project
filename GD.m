function iter = GD(fn, grad, step, prob, x0,eps)

xk = GradientDescentStep(fn, grad,step,prob,x0);
preval = feval(fn,prob,xk);
err = abs(preval - feval(fn,prob,x0));
iter = 1;    
errs(iter)= err;

while err > eps
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
