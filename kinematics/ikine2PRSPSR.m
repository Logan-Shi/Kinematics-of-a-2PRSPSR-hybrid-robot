function q = ikine2PRSPSR(p,o,params)
% q as in [q1,q2,q3,x,y];
if nargin<3
    warning('using default kinematic params')
    R = 161;% mm
    l1 = 240;% mm
    l2 = 183;% mm
    e1 = 90;% mm
    e2 = 90;% mm
    l = 100;% mm
    x_w0 = 0;
    y_w0 = 0;
    h = 500;
else
    R = params.R;
    l1 = params.l1;
    l2 = params.l2;
    e1 = params.e1;
    e2 = params.e2;
    l = params.l;
    x_w0 = params.x_w0;
    y_w0 = params.y_w0;
    h = params.h;
end
q = zeros(size(p,1),5);
for i = 1:size(q,1)
    alpha = atan2(o(i,1),o(i,3));
    beta = asin(-o(i,2));
    z0 = h-l*cos(alpha)*cos(beta)-p(i,3);

    q3 = z0-e2*cos(alpha)*sin(beta)-cos(alpha)*sqrt(l2^2-(R-e2*cos(beta))^2);
    q1 = z0+e1*sin(alpha)-sqrt(l1^2-(R-e1*cos(alpha)-tan(alpha)*(q3-z0))^2);
    q2 = z0-e1*sin(alpha)-sqrt(l1^2-(R-e1*cos(alpha)+tan(alpha)*(q3-z0))^2);
    x = x_w0+tan(alpha)*(q3-z0)-l*cos(beta)*sin(alpha)-p(i,1);
    y = y_w0+l*sin(beta)-p(i,2);
    q(i,:) = [q1,q2,q3,x,y];
end
end