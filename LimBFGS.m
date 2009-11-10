function iter = LimBFGS(fn, grad, x0, eps)
%  Method stores history of 5 vectors
figure(4)
title (sprintf('Limited Memory-BFGS - %s',fn));

hold on
m = 5;

fk = feval(fn, x0);
gk = feval(grad, x0);
xk = x0;

u0 = gk;
iter = 1;
[width,height] = size(x0);
H0 = eye(width,width);
Hk = H0;
%Initialize memory variables
 Vkm5 = 0;
 Vkm4 = 0;
 Vkm3 = 0;
 Vkm2 = 0;
 Vkm1 = 0;
 Vk = 0;
 pkm5 = 1;
 pkm4 = 1;
 pkm3 = 1;
 pkm2 = 1;
 pkm1 = 1;
 pk = 1;
 qkm5 = 1;
 qkm4 = 1;
 qkm3 = 1;
 qkm2 = 1;
 qkm1 = 1;
 qk = 1;
while norm(gk) > eps
    errs(iter) = norm(gk);
    dk = -1 * Hk * gk;
    [retcode, ax, af, ag, alpha] = linesearch(fn, grad, width, xk, fk, gk, dk, 1.0, 1);
    xkp1 = xk + alpha*dk;
    gkp1 = feval(grad, xkp1);
    fkp1 = feval(fn, xkp1);

    %Store previous Vks
    Vkm5 = Vkm4;
    Vkm4 = Vkm3;
    Vkm3 = Vkm2;
    Vkm2 = Vkm1;
    Vkm1 = Vk;
    %Store previous qks
    qkm5 = qkm4;
    qkm4 = qkm3;
    qkm3 = qkm2;
    qkm2 = qkm1;
    qkm1 = qk;
    %Store previous pks
    pkm5 = pkm4;
    pkm4 = pkm3;
    pkm3 = pkm2;
    pkm2 = pkm1;
    pkm1 = pk;

    pk = xkp1 - xk;
    qk = gkp1 - gk;
    Vk = eye(width, width) - (qk*pk')/(qk'*pk);
    
    Hkp1 = (Vk'*Vkm1'*Vkm2'*Vkm3'*Vkm4')*H0*(Vkm4*Vkm3*Vkm2*Vkm1*Vk);
    Hkp1 = Hkp1 + (1/(qkm4'*pkm4))*(Vk'*Vkm1'*Vkm2'*Vkm3')*(qkm4*qkm4')*(Vkm3*Vkm2*Vkm1*Vk);
    Hkp1 = Hkp1 + (1/(qkm3'*pkm3))*(Vk'*Vkm1'*Vkm2')*(qkm3*qkm3')*(Vkm2*Vkm1*Vk);
    Hkp1 = Hkp1 + (1/(qkm2'*pkm2))*(Vk'*Vkm1')*(qkm2*qkm2')*(Vkm1*Vk);
    Hkp1 = Hkp1 + (1/(qkm1'*pkm1))*(Vk')*(qkm1*qkm1')*(Vk); 
    Hkp1 = Hkp1 + (1/(qk'*pk))*(qk*qk');
    
    Hk = Hkp1;
    xk = xkp1;
    gk = gkp1;
    fk = fkp1;
    iter = iter + 1;
end

plot(errs);
xk
hold off
