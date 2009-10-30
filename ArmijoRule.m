function ak = ArmijoRule(fn,prob, g, p, x)
s = 1.0;
d = 0.1;
b = 0.5;
iter = 0;
fxk = feval(fn, prob, x);
ak = s;
while (feval(fn,prob, x+ak*p) - fxk > d * p'*g)
   iter = iter + 1;
    ak = s * b^iter;  
end
ak;
