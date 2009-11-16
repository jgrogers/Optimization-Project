sz = 10;
%[Q,b,xs ] = GenerateQuadratic(sz);
%fn = 'rosenbrock';
fn = 'trignometric';
start = sprintf('%s_start',fn);
grad = sprintf('%s_grad',fn);
soln = sprintf('%s_soln',fn);
xo = feval(start, sz);%rand(sz,1);%rand(sz, 1);
xf = feval(soln, sz)
%tic 
%GD_inexact(fn, grad, xo, 0.0000000001)
%toc
%tic
%GD('EvaluateQuadratic','QuadraticGradient','ExactQuadraticLineSearch',[Q,b], xo, 0.001)
%toc
%tic
%GD('EvaluateQuadratic','QuadraticGradient','ArmijoRule',[Q,b], xo, 0.001)
%toc
%tic
%NM('EvaluateQuadratic','QuadraticGradient','QuadraticHessian',[Q,b], xo, 0.001)
%toc
%tic
%CGFR(fn,grad,xo, 0.01)
%toc
tic
CGPR(fn,grad,xo, 0.000000001)
toc
%tic
%BFGS(fn,grad,xo, 0.00000000000001)
%toc
%tic
%LimBFGS(fn,grad,xo, 0.001)
%toc
