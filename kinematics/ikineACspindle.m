function q = ikineACspindle(p,o)
% q as in [x,y,z,a,c]; 
x_w0 = 150; y_w0 = 250; z_w0 = 0;
q = zeros(size(p,1),5);
a1 = 50;
a2 = 20;
a3 = 100;
for i = 1:size(q,1)
    q(i,5) = acos(o(i,3));
    q(i,4) = atan2(-o(i,2),o(i,1));
    q(i,1) = p(i,1)-x_w0+a3*sin(q(i,5))*cos(q(i,4));
    q(i,2) = p(i,2)-y_w0-a3*sin(q(i,4))*sin(q(i,5));
    q(i,3) = -p(i,3)-z_w0+a1-a2-a3*cos(q(i,5));
end
end