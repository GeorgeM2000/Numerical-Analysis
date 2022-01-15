function px = cpm_solution (xp, U)
  % Collocation point solution is in the form p(x) = a0 + a1x + a2x^2 + ... + anx^n
  
  M = length(U);
  px = 0;
  for i=1:M
    px = px + (U(i)*xp^(i-1));
  endfor
endfunction
