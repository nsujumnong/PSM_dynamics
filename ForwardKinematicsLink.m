function [full,pos] = ForwardKinematicsLink (dh_table,i)
% return full forward kinematics of the manipulator
T = sym(eye(4));
for j=1:i
    theta = dh_table(j,1);
    d = dh_table(j,2);
    a = dh_table(j,3);
    alpha = dh_table(j,4);
    T = T*DHtransform(theta,d,a,alpha);
    %disp(T);
end
full = T;
pos = simplify(T(1:3,4));
end

