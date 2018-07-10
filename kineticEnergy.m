function K = kineticEnergy(dh_table,m,I,dq)
    D = 0;
    n = size(dh_table,1);
    jac = psmJacobian(dh_table,n);
    Jv = jac(1:3,:);
    Jw = jac(4:6,:);
    for i = 1:n
        I_i = I(:,:,i);
        theta_i = dh_table(i,1);
        d_i = dh_table(i,2);
        a_i = dh_table(i,3);
        alpha_i = dh_table(i,4);
        dh = DHtransform(theta_i,d_i,a_i,alpha_i);
        R_i = dh(1:3,1:3);
        D = D + (m(i)*Jv(:,i)'*Jv(:,i)+Jw(:,i)'*R_i*I_i*R_i'*Jw(:,i)); 
    end
    
    K = 1/2*dq'*D*dq;
    
end