%% function bracketing to get a bracket trial for alpha

function [retcode, ax, af, ag, alpha] = bracketing(n, x, f, g, d, initalpha, prob, sigma, rho, tau1, tau2, tau3, lowerbd);

%% a                  one value of alpha bracket
%% b                  another value of alpha bracket
%% a1                 lower limit of updated alpha
%% b1                 upper limit of updated alpha
%% mu                 upper bound of initial guess for alpha
%% f_zero             alpha function at alpha = 0
%% df_zero            derivative of alpha function at alpha = 0
%% f_a                alpha function value at alpha = a
%% df_a               derivative of alpha function at alpha = a 
%% f_b                alpha function at b
%% df_b               derivative of alpha function at alpha = b 
   alpha_prev = 0.0;  %% previous value of alpha, initially 0
%% f_a_prev           alpha function value at prev alpha value
%% df_a_prev          alpha function value at prev alpha value
%% f_alpha_prev  
%% df_alpha_prev
%% f_alpha
%% df_alpha;

f_alpha_prev = f; f_zero = f;
df_alpha_prev = d'*g; df_zero = df_alpha_prev;

mu = (lowerbd - f_zero)/(rho*df_zero);
alpha = initalpha;  

k = 1;
while k < 20;

  ax = x + alpha*d;
  f_alpha = func(n, ax, prob);

  if f_alpha <= lowerbd; %% This really should never occur.
     retcode = -1; af = f_alpha; ag = zeros(n,1);
     return;
  end;
  
  if f_alpha > f_zero + alpha*rho*df_zero | f_alpha >= f_alpha_prev;
    a = alpha_prev; f_a = f_alpha_prev; df_a = df_alpha_prev;
    b = alpha;     f_b = f_alpha;
    ag = zeros(n,1);  %% Just initialize ag to avoid problems.
    [retcode, ax, af, ag, alpha] = sectioning(n, x, ax, g, ag, d, alpha, prob, rho, tau2, tau3, sigma, a, b, f_zero, df_zero, f_a, f_b, df_a, 0);
    return;
  end;
   
  ag = grad(n, ax, prob);
  df_alpha = d'*ag;

  if abs(df_alpha) <= -sigma*df_zero;
    retcode = 0; af = f_alpha;
    return;
  end;

  if df_alpha >= 0.0;
    a = alpha;      f_a = f_alpha;      df_a = df_alpha;
    b = alpha_prev; f_b = f_alpha_prev; df_b = df_alpha_prev;
    [retcode, ax, af, ag, alpha] = sectioning(n, x, ax, g, ag, d, alpha, prob, rho, tau2, tau3, sigma, a, b, f_zero, df_zero, f_a, f_b, df_a, 0);
    return;
  end;
  
  if mu <= (2*alpha - alpha_prev);
    alpha_prev = alpha;
    f_alpha_prev = f_alpha;
    df_alpha_prev = df_alpha;
    alpha = mu;
  else;
    %% Store value of alpha before interpolation.
    tempval = alpha;
    %% Prepare for interpolation.
    a = alpha_prev; f_a = f_alpha_prev; df_a = df_alpha_prev;
    b = alpha;      f_b = f_alpha;      df_b = df_alpha;
    a1 = 2*alpha - alpha_prev; 
    b1 = min(mu, alpha + tau1*(alpha - alpha_prev));
    %% Do interpolation.
    alpha = interpolation(f_a, df_a, f_b, a, b, a1, b1, alpha);
    %% Prepare for next round.
    alpha_prev = tempval;
    f_alpha_prev = f_alpha;
    df_alpha_prev = df_alpha;
  end;
   
  k = k+1;
   
end;

retcode = -1;
