function plot3dPoints(p,T,color,lw,specs,alpha)
if size(p,2)<3
    warning('not in 3d space')
end
if isempty(T) 
    T = eye(4);
end
if isempty(color)
    color = 'r';
end
if isempty(lw)
    lw = 1;
end
if isempty(specs)
    specs = '-';
end
if isempty(alpha)
    alpha = 1;
end

p = transPoint(p,T);
p = [p;NaN(1,size(p,2))];
x = p(:,1);
y = p(:,2);
z = p(:,3);
if ~ischar(color)
    color = char(color);
end

patch(x,y,z,color,'EdgeColor',color,...
    'FaceVertexAlphaData',alpha*ones(size(x,1),1),'AlphaDataMapping','none',...
    'EdgeAlpha','interp','LineWidth',lw,'LineStyle',specs)
axis equal;grid on;
xlabel('x(mm)')
ylabel('y(mm)')
zlabel('z(mm)')
end