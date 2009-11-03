function iter = CGFR(fn, grad, step, prob, x0,eps)
fk = feval(fn, prob, x0);
gk = feval(grad, prob, x0);
pk = -gk;
xk = x0;
iter = 1;
[width,height] = size(prob);
while norm(gk) > eps
    if mod(iter,width) == 0
        pk = -gk;
        xk
    end
    ak = feval(step, fn, prob, gk,-pk, xk);
    xkp1 = xk + ak*pk;
    gkp1 = feval(grad,prob, xkp1);
    bkp1 = gkp1'*gkp1 / (gk'*gk);
    pk = -gkp1 + bkp1*pk;
    iter = iter + 1;
    xk = xkp1;
    gk = gkp1;
end
xk
