function dis = point2LineDis(p,p1,p2)
v1 = p - p1;
v2 = p - p2;
num = norm(cross(v1,v2));
dem = norm(p1-p2);
dis = num/dem;
end

