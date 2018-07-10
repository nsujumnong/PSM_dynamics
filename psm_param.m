syms q1 q2 q3 q4 q5 q6 q7 real;
syms g real;
syms l_RCC l_tool l_p2y l_y2ctrl real;

theta = [q1+pi/2 q2-pi/2 0 q4 q5-pi/2 q6-pi/2 0];
d = [0 0 q3-l_RCC l_tool 0 0 l_y2ctrl];
a = [0 0 0 0 0 l_p2y 0];
alpha = [pi/2 -pi/2 pi/2 0 -pi/2 -pi/2 -pi/2];

psmDH = [theta' d' a' alpha'];
i = size(psmDH,1);
forwardPSM = ForwardKinematicsLink(psmDH,i);
rho = [1 1 2 1 1 1 0];

%%
% z = [0 0 1]';
% 
% n = size(psmDH,1);
% for k = 1:n
%     T = ForwardKinematicsLink(psmDH,k);
%     z_next = simplify(T(1:3,1:3)*[0 0 1]');
%     z = [z,z_next];
% end
% 
% %%
% compute the position
% o = [0 0 0]';
% 
% for j = 1:n
%     T = ForwardKinematicsLink(psmDH,j);
%     o_next = simplify(T(1:3,4));
%     o = [o,o_next];
% end

psmJac = psmJacobian(psmDH,rho');