function plotDrive(q)
axes = size(q,2);
for i = 1:axes
    subplot(axes,1,i)
    plot(q(:,i))
    hold on
    title(['axis ' num2str(i) ' pos'])
end
sgtitle('pos in MCS')
end