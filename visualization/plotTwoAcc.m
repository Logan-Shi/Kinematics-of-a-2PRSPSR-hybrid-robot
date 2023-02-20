function [dq,ddq,dddq] = plotTwoAcc(t,qt,t2,qt2,cap)
iscap = 0;
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
    subplot(axes,1,i)
    plot(t,ddq(:,i),'r','LineWidth',2)
    hold on
    plot(t2,ddq2(:,i),'b','LineWidth',2)

    if iscap
        plot(t,repmat(cap{1}.drive_acc(i),size(t)),'r','LineWidth',3)
        plot(t,repmat(-cap{1}.drive_acc(i),size(t)),'r','LineWidth',3)
    end
    xlabel('time(s)')
    ylabel('joint acceleration(mm/s^2)')
    title(['axis ' num2str(i) ' acc'])
end
end