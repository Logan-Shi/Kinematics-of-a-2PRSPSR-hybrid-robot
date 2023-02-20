function plotBlocks(blocks)
blocks_size = length(blocks);
for k = 1:blocks_size
    subplot(2,1,1)
    plot(blocks{k}.t,blocks{k}.Fkt,'k','LineWidth',2)
    hold on
    plot(blocks{k}.t,blocks{k}.vt(:,1),'r')
    plot(blocks{k}.t,blocks{k}.vt(:,2),'g')
    plot(blocks{k}.t,blocks{k}.vt(:,3),'b')
    ylabel('feed(mm/s)')
    xlabel('time(ms)')
    subplot(2,1,2)
    plot(blocks{k}.t,blocks{k}.Omegakt,'k','LineWidth',2)
    hold on
    plot(blocks{k}.t,blocks{k}.omegaxt,'r')
    plot(blocks{k}.t,blocks{k}.omegayt,'g')
    plot(blocks{k}.t,blocks{k}.omegazt,'b')
    ylabel('feed(rad/s)')
    xlabel('time(ms)')
end
set(gcf,'color','w');
end