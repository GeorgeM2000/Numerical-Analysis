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
## @deftypefn {} {@var{retval} =} fem_solution (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: giorg <giorg@DESKTOP-UB8J40I>
## Created: 2021-12-29

function ux = fem_solution (x, U, xp, j)
  ux = 0;
  n = length(x);
  for i=2:n-1
    phi = hat_function(xp, x, i);
    ux = ux + (U(i) * phi);
  endfor

endfunction
