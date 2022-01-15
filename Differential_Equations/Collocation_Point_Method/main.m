% Mesah generation
x = [];
x(1) = 0; x(2) = 0.25; x(3) = 0.5; x(4) = 1;
%x = 0:0.1:1;


[A, U, F] = coefficient_matrix(x, 0, -1, 0, 0);
A   % Polynomial matrix
F   % Load vector
U   % Coefficient matrix


x2 = 0:0.05:1; k2 = length(x2);
u_exact = [];
u_cpm = [];

printf("i     x       cpm       exact     err\n");
for i=1:k2
  
  u_exact(i) = exact_solution(x2(i));   % Exact solution at x2(i) point
  u_cpm(i) = cpm_solution(x2(i), U);    % Collocation point solution at x2(i) point
  
  local_err = norm(u_cpm(i) - u_exact(i), inf);   % Local error
  
  printf("%d    %.3f    %.3f    %.3f    %.3f\n",i, x2(i), u_cpm(i), u_exact(i), local_err);
endfor


error = norm(u_cpm - u_exact, inf);

plot(x2,u_cpm,':', x2,u_exact) % Solid: the exact, Dotted: CP solution
hold; plot(x2,u_cpm,'o') % Mark the solution at nodal points
xlabel('x'); ylabel('u(x) & u_{cp}(x)');
title('Solid line: Exact solution, Dotted line: CP solution')

