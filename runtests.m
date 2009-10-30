sz = 5;
[Q,b,xs ] = GenerateQuadratic(sz);
xo = rand(sz, 1);
tic
GD('EvaluateQuadratic','QuadraticGradient','ExactQuadraticLineSearch',[Q,b], xo, 0.001)
toc
tic
GD('EvaluateQuadratic','QuadraticGradient','ArmijoRule',[Q,b], xo, 0.001)
toc
tic
NM('EvaluateQuadratic','QuadraticGradient','QuadraticHessian',[Q,b], xo, 0.001)
toc
tic
CGFR('EvaluateQuadratic','QuadraticGradient','ArmijoRule',[Q,b],xo, 0.001)
toc