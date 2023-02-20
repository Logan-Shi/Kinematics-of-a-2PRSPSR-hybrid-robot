function R = ori2R(o)
u = o';
tmp = [1;0;0];
v = cross(u,tmp);
if norm(v)<eps
    tmp = [0;1;0];
    v = cross(u,tmp);
end

R = [u,v,cross(u,v)];
end