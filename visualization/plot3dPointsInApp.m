function plot3dPointsInApp(p,T,color,lw,specs,axes)
if size(p,2)<3
    warning('not in 3d space')
end
if nargin < 5
    if nargin < 4
        if nargin < 3
            if nargin < 2
                T = eye(4);
            end
            color = 'r';
        end
        lw = 1;
    end
    specs = '-';
end
p = transPoint(p,T);
x = p(:,1);
y = p(:,2);
z = p(:,3);

plot3(axes,x,y,z,char(color),'LineWidth',lw,'LineStyle',specs);
axis equal;grid on;
xlabel('x(mm)')
ylabel('y(mm)')
zlabel('z(mm)')
end