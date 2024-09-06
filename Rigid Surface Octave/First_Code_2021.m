% Define robot parameters
L1 = 1; % length of link 1
L2 = 1; % length of link 2
L3 = 1; % length of link 3
m1 = 1; % mass of link 1
m2 = 1; % mass of link 2
m3 = 1; % mass of link 3
g = 9.81; % acceleration due to gravity

% Define initial joint angles and velocities
q0 = [0; pi/4; pi/2]; % initial joint angles
q_dot0 = [0; 0; 0]; % initial joint velocities

% Define constraint surface function
h = @(x,y) x.^2 + y.^2 - 1; % constraint surface function

% Define simulation time and time step
tspan = [0 10]; % simulation time interval
dt = 0.01; % time step

% Define simulation options
options = odeset('RelTol',1e-6,'AbsTol',1e-6);

% Define simulation function
f = @(t, q) robot_dynamics(q, h, L1, L2, L3, m1, m2, m3, g);

% Simulate robot dynamics
[t, q] = ode45(f, tspan, [q0; q_dot0], options);

% Extract joint angles and velocities from simulation results
q1 = q(:,1);
q2 = q(:,2);
q3 = q(:,3);
q_dot1 = q(:,4);
q_dot2 = q(:,5);
q_dot3 = q(:,6);

% Plot joint angles and velocities over time
figure();
subplot(2,3,1); plot(t, q1); xlabel('Time (s)'); ylabel('q_1 (rad)');
subplot(2,3,2); plot(t, q2); xlabel('Time (s)'); ylabel('q_2 (rad)');
subplot(2,3,3); plot(t, q3); xlabel('Time (s)'); ylabel('q_3 (rad)');
subplot(2,3,4); plot(t, q_dot1); xlabel('Time (s)'); ylabel('q_dot_1 (rad/s)');
subplot(2,3,5); plot(t, q_dot2); xlabel('Time (s)'); ylabel('q_dot_2 (rad/s)');
subplot(2,3,6); plot(t, q_dot3); xlabel('Time (s)'); ylabel('q_dot_3 (rad/s)');

% Define robot dynamics function
function dqdt = robot_dynamics(q, h, L1, L2, L3, m1, m2, m3, g)
    % Extract joint angles and velocities
    q1 = q(1);
    q2 = q(2);
    q3 = q(3);
    q_dot1 = q(4);
    q_dot2 = q(5);
    q_dot3 = q(6);
end
%     % Compute Jacobian matrix
%     J = [ -L1*sin(q1)-L2*sin(q1+q2)-L3*sin(q1+q2+q3), -L2*sin(q1+q2)-L3*sin(q1+q2+q3), -L3*sin(q1+q2+q3);
%           L1*cos(q1)+L2*cos(q1+q2)+L
