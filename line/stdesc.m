function [x, f] = stdesc(n, x, iter, prob);

f = func(n, x, prob);
g = grad(n, x, prob);

for i = 1:iter;
  if norm(g) < 1.0e-5;
    fprintf('Norm of gradient small.\n');
    break;
  end;
  [retcode, x, f, g, alpha] = linesearch(n, x, f, g, -g, 1, prob);
  if retcode < 0;
    fprintf('Could not find good stepsize.\n');
    break;
  end;
  fprintf('i = %5d, v = %.5f\n', i, f);
end;
