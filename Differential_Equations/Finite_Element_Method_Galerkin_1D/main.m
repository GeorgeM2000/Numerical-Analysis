% Mesh generation
x = [];
x(1)=0; x(2)=0.1; x(3)=0.3; x(4)=0.333; x(5)=0.5; x(6)=0.75;x(7)=1;


[A, F, U] = global_stiffness_matrix(x);
A   % Global stiffness matrix
F   % Global load vector
U   % Coefficient vector

% Points to be evaluated
x2 = 0:0.05:1; k2 = length(x2);

u_exact = [];   % Exact solution vactor for points
u_fem = [];     % FEM solution vector for points

for i=1:k2,
  u_exact(i) = exact_function(x2(i));
  u_fem(i) = fem_solution(x, U, x2(i), i); % Compute FE solution at x2(i)
end

error = norm(u_fem-u_exact,inf) % Compute the infinity error

plot(x2,u_fem,':', x2,u_exact) % Solid: the exact, Dotted: FE solution
hold; plot(x,U,'o') % Mark the solution at nodal points
xlabel('x'); ylabel('u(x) & u_{fem}(x)');
title('Solid line: Exact solution, Dotted line: FE solution')


figure(2); plot(x2,u_fem-u_exact); title('Error plot')
xlabel('x'); ylabel('u-u_{fem}'); title('Error Plot')