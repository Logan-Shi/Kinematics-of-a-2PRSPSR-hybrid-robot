function plotDrvs(p_u,u)
if nargin < 2
    u = linspace(0,1,size(p_u,1));
end
subplot(4,1,1)
for i = 1:size(p_u,2)
    plot(u,p_u(:,i))
    hold on
    labels{i} = ['axis_' num2str(i)];
end
title('p')
legend(labels)
subplot(4,1,2)
v_u = FDMinter3(u,p_u);
for i = 1:size(p_u,2)
    plot(u,v_u(:,i))
    hold on
    labels{i} = ['axis_' num2str(i)];
end
title('v')
legend(labels)
subplot(4,1,3)
a_u = FDMinter3(u,v_u);
for i = 1:size(p_u,2)
    plot(u,a_u(:,i))
    hold on
end
title('a')
legend(labels)
subplot(4,1,4)
j_u = FDMinter3(u,a_u);
discard = 3;
for i = 1:size(p_u,2)
    plot(u(1+discard:end-discard),j_u(1+discard:end-discard,i))
    hold on
    labels{i} = ['axis_' num2str(i)];
end
title('j')
legend(labels)
sgtitle('derivatives')
end

