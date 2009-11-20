sz = 8;
%[Q,b,xs ] = GenerateQuadratic(sz);
fn = 'rosenbrock';
%fn = 'trignometric';
%fn = 'wood';
%fn = 'quadratic';
start = sprintf('%s_start',fn);
grad = sprintf('%s_grad',fn);
soln = sprintf('%s_soln',fn);
xo = feval(start, sz);%rand(sz,1);%rand(sz, 1);
xf = feval(soln, sz)
eta = 1e-6;
tic 
GD_inexact(fn, grad, xo, eta)
toc
%tic
%GD('EvaluateQuadratic','QuadraticGradient','ExactQuadraticLineSearch',[Q,b], xo, eta)
%toc
%tic
%GD('EvaluateQuadratic','QuadraticGradient','ArmijoRule',[Q,b], xo, eta)
%toc
%tic
%NM('EvaluateQuadratic','QuadraticGradient','QuadraticHessian',[Q,b], xo,
%eta)
%toc
tic
CGFR(fn,grad,xo, eta)
toc
tic
CGPR(fn,grad,xo, eta)
toc
tic
BFGS(fn,grad,xo, eta)
toc
tic
LimBFGS(fn,grad,xo, eta,5) % memory 
toc
