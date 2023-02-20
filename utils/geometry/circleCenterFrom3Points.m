function Pc = circleCenterFrom3Points(P)
p1 = P(1,:);
p2 = P(2,:);
p3 = P(3,:);

v1 = p2-p1;
v2 = p3-p1;

v11 = dot(v1,v1);
v22 = dot(v2,v2);
v12 = dot(v1,v2);

b = 1/2/(v11*v22-v12^2);
k1 = b*v22*(v11-v12);
k2 = b*v11*(v22-v12);

Pc = p1+k1*v1+k2*v2;
end

