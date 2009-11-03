sz = 10;
%[Q,b,xs ] = GenerateQuadratic(sz);
xo = rand(sz,1);%rand(sz, 1);

tic 
GD_inexact('rosenbrock', 'rosenbrock_grad', xo, 0.1)
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
CGFR('rosenbrock','rosenbrock_grad',xo, 0.1)
toc
tic
CGPR('rosenbrock','rosenbrock_grad',xo, 0.1)
toc
tic
BFGS('rosenbrock','rosenbrock_grad',xo, 0.1)
toc
