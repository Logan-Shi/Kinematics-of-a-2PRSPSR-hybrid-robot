function [dq,ddq,dddq] = plotTwoJer(t,qt,t2,qt2,cap)
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

discard = 3;
for i = 1:axes
    subplot(axes,1,i)
    plot(t(1+discard:end-discard),dddq(1+discard:end-discard,i),'r','LineWidth',2)
    hold on
    plot(t2(1+discard:end-discard),dddq2(1+discard:end-discard,i),'b','LineWidth',2)
    disp(['latter jerk' num2str(max(max(dddq2)))])
    disp(['former jerk' num2str(max(max(dddq)))])
    if iscap
        plot(t(1+discard:end-discard),repmat(cap{1}.drive_jer(i),size(t(1+discard:end-discard))),'r','LineWidth',3)
        plot(t(1+discard:end-discard),repmat(-cap{1}.drive_jer(i),size(t(1+discard:end-discard))),'r','LineWidth',3)
    end
    title(['axis ' num2str(i) ' jerk'])
    xlabel('time(s)')
    ylabel('joint jerk(mm/s^3)')
end
end