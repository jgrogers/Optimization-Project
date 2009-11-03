function iter = CGFR(fn, grad, x0,eps)
fk = feval(fn, x0);
gk = feval(grad, x0);
pk = -gk;
xk = x0;
iter = 1;
[width,height] = size(x0);
while norm(gk) > eps
    if mod(iter,width) == 0
        %pk = -gk;
        
    end
    fk = feval(fn,xk);
    [retcode, ax, af, ag, alpha] = linesearch(fn,grad, width, xk, fk, gk, pk, 1.0, 1);
    ak = alpha;%feval(step, fn, prob, gk,-pk, xk);
    xkp1 = xk + ak*pk;
    gkp1 = feval(grad,xkp1);
    bkp1 = gkp1'*gkp1 / (gk'*gk);
    pk = -gkp1 + bkp1*pk;
    iter = iter + 1;
    xk = xkp1;
    gk = gkp1;
end
xk
