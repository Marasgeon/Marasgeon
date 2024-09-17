% Copyright (C) 2022 All rights reserved.
% Authors:      Seonghyeon Jo <cpsc.seonghyeon@gmail.com>
%
% Date:         Jun, 16, 2020
% Last Updated: Jan, 20 2022
%
% -------------------------------------------------
% adaptive fuzzy sliding mode controller
% sawyer 4 dof manipulator
% -------------------------------------------------
%
% the following code has been tested on Matlab 2021a
%%
clc; clear all;
addpath(genpath('.'));
g=9.81
m1=1;m2=0.7;m3=0.35;
m12=m1+m2;
m23=m2+m3;
m13=m1+m3;
m123=m1+m2+m3;
l1=1;l2=0.7;l3=0.35;
l12=l1*l2;
l23=l2*l3;
l13=l1*l3;
l123=l1*l2*l3;
% 1:PID 2:FC_SIGN 3:FC_SAT 4: FSMC 5: AFSMC
control_mode = 5;
n=4;

% load Fuzzy model
ffis = readfis("fis\FSMC");
affis = readfis("fis\AFSMC");

%%% Gain Parameters
Kp = diag([500 1000 2000 2000]);
Ki = diag([5 5 5 5]*100);
Kd = diag([5 5 5 5]*10);
FC_SIGN.L = [35 35 10 15];
FC_SAT.L = [35 35 10 15];
FSMC.L = [500 500 100 50];

%%% simulation time
sim_time = 10;
sim_period = 0.001;
t = 0:sim_period:sim_time;
sample_size = size(t, 2);

%%% External torque
tau_ex(1,:) = 10*sin(0.1*pi*t);
tau_ex(2,:) = 10*cos(0.1*pi*i*sim_period);
tau_ex(3,:) = zeros(sample_size,1);
tau_ex(4,:) = zeros(sample_size,1);

%%% Trajectory
Ran_v1 = 10;
Ran_v2 = 5;

iq_t(1,:)=-20/pi*cos(0.5*pi*t)-10/pi*cos(1*pi*t);
iq_t(2,:)=-20/pi*cos(0.5*pi*t)-10/pi*cos(1*pi*t);
iq_t(3,:)=-Ran_v2*10/pi*cos(0.1*pi*t);
iq_t(4,:)=-Ran_v2*10/pi*cos(0.1*pi*t);

q_t(1,:)=10*sin(0.5*pi*t)+10*sin(1*pi*t);
q_t(2,:)=10*sin(0.5*pi*t)+10*sin(1*pi*t);
q_t(3,:)=Ran_v2*sin(0.1*pi*t);
q_t(4,:)=Ran_v2*sin(0.1*pi*t);

qd_t(1,:)=5*pi*cos(0.5*pi*t)+10*pi*cos(1*pi*t);
qd_t(2,:)=5*pi*cos(0.5*pi*t)+10*pi*cos(1*pi*t);
qd_t(3,:)=Ran_v2*0.1*pi*cos(0.1*pi*t);
qd_t(4,:)=Ran_v2*0.1*pi*cos(0.1*pi*t);

qdd_t(1,:)=-2.5*pi^2*sin(0.5*pi*t)-10*pi^2*sin(1*pi*t);
qdd_t(2,:)=-2.5*pi^2*sin(0.5*pi*t)-10*pi^2*sin(1*pi*t);
qdd_t(3,:)=-Ran_v2*(0.1*pi)^2*sin(0.1*pi*t);
qdd_t(4,:)=-Ran_v2*(0.1*pi)^2*sin(0.1*pi*t);

for i=1:n
    q_t(i,:) = q_t(i,:) /180*pi;
    qd_t(i,:) = qd_t(i,:) /180*pi;
    qdd_t(i,:) = qdd_t(i,:) /180*pi;
    iq_t(i,:) = iq_t(i,:) /180*pi;
end

% sliding various 
smax = [50 50 50 25];
smin = [-50 -50 -50 -75];
sdotmax = [2500 2500 2500 2500];
sdotmin = -[2500 2500 2500 2500];

% Initilization
x(:,1) = [q_t(:,1); zeros(n,1)];
qdd(:,1)= zeros(n,1);
int_q = zeros(n,1);
idx = zeros(sample_size,4);

%%% Simulation
for i=1:sample_size
    q = x(1:n, i);
    dq = x(n+1:n*2, i);
    
    % error
    e(:,i) = q_t(:,i)-q;
    e_dot(:,i) = qd_t(:,i)-dq;
    int_q = int_q+e(:,i)*sim_period;
    
    % model
    M = compute_M_4DOF(q);
    C = compute_C_4DOF(q, dq);
    G = compute_G_4DOF(q);
%     U(:,i) = ur(:,i) + ueq + tau_ex(:,i);
%     if(i ~= sample_size)
%         x(:,i+1) = rk2(x(:,i), U(:,i), sim_period,M,C,G);
%     end
end
