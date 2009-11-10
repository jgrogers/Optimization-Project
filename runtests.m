sz = 10;
%[Q,b,xs ] = GenerateQuadratic(sz);
xo = rand(sz,1);%rand(sz, 1);
fn = 'rosenbrock';
grad = sprintf('%s_grad',fn);
tic 
GD_inexact(fn, grad, xo, 0.1)
toc
%tic
%GD('EvaluateQuadratic','QuadraticGradient','ExactQuadraticLineSearch',[Q,b], xo, 0.001)
%toc
%tic
%GD('EvaluateQuadratic','QuadraticGradient','ArmijoRule',[Q,b], xo, 0.001)
%toc
%tic
%NM('EvaluateQuadratic','QuadraticGradient','QuadraticHessian',[Q,b], xo, 0.001)
%toc
tic
CGFR(fn,grad,xo, 0.1)
toc
tic
CGPR(fn,grad,xo, 0.1)
toc
tic
BFGS(fn,grad,xo, 0.1)
toc
tic
LimBFGS(fn,grad,xo, 0.1)
toc
