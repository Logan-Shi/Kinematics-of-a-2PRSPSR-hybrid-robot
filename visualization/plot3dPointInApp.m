function plot3dPointInApp(p,T,axes)
if nargin < 2
    T = eye(4);
end
p = transPoint(p,T);
for i = 1:size(p,1)
%     plot3(p(i,1),p(i,2),p(i,3),'or',...
%         'MarkerFaceColor','k',...
%         'MarkerSize',5)
    plot3(axes,p(i,1),p(i,2),p(i,3),'or',...
        'MarkerSize',5)
    hold on
end
end