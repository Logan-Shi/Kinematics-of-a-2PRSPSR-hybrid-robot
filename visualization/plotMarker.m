function plotMarker(p,color)
if size(p,2)~=3
    warning('not in 3d space')
end
if isempty(color)
    color = 'r';
end
x = p(:,1);
y = p(:,2);
z = p(:,3);
plot3(x,y,z,'o','MarkerSize',5,'MarkerFaceColor',color,'MarkerEdgeColor',color);
axis equal;grid on;
xlabel('x')
ylabel('y')
zlabel('z')
end

