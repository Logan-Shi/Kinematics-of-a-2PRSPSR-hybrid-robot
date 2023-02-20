function plot5_axisTrajInApp(p,o,color,scale,axes)
if size(o,1)~=size(p,1)
    warning('point size error')
end
n = size(p,1);
downscale = max(1,floor(n/1000));
if nargin<4
    if nargin<3
        color = zeros(n,1);
    end
    scale = 40;
end
if n>1
    for i = 1:downscale:n
        pi = p(i,:);oi = o(i,:);
        p2 = pi + scale*oi;
        if color(i) == 1
            plot3dPointsInApp([pi;p2],eye(4),'r',1,axes);
        else
            if color(i) == 0
                plot3dPointsInApp([pi;p2],eye(4),'b',1,'-',axes);
            else
                plot3dPointsInApp([pi;p2],eye(4),color(i),1,'-',axes);
            end
        end
        hold on
    end
%     plot3dPoints(p,eye(4),'k')
    axis equal
    xlabel('x(mm)')
    ylabel('y(mm)')
    zlabel('z(mm)')
else
    p2 = p + scale*o;
    plot3(axes,[p(1), p2(1)], ...
        [p(2), p2(2)], ...
        [p(3), p2(3)], 'Color', color,'LineWidth',1);
end
end