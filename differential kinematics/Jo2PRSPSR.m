function Jo = Jo2PRSPSR(q,p,o,params)
if size(q,1)>1 || size(p,1)>1 || size(o,1)>1
    warning('can not process a batch of jacobian yet')
end
R = params.R;
l1 = params.l1;
l2 = params.l2;
e1 = params.e1;
e2 = params.e2;
l = params.l;
x_w0 = params.x_w0;
y_w0 = params.y_w0;
h = params.h;

alpha = atan2(o(1),o(3));
beta = asin(-o(2));
z0 = h-l*cos(alpha)*cos(beta)-p(3);

JO =[cos(alpha)*cos(beta),  -sin(alpha)*sin(beta), 0;
    0,            -cos(beta), 0;
    -cos(beta)*sin(alpha), -cos(alpha)*sin(beta), 0];
J = [  e1*cos(alpha) + ((e1*sin(alpha) + cos(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) + e2*cos(alpha)*sin(beta))*(R - e1*cos(alpha) + sin(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta)))/(- (R - e1*cos(alpha) + sin(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta))^2 + l1^2)^(1/2),   ((e2*cos(beta)*sin(alpha) - (l2*sin(alpha)*sin(beta)*(R - l2*cos(beta)))/(l2^2 - (R - l2*cos(beta))^2)^(1/2))*(R - e1*cos(alpha) + sin(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta)))/(- (R - e1*cos(alpha) + sin(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta))^2 + l1^2)^(1/2), 1;
    ((cos(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) - e1*sin(alpha) + e2*cos(alpha)*sin(beta))*(e1*cos(alpha) - R + sin(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta)))/(- (- R + e1*cos(alpha) + sin(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta))^2 + l1^2)^(1/2) - e1*cos(alpha), ((e2*cos(beta)*sin(alpha) - (l2*sin(alpha)*sin(beta)*(R - l2*cos(beta)))/(l2^2 - (R - l2*cos(beta))^2)^(1/2))*(e1*cos(alpha) - R + sin(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta)))/(- (- R + e1*cos(alpha) + sin(alpha)*(l2^2 - (R - l2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta))^2 + l1^2)^(1/2), 1;
    sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta),                                                                                                                                                                                                                        (e2*cos(alpha)*sin(beta)*(R - e2*cos(beta)))/(l2^2 - (R - e2*cos(beta))^2)^(1/2) - e2*cos(alpha)*cos(beta), 1];
Jo = zeros(3,5);

Jo(1:3,1:3) = JO*inv(J);
end