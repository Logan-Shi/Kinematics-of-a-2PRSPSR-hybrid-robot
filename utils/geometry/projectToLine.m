function out = projectToLine(P,Pr)
P1 = P(1,:);
P2 = P(2,:);
v1 = Pr - P1;
v2 = P2 - P1;
v3 = cross(v1,v2);
out = cross(v2,v3);
out = out/norm(out);
end

