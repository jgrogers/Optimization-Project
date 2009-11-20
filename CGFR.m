function iter = CGFR(fn, grad, x0,eps)
figure(2)
title (sprintf('CG:Fletcher-Reeves - %s',fn));

hold on
fk = feval(fn, x0);
gk = feval(grad, x0);
pk = -gk;
xk = x0;
iter = 1;
[width,height] = size(x0);
errs(1) = norm(gk);
restarts = 0;
while norm(gk) > eps
    if mod(iter,width) == 0
        %pk = -gk;
        
    end
    fk = feval(fn,xk);
    [retcode, ax, af, ag, alpha] = linesearch(fn,grad, width, xk, fk, gk, pk, 1.0, 1);
    xkp1 = xk + alpha*pk;
    gkp1 = feval(grad,xkp1);
    if (abs(gkp1'*gk)/(norm(gkp1)^2) >= 0.1) %restart condition
        bkp1 = 0;
        restarts = restarts + 1;
    else 
        bkp1 = gkp1'*gkp1 / (gk'*gk);
    end
    pk = -gkp1 + bkp1*pk;
    iter = iter + 1;
    xk = xkp1;
    gk = gkp1;
    errs(iter) = norm(gk);
end
plot (log(errs));
restarts
xk
hold off
