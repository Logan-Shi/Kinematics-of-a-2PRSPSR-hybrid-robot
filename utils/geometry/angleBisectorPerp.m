function b = angleBisectorPerp(P)
P1 = P(1,:);
P2 = P(2,:);
P3 = P(3,:);

v1 = P1-P2;
v1 = -v1/norm(v1);
v2 = P3-P2;
v2 = v2/norm(v2);
b = v1 + v2;
b = b/norm(b);
end

