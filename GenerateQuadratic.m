function [Q,b,xs] = GenerateQuadratic (dim)
Q = rand(dim,dim);
Q = Q'*Q;
b = rand(dim,1);
xs = inv(Q)*b;