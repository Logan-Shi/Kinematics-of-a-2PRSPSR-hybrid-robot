function Jp = Jp2PRSPSR(q,p,o,params)
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

JP1 = [-cos(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) - l*cos(alpha)*cos(beta) - e2*cos(alpha)*sin(beta), -e2*cos(beta)*sin(alpha) + l*sin(alpha)*sin(beta) + (e2*sin(alpha)*sin(beta)*(R - e2*cos(beta)))/(l2^2 - (R - e2*cos(beta))^2)^(1/2),  0;
    0,                                                                                                                         l*cos(beta),  0;
    l*cos(beta)*sin(alpha),                                                                                                              l*cos(alpha)*sin(beta), -1];
JP2 = [-1,  0;
    0, -1;
    0,  0];
J = [  e1*cos(alpha) + ((e1*sin(alpha) + cos(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*cos(alpha)*sin(beta))*(R - e1*cos(alpha) + sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta)))/(- (R - e1*cos(alpha) + sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta))^2 + l1^2)^(1/2),   ((e2*cos(beta)*sin(alpha) - (e2*sin(alpha)*sin(beta)*(R - e2*cos(beta)))/(l2^2 - (R - e2*cos(beta))^2)^(1/2))*(R - e1*cos(alpha) + sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta)))/(- (R - e1*cos(alpha) + sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta))^2 + l1^2)^(1/2), 1;
    ((cos(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) - e1*sin(alpha) + e2*cos(alpha)*sin(beta))*(e1*cos(alpha) - R + sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta)))/(- (- R + e1*cos(alpha) + sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta))^2 + l1^2)^(1/2) - e1*cos(alpha), ((e2*cos(beta)*sin(alpha) - (e2*sin(alpha)*sin(beta)*(R - e2*cos(beta)))/(l2^2 - (R - e2*cos(beta))^2)^(1/2))*(e1*cos(alpha) - R + sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta)))/(- (- R + e1*cos(alpha) + sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta))^2 + l1^2)^(1/2), 1;
    sin(alpha)*(l2^2 - (R - e2*cos(beta))^2)^(1/2) + e2*sin(alpha)*sin(beta),                                                                                                                                                                                                                        (e2*cos(alpha)*sin(beta)*(R - e2*cos(beta)))/(l2^2 - (R - e2*cos(beta))^2)^(1/2) - e2*cos(alpha)*cos(beta), 1];
Jp = zeros(3,5);

Jp(1:3,1:3) = JP1*inv(J);
Jp(1:3,4:5) = JP2;
end