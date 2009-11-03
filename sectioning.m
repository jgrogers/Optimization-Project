%% function to choose the section that gives the
%% appropriate properties for alpha values 

function [retcode, ax, af, ag, alpha] = sectioning(fn, grad, n, x, ax, g, ag, d, alpha, prob, rho, tau2, tau3, sigma, a, b, f_zero, df_zero, f_a, f_b, df_a, df_b);

%% a1                lower limit of alpha bracket
%% b1                upper limit of alpha bracket
%% f_alpha
%% df_alpha

k = 1;
while k < 20;

  a1 = a + tau2*(b - a);
  b1 = b - tau3*(b - a); 
    
  alpha = interpolation(f_a, df_a, f_b, a, b, a1, b1, alpha);

  ax = x + alpha*d;
  f_alpha = feval(fn, ax);%func(n, ax, prob);

  if f_alpha > f_zero + rho*alpha*df_zero | f_alpha >= f_a;
    %% Prepare for next round.
    a = a;      f_a = f_a;     df_a = df_a;
    b = alpha;  f_b = f_alpha;
  else;
    ag = feval(grad, ax);
    df_alpha = d'*ag; 

    if abs(df_alpha) <= -sigma*df_zero;
      retcode = 0; af = f_alpha;
      return;
    end;
   
    if (b - a)*df_alpha >= 0.0;
      b = a; f_b = f_a; df_b = df_a;
    else;
      b = b; f_b = f_b; df_b = df_b; %% Kind of silly line, but makes a point.
    end;
   
    a = alpha; f_a = f_alpha; df_a = df_alpha;
  end;
   
  k = k+1;
   
end;

retcode = -1; af = f_alpha;
