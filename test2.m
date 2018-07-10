% test 2
syms a1 a2 q1 q2 d3 d4 real;
o1 = [a1*cos(q1); a1*sin(q1); 0];
o2 = [a1*cos(q1)+a2*cos(q1+q2); a1*sin(q1) + a2*sin(q1+q2); 0];
o4 = [a1*cos(q1)+a2*cos(q1+q2); a1*sin(q1) + a2*sin(q1+q2); d3-d4];
z0 = [0 0 1]';
z1 = z0;

% Testing DH table
tList = [q1 q2];
dList = [0 0];
aList = [a1 a2];
alphaList = [0 0];

dh_table = [tList dList aList alphaList];
forward = ForwardKinematicsLink()

