%% Simulation and control of 3-DOF RRR Planar Robotic Manipulator
%% operating on unknown non-flat constraint surface.
clc;
clear all;
format compact;

%% Robot Parameters
L1 = 1;     % Link 1 length
L2 = 1;     % Link 2 length
L3 = 1;     % Link 3 length
m1 = 1;     % Link 1 mass
m2 = 1;     % Link 2 mass
m3 = 1;     % Link 3 mass
g = 9.81;   % Gravity

%% Control Parameters
Kp = [100 0 0; 0 100 0; 0 0 100];   % Proportional gain matrix
Ki = [10 0 0; 0 10 0; 0 0 10];      % Integral gain matrix
Kd = [20 0 0; 0 20 0; 0 0 20];      % Derivative gain matrix

%% Constraint Surface Parameters
A = 1;      % Surface amplitude
B = 1;      % Surface amplitude
w = 0.5;    % Surface frequency
phi = pi/4; % Surface phase

%% Friction and Damping Coefficients
friction_coeff = 0.1;  % Friction coefficient
damping_coeff = 0.05;  % Damping coefficient

%% Simulation Parameters
tspan = [0 10];     % Simulation time span
dt = 0.01;          % Time step

%% Initial Conditions
q0 = [0; 0; 0];     % Joint angles
dq0 = [0; 0; 0];    % Joint velocities
e0 = [0; 0; 0];     % Error


%% Simulation
options = odeset('RelTol',1e-6,'AbsTol',1e-6); % ODE options
[t, y, u] = ode45(@(t,y) dynamics(t, y, L1, L2, L3, m1, m2, m3, g, Kp, Ki, Kd, A, B, w, phi, e0, friction_coeff, damping_coeff), tspan, [q0; dq0; e0], options);


%% Plotting
figure;
subplot(2,2,1);
plot(t, y(:,1), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Joint Angle (rad)');
title('Joint 1 Angle');
grid on;

subplot(2,2,2);
plot(t, y(:,2), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Joint Angle (rad)');
title('Joint 2 Angle');
grid on;

subplot(2,2,3);
plot(t, y(:,3), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Joint Angle (rad)');
title('Joint 3 Angle');
grid on;

subplot(2,2,4);
plot(t, y(:,7), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Control Input');
title('Control Input');
grid on;

% figure;
% x1 = L1*cos(y(:,1)) + L2*cos(y(:,1)+y(:,2)) + L3*cos(y(:,1)+y(:,2)+y(:,3));
% y1 = L1*sin(y(:,1)) + L2*sin(y(:,1)+y(:,2)) + L3*sin(y(:,1)+y(:,2)+y(:,3));
% plot(x1, y1, 'LineWidth', 2);
% axis equal;
% xlabel('x (m)');
% ylabel('y (m)');
% title('End Effector Trajectory');
% grid on;
% % Desired trajectory functions
% desired_theta1 = 0.5 * sin(0.5 * t);  % Desired trajectory for joint 1
% desired_theta2 = 0.2 * cos(0.2 * t);  % Desired trajectory for joint 2
% desired_theta3 = 0.3 * sin(0.3 * t);  % Desired trajectory for joint 3
% 
% figure;
% x2 = L1*cos(desired_theta1) + L2*cos(desired_theta1+desired_theta2) + L3*cos(desired_theta1+desired_theta2+desired_theta3);
% y2 = L1*sin(desired_theta1) + L2*sin(desired_theta1+desired_theta2) + L3*sin(desired_theta1+desired_theta2+desired_theta3);
% plot(x2, y2, 'LineWidth', 2);
% axis equal;
% xlabel('x (m)');
% ylabel('y (m)');
% title('Desired End Effector Trajectory');
% grid on;

% Joint angles and joint velocities
q = y(:, 1:3);
dq = y(:, 4:6);

% Desired end effector trajectory
x_desired = zeros(size(t));
y_desired = zeros(size(t));
desired_theta1 =  A * sin(w * t + phi);
desired_theta2 =  -desired_theta1; 
desired_theta3 =  0; 
x_desired = L1 * cos(desired_theta1) + L2 * cos(desired_theta1 + desired_theta2) + L3 * cos(desired_theta1 + desired_theta2 + desired_theta3);
y_desired = L1 * sin(desired_theta1) + L2 * sin(desired_theta1 + desired_theta2) + L3 * sin(desired_theta1 + desired_theta2 + desired_theta3);


% Actual end effector trajectory
x_actual = L1 * cos(q(:, 1)) + L2 * cos(q(:, 1) + q(:, 2)) + L3 * cos(q(:, 1) + q(:, 2) + q(:, 3));
y_actual = L1 * sin(q(:, 1)) + L2 * sin(q(:, 1) + q(:, 2)) + L3 * sin(q(:, 1) + q(:, 2) + q(:, 3));

% Plot desired and actual end effector trajectories
figure;
plot(x_desired, y_desired, 'r', 'LineWidth', 2);
hold on;
plot(x_actual, y_actual, 'b', 'LineWidth', 2);
xlabel('X Position');
ylabel('Y Position');
title('Desired vs. Actual End Effector Trajectories');
legend('Desired', 'Actual');
grid on;
hold off;
% Constraint surface function
function h = constraint_surface(q, A, B, w, phi)
    theta1 = q(1);
    theta2 = q(2);
    theta3 = q(3);
    x = A * cos(w * theta1 + phi) + B * cos(w * (theta1 + theta2 + phi));
    y = A * sin(w * theta1 + phi) + B * sin(w * (theta1 + theta2 + phi));
    h = x^2 + y^2 - 1;
end

% Dynamics function
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
end
