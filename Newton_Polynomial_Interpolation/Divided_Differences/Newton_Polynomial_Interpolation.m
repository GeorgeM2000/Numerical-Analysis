## Copyright (C) 2020 giorg
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} FiniteDiff (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: giorg <giorg@DESKTOP-UB8J40I>
## Created: 2020-11-10


# Newton Polynomial Interpolation for divided differences
function py = Newton_Polynomial_Interpolation(X, F, y)
  
  % Number of total loops
  number_of_loops = length(X) - 1;
  
  % Number of calculations needed per loop
  number_of_calculations = number_of_loops;
  
  
  py = F(1);
  
  for i = 1 : number_of_loops
    
    for j = 1 : number_of_calculations
      printf("\n %d-%d/%d-%d = ",F(j+1),F(j),X(j+i),X(j));
      
      % Calculate new fi() values
      F(j) = (F(j+1) - F(j)) / (X(j+i) - X(j));
      printf("%f \n",F(j));
    end
    
    intermediate_result = F(1);
    printf("\n");
    
    % Find intermediate result
    for z = 1 : i
      printf("%f * (%d - %d) + ",F(z),y,X(z));
      intermediate_result *= (y - X(z));
    end
    
    printf("\n");
    
    % Add the intermediate result to py solution
    py += intermediate_result;
    number_of_calculations -= 1;
  end
  
  
endfunction



















