## Copyright (C) 2021 giorg
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} global_stiffness_matrix (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: giorg <giorg@DESKTOP-UB8J40I>
## Created: 2021-12-29

function [A, F, U] = global_stiffness_matrix (x)
  M = length(x);
  for i=1:M-1,
    h(i) = x(i+1)-x(i);
  end
  A = sparse(M,M); F=zeros(M,1); % Initialization
  A(1,1) = 1; F(1)=0;
  A(M,M) = 1; F(M)=0;
  A(2,2) = 1/h(1); F(2) = load_vector_dintegral(x(1),x(2), 1);
  for i=2:M-2, % Assembling matrix element by element
    
    % Local stiffness matrix 
    A(i,i) = A(i,i) + 1/h(i);
    A(i,i+1) = A(i,i+1) - 1/h(i);
    A(i+1,i) = A(i+1,i) - 1/h(i);
    A(i+1,i+1) = A(i+1,i+1) + 1/h(i);
    
    % Local load vector 
    F(i) = F(i) + load_vector_dintegral(x(i),x(i+1), 2);
    F(i+1) = F(i+1) + load_vector_dintegral(x(i),x(i+1), 1);
  end
  
  A(M-1,M-1) = A(M-1,M-1) + 1/h(M-1);
  F(M-1) = F(M-1) + load_vector_dintegral(x(M-1),x(M), 2);
  U = A\F; % Solve the linear system of equations
  return

endfunction
