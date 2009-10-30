function H = QuadraticHessian(Qb,x)
[rows,cols] = size(Qb);
Q = Qb(:,1:cols-1);
b = Qb(:,cols);
H = Q;
