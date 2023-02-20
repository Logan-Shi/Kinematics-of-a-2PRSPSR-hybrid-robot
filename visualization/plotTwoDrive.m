function plotTwoDrive(t1,q,t2,q2)
axes = size(q,2);
for i = 1:axes
    subplot(axes,1,i)
    plot(t1,q(:,i),'r','LineWidth',2)
    hold on
    plot(t2,q2(:,i),'b','LineWidth',2)
    
    xlabel('time(s)')
    ylabel('joint position(mm)')
    title(['axis ' num2str(i) ' pos'])
end
end