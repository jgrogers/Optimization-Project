function iter = BFGS(fn, grad, x0,eps)
figure(4)
title (sprintf('QuasiNewton-BFGS - %s',fn));

hold on
fk = feval(fn, x0);
gk = feval(grad, x0);
xk = x0;
iter = 1;
[width,height] = size(x0);
Hk = eye(width,width);
errs(1) = norm(gk);
while norm(gk) > eps
    pk = -Hk*gk;
    [retcode, ax, af, ag, alpha] = linesearch(fn,grad, width, xk, fk, gk, pk, 1.0, 1);
    xkp1 = xk + alpha*pk;
    gkp1 = feval(grad,xkp1);
    sk = xkp1 - xk;
    yk = gkp1 - gk;
    rhok = 1/(yk'*sk);
    bk = eye(width,width) - rhok*sk*yk';
    ck = eye(width,width) - rhok*yk*sk';
    dk = rhok*sk*sk';
    Hkp1 = bk*Hk*ck+dk;
    iter = iter + 1;
    xk = xkp1;
    gk = gkp1;
    Hk = Hkp1;
    errs(iter) = norm(gk);
end
plot (log(errs));
xk
hold off
