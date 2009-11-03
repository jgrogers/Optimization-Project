function xkp1 = GradientDescentStep_inexact(fn, grad, xk)
gk = feval(grad,xk);
fk = feval(fn,xk);
[n,w] = size(xk);
[retcode, ax, af, ag, alpha] = linesearch(fn,grad, n, xk, fk, gk, -gk, 1.0, 1);
ak = alpha;
xkp1 = xk - ak * gk;
