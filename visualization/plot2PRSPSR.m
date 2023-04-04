function plot2PRSPSR(p,o,params)
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

q = ikine2PRSPSR(p,o,params);
alpha = atan2(o(1),o(3));
beta = asin(-o(2));
z0 = h-l*cos(alpha)*cos(beta)-p(3);
q1 = q(1);
q2 = q(2);
q3 = q(3);
x = q(4);
y = q(5);

Ro = [cos(beta) 0 sin(beta);
    sin(alpha)*sin(beta) cos(alpha) -sin(alpha)*cos(beta);
    -cos(alpha)*sin(beta) sin(alpha) cos(alpha)*cos(beta)];
A1 = [0,R,0];
A2 = [0,-R,0];
A3 = [R,0,0];
C1 = [0,R,q1];
C2 = [0,-R,q2];
C3 = [R,0,q3];
mover = [0,-(z0-q3)*tan(alpha),z0];
B1 = mover + (Ro*[0,e1,0]')';
B2 = mover + (Ro*[0,-e1,0]')';
B3 = mover + (Ro*[e2,0,0]')';
T_base = [0 -1 0 x_w0;
    1 0 0 y_w0;
    0 0 -1 h;
    0 0 0 1];

plot3dPoints([A1;A2],T_base,[],[],[],[])
hold on
plot3dPoints([A2;A3],T_base,[],[],[],[])
plot3dPoints([A1;A3],T_base,[],[],[],[])

plot3dPoints([A1;C1],T_base,[],[],[],[])
plot3dPoints([A2;C2],T_base,[],[],[],[])
plot3dPoints([A3;C3],T_base,[],[],[],[])

plot3dPoints([B1;C1],T_base,[],[],[],[])
plot3dPoints([B2;C2],T_base,[],[],[],[])
plot3dPoints([B3;C3],T_base,[],[],[],[])

plot3dPoints([B1;B2],T_base,[],[],[],[])
plot3dPoints([B2;B3],T_base,[],[],[],[])
plot3dPoints([B1;B3],T_base,[],[],[],[])

plot3dPoint(mover,T_base)
plot3dPoint(A1,T_base)
plot3dPoint(A2,T_base)
plot3dPoint(A3,T_base)
plot3dPoint(B1,T_base)
plot3dPoint(B2,T_base)
plot3dPoint(B3,T_base)
plot3dPoint(C1,T_base)
plot3dPoint(C2,T_base)
plot3dPoint(C3,T_base)
px = p+[x,y,0]; px(1,1) = -px(1,1);
ox = o;ox(1,1) = -ox(1,1);
plot5_axisTraj(px,ox,'r',l,[],[])
T = eye(4);
T(1:3,4) = [-x;y;0];
trplot(T,'length',l)
hold off
axis([-200 200 -250 250 -100 600])
% ori = [-cos(beta)*sin(alpha),-sin(beta),cos(alpha)*cos(beta)];
% mover = transPoint(mover,T_base);
% disp(norm(mover-p-[x,y,0]))
% disp(norm(ori-o))
disp(norm(C1-B1))
disp(norm(C2-B2))
disp(norm(C3-B3))
end
