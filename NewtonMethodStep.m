function xkp1 = NewtonMethodStep(grad, hess, prob, xk)
gk = feval(grad,prob,xk);
hk = feval(hess, prob, xk);
xkp1 = xk - inv(hk) * gk;
