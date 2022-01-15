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
## @deftypefn {} {@var{retval} =} simpsons (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: giorg <giorg@DESKTOP-UB8J40I>
## Created: 2021-12-29

function I = simpsons(a, b, n, hat_func)
  if hat_func == 1
    func=@(x) f(x)*((x-a)/(b-a)); % Hat function 1
  elseif hat_func == 2
    func=@(x) f(x)*((b-x)/(b-a)); % Hat function 2
  endif
    
  h=(b-a)/n;
  for k=1:1:n
    x(k)=a+k*h;
    y(k)=func(x(k));
  end
  so=0;se=0;
  for k=1:1:n-1
    if rem(k,2)==1
       so=so+y(k);%sum of odd terms
     else
       se=se+y(k); %sum of even terms
    end
  end
  I=h/3*(func(a)+func(b)+4*so+2*se);
    
endfunction






