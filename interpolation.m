%% function to generate next choose of alpha by
%% quadratic interpolation

function alpha = interpolation(f_a, df_a, f_b, a, b, a1, b1, alpha);

za1 = f_a + df_a*(a1 - a) + (f_b - f_a - (b-a)*df_a)*(a1 - a)*(a1 - a)/((b - a)*(b - a));
zb1 = f_a + df_a*(b1 - a) + (f_b - f_a - (b-a)*df_a)*(b1 - a)*(b1 - a)/((b - a)*(b - a));
if za1 < zb1; endptmin = a1;
else endptmin = b1; end;
root = a - (b-a)*(b-a)*df_a/(2*(f_b - f_a - (b-a)*df_a));

if f_b - f_a - (b-a)*df_a < 0;         %% Opens downward.
  if a1 < b1;
    if a1 <= root & root <= b1; alpha = endptmin; end;
    if root < a1; alpha = b1; end;
    if root > b1; alpha = a1; end;
  else;
    if b1 <= root & root <= a1; alpha = endptmin; end;
    if root < b1; alpha = a1; end;
    if root > a1; alpha = b1; end;
  end;
else;                                  %% Opens upward.
  if a1 < b1;
    if a1 <= root & root <= b1; alpha = root; end;
    if root < a1; alpha = a1; end;
    if root > b1; alpha = b1; end;
  else;
    if b1 <= root & root <= a1; alpha = root; end;
    if root < b1; alpha = b1; end;
    if root > a1; alpha = a1; end;
  end;
end;