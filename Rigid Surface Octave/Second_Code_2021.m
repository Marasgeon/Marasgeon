%% Robot Parameters
L1 = 1;     % Link 1 length
L2 = 1;     % Link 2 length
L3 = 1;     % Link 3 length
m1 = 1;     % Link 1 mass
m2 = 1;     % Link 2 mass
m3 = 1;     % Link 3 mass
g = 9.81;   % Gravity

%% Control Parameters
Kp = [50 0 0; 0 50 0; 0 0 50];   % Proportional gain matrix
Ki = [1 0 0; 0 1 0; 0 0 1];      % Integral gain matrix
Kd = [10 0 0; 0 10 0; 0 0 10];   % Derivative gain matrix

%% Constraint Surface Parameters
A = 1;      % Surface amplitude
B = 1;      % Surface amplitude
w = 0.5;    % Surface frequency
phi = pi/4; % Surface phase

%% Simulation Parameters
tspan = [0 10];     % Simulation time span
dt = 0.01;          % Time step

%% Initial Conditions
q0 = [0; 0; 0];     % Joint angles
dq0 = [0; 0; 0];    % Joint velocities
e0 = 0;             % Error

%% Simulation
options = odeset('RelTol',1e-6,'AbsTol',1e-6); % ODE options
[t, y] = ode45(@(t,y) dynamics(t, y, L1, L2, L3, m1, m2, m3, g, Kp, Ki, Kd, A, B, w, phi, e0), tspan, [q0; dq0; e0], options);

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

figure;
x = L1*cos(y(:,1)) + L2*cos(y(:,1)+y(:,2)) + L3*cos(y(:,1)+y(:,2)+y(:,3));
y = L1*sin(y(:,1)) + L2*sin(y(:,1)+y(:,2)) + L3*sin(y(:,1)+y(:,2)+y(:,3));
plot(x, y, 'LineWidth', 2);
axis equal;
xlabel('x (m)');
ylabel('y (m)');
title('End Effector Trajectory');
grid on;

%% Dynamics Function
function [dy] = dynamics(t, y, L1, L2, L3, m1, m2, m3, g, Kp, Ki, Kd, A, B, w, phi, e0)

% Extract joint angles, joint velocities, and error
q = y(1:3);
dq = y(4:6);
e = y(7);

% Inertia matrix
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

% Coriolis and centrifugal forces
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

% Gravity vector
G1 = (m1+m2+m3)*g*L1*cos(q(1)) + (m2+m3)*g*L2*cos(q(1)+q(2)) + m3*g*L3*cos(q(1)+q(2)+q(3));
G2 = (m2+m3)*g*L2*cos(q(1)+q(2)) + m3*g*L3*cos(q(1)+q(2)+q(3));
G3 = m3*g*L3*cos(q(1)+q(2)+q(3));
G = [G1; G2; G3];

% Desired trajectory
qdes = A*sin(w*t + phi);
dqdes = A*w*cos(w*t + phi);
ddqdes = -A*w^2*sin(w*t + phi);

% Error dynamics
e = qdes - q;
de = dqdes - dq;
ie = e0 + trapz(t, e);
u = Kp*e + Ki*ie + Kd*de;

% Joint torques
tau = M*ddqdes + C*dq + G + u;
size(e)
e
size(diag(inv(M)*(tau - C*dq - G - u)))
AAA=diag(inv(M)*(tau - C*dq - G - u))
% Dynamics function
dy = zeros(7,1);
dy(1:3) = dq;
dy(4:6) = diag(inv(M)*(tau - C*dq - G - u))
dy(7) = e(1);
end