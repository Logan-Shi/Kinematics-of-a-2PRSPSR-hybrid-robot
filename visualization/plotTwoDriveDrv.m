function [dq,ddq,dddq] = plotTwoDriveDrv(t,qt,t2,qt2,cap)
iscap = 1;
if nargin < 5
    iscap = 0;
end
axes = size(qt,2);
dq = FDMinter3(t,qt);
ddq = FDMinter3(t,dq);
dddq = FDMinter3(t,ddq);
dq2 = FDMinter3(t2,qt2);
ddq2 = FDMinter3(t2,dq2);
dddq2 = FDMinter3(t2,ddq2);

for i = 1:axes
    subplot(axes,3,(i-1)*3+1)
    plot(t,dq(:,i),'b','LineWidth',2)
    hold on
    plot(t2,dq2(:,i),'r','LineWidth',2)
    if iscap
        plot(t,repmat(cap{1}.drive_vel(i),size(t)),'r','LineWidth',3)
        plot(t,repmat(-cap{1}.drive_vel(i),size(t)),'r','LineWidth',3)
    end
    legend('result-1','result-2','Location','northoutside');
    title(['axis ' num2str(i) ' vel'])
end

for i = 1:axes
    subplot(axes,3,(i-1)*3+2)
    plot(t,ddq(:,i),'b','LineWidth',2)
    hold on
    plot(t2,ddq2(:,i),'r','LineWidth',2)
    if iscap
        plot(t,repmat(cap{1}.drive_acc(i),size(t)),'r','LineWidth',3)
        plot(t,repmat(-cap{1}.drive_acc(i),size(t)),'r','LineWidth',3)
    end
    legend('result-1','result-2','Location','northoutside');
    title(['axis ' num2str(i) ' acc'])
end

discard = 1;
for i = 1:axes
    subplot(axes,3,(i-1)*3+3)
    plot(t(1+discard:end-discard),dddq(1+discard:end-discard,i),'b','LineWidth',2)
    hold on
    plot(t2(1+discard:end-discard),dddq2(1+discard:end-discard,i),'r','LineWidth',2)
    if iscap
        plot(t(1+discard:end-discard),repmat(cap{1}.drive_jer(i),size(t(1+discard:end-discard))),'r','LineWidth',3)
        plot(t(1+discard:end-discard),repmat(-cap{1}.drive_jer(i),size(t(1+discard:end-discard))),'r','LineWidth',3)
    end
    legend('result-1','result-2','Location','northoutside');
    title(['axis ' num2str(i) ' jerk'])
end
sgtitle('derivatives for axes drive')
end