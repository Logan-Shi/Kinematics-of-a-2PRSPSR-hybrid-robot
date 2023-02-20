function plotFeed(P,O,feed,omega,p,o,plat)
figure()
% tool positions in WCS
plot5_axisTraj(P,O,repmat('k',[size(P,1),1]),40,[],[]); % position curve.
interval = 1; % plot the tool path every interval points.
colorLow = [0.0, 0.0, 1.0];
colorLow2 = [0.2, 0.0, 0.8];
colorHigh = [1.0, 0.0, 0.0];
feedLow = 0;%min(feed);
feedHigh = 20;%max(feed);
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
        plot5_axisTraj(p(i,:),o(i,:),col,10,[],[]); % position curve.
        hold on;
    end
end
hold off;
axis equal;
grid off;
shading flat;
cb = colorbar('Limits', [feedLow, feedHigh]);
cb.Label.String = 'feedrate (mm/s)';
cb.Label.FontSize = 14;
caxis([feedLow, feedHigh]); % colormap map the value between [feedLow, feedHigh] linearly by colormap
set(gcf, 'Colormap',cmap);
xlabel('x(mm)','FontSize',14)
ylabel('y(mm)','FontSize',14)
zlabel('z(mm)','FontSize',14)
axes('Position',[.3 .6 .4 .4])
box on

% tool orientation
% plot3dPointsOnSphere(O);

feedLow = 0;%min(omega);
feedHigh = 0.1;%max(omega);
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
% plot the iso-curve for k-component.
num_iso = 200;
k_iso = linspace(min(o(:,3)),max(o(:,3)),5);
for ii = 1 : length(k_iso)
    i_iso = linspace(min(o(:,1)),max(o(:,1)), num_iso);
    j_iso = sqrt(1 - i_iso.^2-k_iso(ii)^2);
    hold on
    plot3(i_iso, -j_iso, repmat(k_iso(ii),size(i_iso)), 'k-.');
    plot3(i_iso, j_iso, repmat(k_iso(ii),size(i_iso)), 'k-.');
end
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
end