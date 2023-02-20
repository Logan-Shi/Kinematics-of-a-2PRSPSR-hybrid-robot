function [dq,ddq,dddq] = plotDriveDrv(t,qt,cap)
iscap = 1;
if nargin < 3
    iscap = 0;
end

if length(t)~=length(qt) && length(t) == 1
    t = 0:t:(t*length(qt)-t);
end
axes = size(qt,2);
dq = FDMinter3(t,qt);
ddq = FDMinter3(t,dq);
dddq = FDMinter3(t,ddq);

for i = 1:axes
    subplot(axes,3,(i-1)*3+1)
    plot(t,dq(:,i))
    hold on
    if iscap
        plot(t,repmat(cap{1}.drive_vel(i),size(t)),'r','LineWidth',3)
        plot(t,repmat(-cap{1}.drive_vel(i),size(t)),'r','LineWidth',3)
    end
    legend('result','Location','northoutside');
    title(['axis ' num2str(i) ' vel'])
end

for i = 1:axes
    subplot(axes,3,(i-1)*3+2)
    plot(t,ddq(:,i))
    hold on
    if iscap
        plot(t,repmat(cap{1}.drive_acc(i),size(t)),'r','LineWidth',3)
        plot(t,repmat(-cap{1}.drive_acc(i),size(t)),'r','LineWidth',3)
    end
    legend('result','Location','northoutside');
    title(['axis ' num2str(i) ' acc'])
end

discard = 0;
for i = 1:axes
    subplot(axes,3,(i-1)*3+3)
    plot(t(1+discard:end-discard),dddq(1+discard:end-discard,i))
    hold on
    if iscap
        plot(t(1+discard:end-discard),repmat(cap{1}.drive_jer(i),size(t(1+discard:end-discard))),'r','LineWidth',3)
        plot(t(1+discard:end-discard),repmat(-cap{1}.drive_jer(i),size(t(1+discard:end-discard))),'r','LineWidth',3)
    end
    legend('result','Location','northoutside');
    title(['axis ' num2str(i) ' jerk'])
end
sgtitle('derivatives for axes drive')
end