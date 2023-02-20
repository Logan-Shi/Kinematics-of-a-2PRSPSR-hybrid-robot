function plotTwoFeed(P,O,feed,omega,p,o,feed2,omega2,p2,o2)
max_feed = 20;%max([feed;feed2]);
max_omega = 0.1;%max([omega;omega2]);
tool_length = 40;
figure()
% tool positions in WCS
subplot(4,1,1)
plot5_axisTraj(P,O,repmat('k',[size(P,1),1]),tool_length*1.2,[],[]); % position curve.
hold on
interval = 1; % plot the tool path every interval points.
colorLow = [0.0, 0.0, 1.0];
colorLow2 = [0.2, 0.0, 0.8];
colorHigh = [1.0, 0.0, 0.0];
feedLow = 0;%min(feed);
feedHigh = max_feed;
feedDelta = feedHigh - feedLow;
numColor = 256;
% color map
cmap1 = [linspace(colorLow(1), colorLow2(1), numColor/2)', linspace(colorLow(2), colorLow2(2), numColor/2)',...
    linspace(colorLow(3), colorLow2(3), numColor/2)'];
cmap2 = [linspace(colorLow2(1), colorHigh(1), numColor/2)', linspace(colorLow2(2), colorHigh(2), numColor/2)',...
    linspace(colorLow2(3), colorHigh(3), numColor/2)'];
cmap = [cmap1;cmap2];
for i = 1 : size(p,1)
    if mod(i, interval) == 0
        alpha = (feed(i) - feedLow) / feedDelta;
        indexColor = round(alpha*numColor) + 1;
        if indexColor > numColor
            indexColor = numColor;
        end
        col = cmap(indexColor, :);
        plot5_axisTraj(p(i,:),o(i,:),col,tool_length,[],[]); % position curve.
        hold on;
    end
end
hold off;
axis equal;
xlim([min(p(:,1)), max(p(:,1))]);
ylim([min(p(:,2)), max(p(:,2))]);
zlim([min(p(:,3)), max(p(:,3))+tool_length*1.2]);
grid off;
% shading flat;
cb = colorbar('Limits', [feedLow, feedHigh]);
cb.Label.String = 'feedrate (mm/s)';
cb.Label.FontSize = 14;
caxis([feedLow, feedHigh]); % colormap map the value between [feedLow, feedHigh] linearly by colormap
set(gcf, 'Colormap',cmap);
xlabel('x(mm)','FontSize',14)
ylabel('y(mm)','FontSize',14)
zlabel('z(mm)','FontSize',14)
% xticks([-150 -130])
% zticks([10 30 50])
% view(85,45)
view(45,15)
subplot(4,1,3)
% view(0,0)
% tool orientation
[X,Y,Z] = sphere();
scale = 1;
mesh(X*scale,Y*scale,Z*scale,'LineStyle','-','EdgeColor',[0.8,0.8,0.8],'FaceAlpha',1);
hold on

feedLow = 0;%min(omega);
feedHigh = max_omega;
feedDelta = feedHigh - feedLow;

for i = 1 : size(o,1)-1
    alpha = (omega(i) - feedLow) / feedDelta;
    indexColor = round(alpha*numColor) + 1;
    if indexColor > numColor
        indexColor = numColor;
    end
    col = cmap(indexColor, :);
    plot3([o(i,1), o(i+1,1)], ...
        [o(i,2), o(i+1,2)], ...
        [o(i,3), o(i+1,3)], ...
        'Color', col, 'LineWidth', 5);
    hold on;
end
grid off
xlabel('$o_{z_1}^w$','Interpreter','latex','FontSize',14)
ylabel('$o_{z_2}^w$','Interpreter','latex','FontSize',14)
zlabel('$o_{z_3}^w$','Interpreter','latex','FontSize',14)
hold off;
axis equal;
xlim([min(o(:,1)), max(o(:,1))]);
ylim([min(o(:,2)), max(o(:,2))]);
zlim([min(o(:,3)), max(o(:,3))]);
cb = colorbar('Limits', [feedLow, feedHigh]);
cb.Label.String = '$\Omega$(rad/s)';
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;
caxis([feedLow, feedHigh]); % colormap map the value between [feedLow, feedHigh] linearly by colormap
set(gcf, 'Colormap',cmap);
set(gca, 'FontName', '黑体');
view(0,90)

subplot(4,1,2)
p = p2;o = o2;feed = feed2;omega = omega2;
% tool positions in WCS
plot5_axisTraj(P,O,repmat('k',[size(P,1),1]),tool_length*1.2,[],[]); % position curve.
hold on
interval = 1; % plot the tool path every interval points.
colorLow = [0.0, 0.0, 1.0];
colorLow2 = [0.2, 0.0, 0.8];
colorHigh = [1.0, 0.0, 0.0];
feedLow = 0;%min(feed);
feedHigh = max_feed;
feedDelta = feedHigh - feedLow;
numColor = 256;
% color map
cmap1 = [linspace(colorLow(1), colorLow2(1), numColor/2)', linspace(colorLow(2), colorLow2(2), numColor/2)',...
    linspace(colorLow(3), colorLow2(3), numColor/2)'];
cmap2 = [linspace(colorLow2(1), colorHigh(1), numColor/2)', linspace(colorLow2(2), colorHigh(2), numColor/2)',...
    linspace(colorLow2(3), colorHigh(3), numColor/2)'];
cmap = [cmap1;cmap2];
for i = 1 : size(p,1)
    if mod(i, interval) == 0
        alpha = (feed(i) - feedLow) / feedDelta;
        indexColor = round(alpha*numColor) + 1;
        if indexColor > numColor
            indexColor = numColor;
        end
        col = cmap(indexColor, :);
        plot5_axisTraj(p(i,:),o(i,:),col,tool_length,[],[]); % position curve.
        hold on;
    end
end
hold off;
axis equal;
xlim([min(p(:,1)), max(p(:,1))]);
ylim([min(p(:,2)), max(p(:,2))]);
zlim([min(p(:,3)), max(p(:,3))+tool_length*1.2]);
grid off;
% shading flat;
cb = colorbar('Limits', [feedLow, feedHigh]);
cb.Label.String = 'feedrate (mm/s)';
cb.Label.FontSize = 14;
caxis([feedLow, feedHigh]); % colormap map the value between [feedLow, feedHigh] linearly by colormap
set(gcf, 'Colormap',cmap);
xlabel('x(mm)','FontSize',14)
ylabel('y(mm)','FontSize',14)
zlabel('z(mm)','FontSize',14)
% xticks([-150 -130])
% zticks([10 30 50])
% view(85,45)
view(45,15)
subplot(4,1,4)
% view(0,0)

% tool orientation
[X,Y,Z] = sphere();
scale = 1;
mesh(X*scale,Y*scale,Z*scale,'LineStyle','-','EdgeColor',[0.8,0.8,0.8],'FaceAlpha',1);
hold on
feedLow = 0;%min(omega);
feedHigh = max_omega;
feedDelta = feedHigh - feedLow;

for i = 1 : size(o,1)-1
    alpha = (omega(i) - feedLow) / feedDelta;
    indexColor = round(alpha*numColor) + 1;
    if indexColor > numColor
        indexColor = numColor;
    end
    col = cmap(indexColor, :);
    plot3([o(i,1), o(i+1,1)], ...
        [o(i,2), o(i+1,2)], ...
        [o(i,3), o(i+1,3)], ...
        'Color', col, 'LineWidth', 5);
    hold on;
end
grid off
xlabel('$o_{z_1}^w$','Interpreter','latex','FontSize',18)
ylabel('$o_{z_2}^w$','Interpreter','latex','FontSize',18)
zlabel('$o_{z_3}^w$','Interpreter','latex','FontSize',18)
hold off;
axis equal;
xlim([min(o(:,1)), max(o(:,1))]);
ylim([min(o(:,2)), max(o(:,2))]);
zlim([min(o(:,3)), max(o(:,3))]);
cb = colorbar('Limits', [feedLow, feedHigh]);
cb.Label.String = '$\Omega$(rad/s)';
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;
caxis([feedLow, feedHigh]); % colormap map the value between [feedLow, feedHigh] linearly by colormap
set(gcf, 'Colormap',cmap);
set(gca, 'FontName', '黑体');
view(0,90)
end