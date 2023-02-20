function T = fkineACspindle(q)
a3 = 100;
a1 = 50;
a2 = 20;
q1 = q(1);q2 = q(2);q3 = q(3);q4 = q(4);q5 = q(5);
x_w0 = 150; y_w0 = 250; z_w0 = 0;
T = [cos(q4)*cos(q5) sin(q4) sin(q5)*cos(q4) q1+x_w0-a3*sin(q5)*cos(q4);
    -cos(q5)*sin(q4) cos(q4) -sin(q5)*sin(q4) q2+y_w0+a3*sin(q4)*sin(q5);
    -sin(q5) 0 cos(q5) a1-a2-a3*cos(q5)-q3-z_w0];
end