function plotVelocity(v,omega)
subplot(2,1,1)
plot(v(:,1),'r')
hold on
plot(v(:,2),'g')
plot(v(:,3),'b')
% plot(F,'k','LineWidth',2)
subplot(2,1,2)
plot(omega(:,1),'r')
hold on
plot(omega(:,2),'g')
plot(omega(:,3),'b')
end

