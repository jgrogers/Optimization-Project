function iter = LimBFGS(fn, grad, x0, eps,m)
%  Method stores history of 5 vectors
figure(5)
title (sprintf('Limited Memory-BFGS - %s',fn));

hold on
[width,height] = size(x0);

fk = feval(fn, x0);
gk = feval(grad, x0);
xk = x0;
u0 = gk;
iter = 1;
H0 = eye(width,width);
%Initialize memory variables
rhos = zeros(1, m);
ys = zeros(width,m);
ss = zeros(width,m);
Vs = zeros(width,width,m);
Hk = H0;
while norm(gk) > eps
    errs(iter) = norm(gk);
    dk = -1 * Hk * gk;
    [retcode, ax, af, ag, alpha] = linesearch(fn, grad, width, xk, fk, gk, dk, 1.0, 1);
    xkp1 = xk + alpha*dk;
    gkp1 = feval(grad, xkp1);
    fkp1 = feval(fn, xkp1);
    sk = xkp1 - xk;
    yk = gkp1 - gk;
    ys = cat(2,yk,ys(:,1:m-1));
    ss = cat(2,sk,ss(:,1:m-1));
    rhok = 1 / (yk'*sk);
    rhos = cat(2,rhok,rhos(1:m-1));
    Vk = eye(width,width) - rhok * yk * sk';
    %Store previous Vks
    Vs = cat(3, Vk, Vs(:,:,1:m-1));
    
    %there is a problem that it is only looking at the old qk, vk, pk
    mhat = min(m-1, iter);
    V1 = eye(width,width);
    V2 = eye(width,width);
    for (i = 1:mhat) 
       V1 = V1 * Vs(:,:,i)';
       V2 = Vs(:,:,i) * V2;
    end
    Hkp1 = V1 * H0 * V2;

    for i=1:mhat 
        V1 = eye(width,width);
        V2 = eye(width,width);
        for (j = 1:i-1) 
           V1 = V1 * Vs(:,:,i)';
           V2 = Vs(:,:,i) * V2;
        end
        add_me = rhos(i) * V1 * ss(i)*ss(i)'*V2;
        Hkp1 = Hkp1 + add_me;
    end;
    
    %pass everything to next iteration
    Hk = Hkp1;
    xk = xkp1;
    gk = gkp1;
    fk = fkp1;
    iter = iter + 1;
end

plot(errs);
xk
hold off
