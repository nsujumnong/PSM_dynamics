syms a1 a2 theta1(t) theta2(t) t1 t2 real;
syms y(x)

x_sym = a1*cos(theta1) + a2*cos(theta1+theta2);
y_sym = a1*sin(theta1) + a2*sin(theta1+theta2);
x = a1*cos(t1) + a2*cos(t1 + t2);
y = a1*sin(t1) + a2*sin(t1 + t2);

D1 = functionalDerivative(x_sym,theta1);
D2 = functionalDerivative(x_sym,theta2);
D3 = functionalDerivative(y_sym,theta1);
D4 = functionalDerivative(y_sym,theta2);

D5 = diff(x,t1);
