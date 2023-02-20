function dO = interSLinearGivenUDrv(O,u)
Or = interSLinearGivenU(O,u);
O2 = O(2,:);
O1 = O(1,:);
v = O2-O1;
v2 = cross(v,Or);
dO = cross(Or,v2);
dO = dO/norm(dO);
end

