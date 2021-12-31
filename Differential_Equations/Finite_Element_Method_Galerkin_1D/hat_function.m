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
## @deftypefn {} {@var{retval} =} hat_function (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: giorg <giorg@DESKTOP-UB8J40I>
## Created: 2021-12-29

function f = hat_function (xp, x, i)
  if x(i-1) <= xp && xp <= x(i)
    f = (xp - x(i-1))/(x(i) - x(i-1)); 
  elseif x(i) <= xp && xp <= x(i+1)
    f = (x(i+1) - xp)/(x(i+1) - x(i));
  else
    f = 0;
  endif

endfunction
