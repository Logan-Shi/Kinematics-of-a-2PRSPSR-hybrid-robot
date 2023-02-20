function plotMarkerWithSpecs(p,color,spec,marker_size)
if isempty(marker_size)
    marker_size = 8;
end
if isempty(spec)
    spec = 'o';
end
if isempty(color)
    color = 'r';
end
if size(p,2)~=3
    warning('not in 3d space')
end

x = p(:,1);
y = p(:,2);
z = p(:,3);
plot3(x,y,z,spec,'MarkerSize',marker_size,'MarkerFaceColor',color,'MarkerEdgeColor',color);
axis equal;grid on;
xlabel('x')
ylabel('y')
zlabel('z')
end

