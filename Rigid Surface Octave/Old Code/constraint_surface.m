## Copyright (C) 2023 genghis
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
## @deftypefn {} {@var{retval} =} constraint_surface (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: genghis <genghis@endeavouros>
## Created: 2023-10-10

function h = constraint_surface(q, A, B, w, phi)
    theta1 = q(1);
    theta2 = q(2);
    theta3 = q(3);
    x = A * cos(w * theta1 + phi) + B * cos(w * (theta1 + theta2 + phi));
    y = A * sin(w * theta1 + phi) + B * sin(w * (theta1 + theta2 + phi));
    h = x^2 + y^2 - 1;
endfunction
