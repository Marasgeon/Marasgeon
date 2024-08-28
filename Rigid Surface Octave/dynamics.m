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
## @deftypefn {} {@var{retval} =} dynamics (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: genghis <genghis@endeavouros>
## Created: 2023-10-10

function [dy, u] = dynamics(t, y, L1, L2, L3, m1, m2, m3, g, Kp, Ki, Kd, A, B, w, phi, e0, friction_coeff, damping_coeff)
    % Joint angles, joint velocities, and error
    q = y(1:3);
    dq = y(4:6);
    e = y(7:9);

    % Constraint surface function
    h = constraint_surface(q, A, B, w, phi);


    % Dynamics Equations
    M11 = (m1+m2+m3)*L1^2 + (m2+m3)*L2^2 + m3*L3^2 + 2*(m2+m3)*L1*L2*cos(q(2)) + 2*m3*L1*L3*cos(q(3)) + 2*m3*L2*L3*cos(q(2)+q(3));
    M12 = (m2+m3)*L2^2 + m3*L3^2 + (m2+m3)*L1*L2*cos(q(2)) + m3*L1*L3*cos(q(3)) + m3*L2*L3*cos(q(2)+q(3));
    M13 = m3*L3^2 + m3*L1*L3*cos(q(3)) + m3*L2*L3*cos(q(2)+q(3));

    M21 = M12;
    M22 = (m2+m3)*L2^2 + m3*L3^2 + 2*m3*L2*L3*cos(q(3));
    M23 = m3*L3^2 + m3*L2*L3*cos(q(3));

    M31 = M13;
    M32 = M23;
    M33 = m3*L3^2;

    M = [M11 M12 M13; M21 M22 M23; M31 M32 M33];

    C11 = -2*(m2+m3)*L1*L2*sin(q(2))*dq(2) - 2*m3*L1*L3*sin(q(3))*dq(3) - 2*m3*L2*L3*sin(q(2)+q(3))*(dq(2)+dq(3));
    C12 = -(m2+m3)*L1*L2*sin(q(2))*dq(1) - m3*L1*L3*sin(q(3))*dq(1) - m3*L2*L3*sin(q(2)+q(3))*dq(1) + (m2+m3)*L1*L2*sin(q(2))*dq(2) + m3*L1*L3*sin(q(3))*dq(3) + m3*L2*L3*sin(q(2)+q(3))*dq(2);
    C13 = -m3*L1*L3*sin(q(3))*dq(1) - m3*L2*L3*sin(q(2)+q(3))*dq(1) + (-m3*L1*L3*sin(q(3)) - m3*L2*L3*sin(q(2)+q(3)))*dq(3);

    C21 = (m2+m3)*L1*L2*sin(q(2))*dq(1) + m3*L2*L3*sin(q(3))*dq(1) - (m2+m3)*L1*L2*sin(q(2))*dq(2) - m3*L2*L3*sin(q(3))*(dq(2)+dq(3));
    C22 = 0;
    C23 = -m3*L2*L3*sin(q(3))*dq(2);

    C31 = m3*L1*L3*sin(q(3))*dq(1) + m3*L2*L3*sin(q(2)+q(3))*dq(1) + m3*L1*L3*sin(q(3))*dq(3);
    C32 = m3*L2*L3*sin(q(3))*dq(2) + m3*L1*L3*sin(q(3))*dq(1);
    C33 = 0;

    C = [C11 C12 C13; C21 C22 C23; C31 C32 C33];

    G1 = (m1+m2+m3)*g*L1*cos(q(1)) + (m2+m3)*g*L2*cos(q(1)+q(2)) + m3*g*L3*cos(q(1)+q(2)+q(3));
    G2 = (m2+m3)*g*L2*cos(q(1)+q(2)) + m3*g*L3*cos(q(1)+q(2)+q(3));
    G3 = m3*g*L3*cos(q(1)+q(2)+q(3));
    G = [G1; G2; G3];


    % Desired trajectory functions
%     desired_theta1 = 0.5 * sin(0.5 * t);  % desired trajectory for joint 1
%     desired_theta2 = 0.2 * cos(0.2 * t);  % desired trajectory for joint 2
%     desired_theta3 = 0.3 * sin(0.3 * t);  % desired trajectory for joint 3
%     desired_dtheta1 = 0.5 * 0.5 * cos(0.5 * t);  % Joint 1 desired velocity
%     desired_dtheta2 = -0.2 * 0.2 * sin(0.2 * t); % Joint 2 desired velocity
%     desired_dtheta3 = 0.3 * 0.3 * cos(0.3 * t);  % Joint 3 desired velocity
%     desired_ddtheta1 = -0.5 * 0.5^2 * sin(0.5 * t);  % Joint 1 desired acceleration
%     desired_ddtheta2 = -0.2 * 0.2^2 * cos(0.2 * t);  % Joint 2 desired acceleration
%     desired_ddtheta3 = -0.3 * 0.3^2 * sin(0.3 * t);  % Joint 3 desired acceleration
    % Desired Joint Angles and Their Derivatives
    desired_theta1 =  A * sin(w * t + phi);
    desired_theta2 =  -desired_theta1;
    desired_theta3 =  0;

    % Desired Joint Velocities
    desired_dtheta1 =  A * w * cos(w * t + phi);
    desired_dtheta2 =  -desired_dtheta1;
    desired_dtheta3 =  0;

    % Desired Joint Accelerations
    desired_ddtheta1 =  -A * w^2 * sin(w * t + phi);
    desired_ddtheta2 =  -desired_ddtheta1;
    desired_ddtheta3 =  0;
    qdes = [desired_theta1; desired_theta2; desired_theta3];
    dqdes = [desired_dtheta1; desired_dtheta2; desired_dtheta3];
    ddqdes = [desired_ddtheta1; desired_ddtheta2; desired_ddtheta3];

    % Constraint forces
    % lambda = -Kp(3,3) * h - Kd(3,3) * dq(3); % Simple PD control for constraint
    lambda = 0;
%   % Friction forces
%   friction_forces = -friction_coeff * dq;
%   friction_coeff = 0;
%   % Damping forces
%   damping_forces = -damping_coeff * dq;
%   damping_coeff = 0;
    % Error dynamics, control law, and joint torques
    e = qdes - q;
    e;
    de = dqdes - dq;
    de;
    ie = e0 + trapz(t, e);
    u = Kp * e + Ki * ie + Kd * de;

%     fis = readfis('flc5');
%
%     %% Define empty control effort
%
%     uu=zeros(3,1);
%     uu(1)=evalfis(fis,[e(1) de(1)]);
%     uu(2)=evalfis(fis,[e(2) de(2)]);
%     uu(3)=evalfis(fis,[e(3) de(3)]);
    tau = M * (Kp * (qdes - q) + Ki * ie + Kd * (dqdes - dq)) - C * dq - G + lambda;
    % tau = M*(uu)+ - C*dq - G;
    tau = tau - friction_coeff * dq - damping_coeff * dq;
    % Derivative of the state vector
    dy = zeros(9, 1);
    dy(1:3) = dq;
    dy(4:6) = M\(tau - C * dq - G);
    dy(7:9) = de;
endfunction
