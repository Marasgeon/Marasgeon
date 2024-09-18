clc; clear all; format compact;


n=3
%%% simulation time
sim_time = 10;
sim_period = 0.001;
t = 0:sim_period:sim_time
sample_size = size(t, 2)

%%% Trajectory
Ran_v1 = 10;
Ran_v2 = 5;

iq_t(1,:)=-20/pi*cos(0.5*pi*t)-10/pi*cos(1*pi*t);
iq_t(2,:)=-20/pi*cos(0.5*pi*t)-10/pi*cos(1*pi*t);
iq_t(3,:)=-Ran_v2*10/pi*cos(0.1*pi*t);
iq_t(4,:)=-Ran_v2*10/pi*cos(0.1*pi*t);
% for i=1:n
% %     q_t(i,:) = q_t(i,:) /180*pi;
% %     qd_t(i,:) = qd_t(i,:) /180*pi;
% %     qdd_t(i,:) = qdd_t(i,:) /180*pi;
%     iq_t(i,:) = iq_t(i,:) /180*pi;
% end
plot(t,iq_t(1,:),t,iq_t(3,:))