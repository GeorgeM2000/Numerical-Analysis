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
## @deftypefn {} {@var{retval} =} Newton_Forward_Polynomial_Interpolation (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: giorg <giorg@DESKTOP-UB8J40I>
## Created: 2021-11-24

function py = Newton_Forward_Polynomial_Interpolation(start, h, F, y)
  number_of_loops = length(F);
  
  X = [];
  Dy = [];
  
  X(1) = start;
  
  r = (y-X(1))/h;
  printf("r = (x-%d)/%d\n",X(1),h);
  
  Dy(1) = F(1);
  py = F(1);
  intermediate_result = 1;
  
  for i = 2: number_of_loops
    X(i)=h+X(i-1);
  end
  
  % Print F elements
  F
  
  for i = 1:number_of_loops - 1
    
    printf("\nLOOP : %d \n\n",i);
    
    % Calculate new F(j) values
    for j = 1:number_of_loops - i
      
      printf("F(%d) = F(%d) - F(%d) = %d - %d = ",j,j+1,j,F(j+1),F(j));
      F(j)=F(j+1)-F(j);
      printf("%d\n",F(j));
      
    end
    
    Dy(i+1)=F(1);
    
  end
  
  printf("\n");
  
  % Print Dy elements
  Dy
  
  for i = 2:number_of_loops
    
    for j = 1:i - 1
      
      printf("(%f - %d)", r, j-1); 
      intermediate_result *= (r - (j - 1));
      
    end
    
    printf("/ %d!",i-1);
    intermediate_result /= factorial(i - 1);
    
    printf(" * %d  =  ", Dy(i));
    intermediate_result *= Dy(i);
    printf("%f \n\n", intermediate_result);
    
    % Add intermediate_result to py solution
    py += intermediate_result;
    
    % Reset intermediate_result
    intermediate_result = 1;
  end
  
endfunction
