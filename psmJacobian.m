function J = psmJacobian(dh_param, joint_type)

    z = [0 0 1]';   % initiate the rotation 
    o = [0 0 0]';   % initiate the translation
    Jv = []; % initiate linear jacobian
    Jw = []; % initiate angular jacobian
    n = size(dh_param,1);
    
    % compute the orientation of each joint
    for k = 1:n
        T = ForwardKinematicsLink(dh_param,k);
        z_next = simplify(T(1:3,1:3)*[0 0 1]');
        z = [z,z_next];
    end
    
    % compute the position
    for j = 1:n
        T = ForwardKinematicsLink(dh_param,j);
        o_next = simplify(T(1:3,4));
        o = [o,o_next];
    end
    
    % compute the jacobian matrix
    for i = 1:n-1
        type = joint_type(i);
        if type == 0
            Jvi = [0 0 0]';
            Jwi = [0 0 0]';
        elseif type == 1
            Jvi = cross(z(:,i),(o(:,n)-o(:,i))); 
            Jwi = z(:,i);
        elseif type == 2
            Jvi = z(:,i);
            Jwi = [0 0 0]';
        end
        Jv = [Jv,Jvi];
        Jw = [Jw,Jwi];
    end
    
    J = [Jv;Jw];
    
end