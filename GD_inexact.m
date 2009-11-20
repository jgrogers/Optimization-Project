function iter = GD_inexact(fn, grad, x0,eps)

[n,w] = size(x0);%for line search procedure
figure(1)
title (sprintf('Gradient Descent - %s',fn));
hold on
fk = feval(fn, x0)
gk = feval(grad,x0);
errs(1)= norm(gk);
iter = 2;
xk = x0;
while norm(gk) > eps
    [retcode, ax, af, ag, alpha] = linesearch(fn,grad, n, xk, fk, gk, -gk, 1.0, 1);
    xkp1 = xk - alpha * gk;
    fkp1 = feval(fn, xkp1);
    xk = xkp1;
    fk = fkp1;
    gk = feval(grad,xk);
    iter = iter + 1;
    errs(iter)= norm(gk);
end
plot(log(errs));
xk
hold off