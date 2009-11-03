function f = EvaluateQuadratic(Qb,x)
[rows,cols] = size(Qb);
Q = Qb(:,1:cols-1);
b = Qb(:,cols);
f = 0.5*x'*Q*x - b'*x;
