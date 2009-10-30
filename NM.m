function iter = NM(fn, grad, hess, prob, x0,eps)

xk = NewtonMethodStep(grad,hess, prob,x0);
preval = feval(fn,prob,xk);
err = abs(preval - feval(fn,prob,x0));
iter = 1;
errs(iter)= err;
while err > eps
    xkp1 = NewtonMethodStep(grad,hess,prob,xk);
    newval = feval(fn,prob,xkp1);
    err = abs(newval - preval);
    preval = newval;
    err = norm(xkp1-xk);
    xk = xkp1;
    iter = iter + 1;
    errs(iter)=err;
end
plot(errs);
xk;
