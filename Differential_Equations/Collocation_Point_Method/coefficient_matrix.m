function [A, U, F] = coefficient_matrix (x, px, qx, y0, ye)
  % Assuming that boundary conditions are in the form y(x0) = y0, y(xe) = ye
  % P(x) and Q(x) are constants
  
  
  M = length(x);
  
  A = zeros(M,M);         % Global matrix initialization
  F = zeros(M,1);         % Load vector
  
  for i=1:M
    for j=1:M
      
      % Global matrix calculations
      if i == 1 || i == M
        A(i, j) = x(i)^(j-1);   % For boundary conditions
      else
        temp_j = j - 1;
        A(i, j) = (temp_j*(temp_j - 1)*x(i)^(temp_j-2)) + (px*(temp_j*x(i)^(temp_j-1))) + (qx*(x(i)^temp_j));
      endif  
      
    endfor
    
    % Load vector calculations
    if i == 1
      F(i) = y0;
    elseif i == M
      F(i) = ye;
    else
      F(i) = f(x(i));
    endif
  endfor
  
  
  U = gauss_elimination(A,F);   % Coefficient matrix 

endfunction
