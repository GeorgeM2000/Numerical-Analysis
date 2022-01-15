## Copyright (C) 2022 giorg
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
## @deftypefn {} {@var{retval} =} elimination (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: giorg <giorg@DESKTOP-UB8J40I>
## Created: 2022-01-09

function X = elimination(X,i,j)
% Pivoting (i,j) element of matrix X and eliminating other column
% elements to zero
[ nX mX ] = size( X); 
a = X(i,j);
X(i,:) = X(i,:)/a;
for k =  1:nX % loop to find triangular form 
    if k == i
        continue
    end
    X(k,:) = X(k,:) - X(i,:)*X(k,j); % final result 
end