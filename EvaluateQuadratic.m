function f = EvaluateQuadratic(Qb,x)
[rows,cols] = size(Qb);
Q = Qb(:,1:cols-1);
b = Qb(:,cols);
f = x'*Q*x - b'*x;
