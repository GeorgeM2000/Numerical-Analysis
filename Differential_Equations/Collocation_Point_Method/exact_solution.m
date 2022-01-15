function y = exact_solution (x)
  y = -x + (exp(x)/(2*sinh(1))) - (exp(-x)/(2*sinh(1)));
  
endfunction
