function plot3dPointsOnSphere(p,color,lw,specs)
if size(p,2)~=3
    warning('not in 3d space')
end
if isempty(specs)
    specs = '-';
end
if isempty(lw)
    lw = 0.1;
end
if isempty(color)
    color = 'r';
end
point_size = size(p,1);
interval = max(1,round(point_size/100));
p_s = [];
for i = 1:interval:point_size-interval
    dist = distOnSphere(p(i,:),p(i+interval,:));
    p_si = interSLinear(p(i,:),p(i+interval,:),max(3,round(dist/0.1)));
    p_s = [p_s;p_si];
end
plot3dPoints(p_s,[],color,lw,specs,[]);
end