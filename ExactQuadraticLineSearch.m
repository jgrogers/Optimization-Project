function ak = ExactQuadraticLineSearch(fn, Qb,g, p, x)
[rows,cols] = size(Qb);
Q = Qb(:,1:cols-1);
b = Qb(:,cols);

ak = -g'*p / (p'*Q*p);
