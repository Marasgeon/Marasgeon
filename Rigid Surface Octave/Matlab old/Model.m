clc; clear all; format compact;
% Dynamic model of 3DOF planar manipulator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b12=b21 ; b31=b13 ; b32=b23 ;
Bq=[b11 b12 b13
    b21 b22 b23
    b31 b32 b33]
l1=0.5 ; l2=0.5 ; l3=0.5 ;
ml1=10 ; ml2=10 ; ml3=10 ;
mm1=1 ; mm2=1 ; mm3=1 ;
Il1=1 ; Il2=1 ; Il3=1 ;
Im1=0.01 ; Im2=0.01 ; Im3=0.01 ;
theta = [th1 
         th2
         th3]
c1=cos(th1) ; c2=cos(th2) ; c3=cos(th3);
c12=cos(th1+th2) ; c13=cos(th1+th3) ; c23=cos(th2+th3);
c123=cos(th1+th2+th3) ;
s1=sin(th1) ; s2=sin(th2) ; s3=sin(th3);
s12=sin(th1+th2) ; s13=sin(th1+th3) ; s23=sin(th2+th3);
s123=sin(th1+th2+th3) ;

b11=Il1+ml1*l1^2+Kr1^2*Im1+Il2+mm2*a1^2+Im2+ml2(a1^2+l2^2+2*a2*l2*c2)+Il3+Im3+...
    mm3(a1^2+a2^2+2*a1*a2*c1)+ml3(a1^2+a2^2+l3^2+2*a1*a2*c2+2*a1*l3*c23+2*a2*l3*c3) ;
 
q