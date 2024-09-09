clc; clear all; format compact;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dynamic Model of 3-DOF planar manipulator%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Gravity's acceleration
g=9.81 % Units m/s^2
% Links' Lengths
L1=0.25;L2=0.25;L3=0.5; % Units in meters
% Distance from the center of mass for each link
l1=0.125;l2=0.125;l3=0.25; % Units in meters
% Links' Masses
m1=1.87;m2=2.2;m3=2.2; % Units in kilograms
% Motors' Masses
mc1=0.3;mc2=0.3; % Units in kilograms
% Moments of inertia for each link
J1=0.0097395;J2=0.011458;J3=0.045833 % Units in kgm^2
% Frictional torque coefficients
c1=0.7056;c2=0.7056;c3=0.7056; % Units in Nms



%A(x)x''=B(x,x'')x''+C(X)+D

% Constants in A(x) Matrix
A11=m1*l1^2+J1+(m2+m3+mc1+mc2)*L1^2
A12=(m2*l2+(m3+mc2)*L2)*L1
A13=m3*l3*L1
A22=m2*l2^2+J2+(m3+mc2)*L2^2
A23=m3*l3*L2
A33=m3*l3^2+J3

% Constants in B(x,x'') Matrix
B11=-(c1+c2)
B12=c2+(m2*l2+(m3+mc2)*L2)*L1
B13=m3*l3*L1
B21=c2-(m2*l2+(m3+mc2)*L2)*L1
B22=-(c2+c3)
B23=c3+m3*l3*L2
B32=c3-m3*l3*L2
B33=-c3

% Constants in C(x) Matrix
C1=(m1*l1+(m2+m3+mc1+mc2)*L1)*g
C2=(m2*l2+(m3+mc2)*L2)*g
C3=m3*l3*g


% syms th1 th2 th3 dth1 dth2 dth3;


M=[A11 A12*cos(th2-th1) A13*cos(th3-th1)
   A12*cos(th2-th1) A22 A23*cos(th3-th2)
   A13*cos(th3-th1) A23*cos(th3-th2) A33]

G=[C1*sin(th1)
   C2*sin(th2)
   C3*sin(th3)]

Cor=[B11 B12*sin(th2-th1)*dth2 B13*sin(th3-th1)*dth3
   B21*sin(th2-th1)*dth1 B22 B23*sin(th3-th2)*dth3
   -B13*sin(th3-th1)*dth1 B32*sin(th3-th2)*dth2 B33]
u1=0;u2=0;
D=[-u1
   u1-u2
    u2]
dG=[C1*sin(th1) 0 0
    0 C2*sin(th2) 0
    0 0 C3*sin(th3)]
A=[zeros(3) eye(3);
    zeros(3) inv(M)*Cor]
B=[zeros(3) zeros(3);
    zeros(3) eye(3)]
u=[zeros(3,1);
  inv(M)*(D-G)]

C=[eye(6)];
D1=[zeros(6)];
plant=ss(A,B,C,D1)

