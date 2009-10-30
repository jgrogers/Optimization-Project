function xkp1 = GradientDescentStep(fn, grad, step, prob, xk)
gk = feval(grad,prob,xk);
ak = feval(step, fn, prob, gk, gk, xk);
xkp1 = xk + ak * gk;
