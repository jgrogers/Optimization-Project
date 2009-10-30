function iter = LinearCG(grad, step, prob, x0,eps)
r0 = 
xk = GradientDescentStep(grad,step,prob,x0);
err = norm(xk-x0);
iter = 1;
while err > eps
    errs(iter)= err;
    xkp1 = GradientDescentStep(grad,step,prob,xk);
    err = norm(xkp1-xk);
    xk = xkp1;
    iter = iter + 1;
end
plot(errs);
xk
