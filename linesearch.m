%%  function to compute alpha that min. the function f(x+alpha*d)  
%%  
%%  The algorithm is as given in Practical Optimization by R. Fletcher,
%%  page 33 through 39.

function [retcode, ax, af, ag, alpha] = linesearch(fn,grad, n, x, f, g, d, initalpha, prob);

%% define parameters
  
sigma   = 0.1;               %% Wolfe Powell parameter
rho     = 0.01;              %% Goldstein parameter
tau1    = 9.0;               %% preset factor for jump of alpha
tau2    = 0.1;               %% preset factor for alpha in sectioning
tau3    = 0.5;               %% preset factor for alpha in sectioning
lowerbd = -1.0e20;           %% lower bound of objective function

[retcode, ax, af, ag, alpha] = bracketing(fn, grad, n, x, f, g, d, initalpha, prob, sigma, rho, tau1, tau2, tau3, lowerbd);
