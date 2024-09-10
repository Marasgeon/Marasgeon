function p = make_trajectory(xi, yi, dy_dx_i, xf, yf, dy_dx_f)
    p = [1 xi xi^2   xi^3;
         0  1 2*xi 3*xi^2;
         1 xf xf^2   xf^3;
         0  1 2*xf 3*xf^2] \ [yi dy_dx_i yf dy_dx_f]';
end