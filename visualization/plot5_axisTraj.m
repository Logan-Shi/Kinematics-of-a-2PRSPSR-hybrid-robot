function plot5_axisTraj(p,o,color,scale,alpha,lw)
if size(o,1)~=size(p,1)
    warning('point size error')
end
n = size(p,1);
downscale = max(1,floor(n/1000));
if isempty(color)
    color = zeros(n,1);
end
if length(color)<n
    color = repmat(color(1),n,1);
end
if isempty(scale)
    scale = 40;
end
if isempty(alpha)
    alpha = 1;
end
if isempty(lw)
    lw = 1;
end
if n>1
    for i = 1:downscale:n
        pi = p(i,:);oi = o(i,:);
        p2 = pi + scale*oi;
%         pi = pi + lw/3*oi;
        if color(i) == 1
            plot3dPoints([pi;p2],[],'r',lw,[],alpha);
        else
            if color(i) == 0
                plot3dPoints([pi;p2],[],'b',lw,[],alpha);
            else
                plot3dPoints([pi;p2],[],color(i),lw,[],alpha);
            end
        end
        hold on
    end

    axis equal
    xlabel('x(mm)')
    ylabel('y(mm)')
    zlabel('z(mm)')
else
    p2 = p + scale*o;
    plot3([p(1), p2(1)], ...
        [p(2), p2(2)], ...
        [p(3), p2(3)], 'Color', color,'LineWidth',1);
end
end