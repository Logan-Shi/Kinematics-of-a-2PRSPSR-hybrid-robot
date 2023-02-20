close all;clear all;clc
filename = strcat('./data/','exp1.mat');
load(filename,'params');
plat = params;

surfix = strcat('./data/');
obj = 6;
method = 'FIR';
filename = strcat(surfix,'traj_',num2str(obj),plat.name,method,'.mat');
load(filename,'traj');
q = traj;

%% derivatives
figure()
plotDrive(q-q(1,:));

delta_t = 1e-3;
t = 0:delta_t:delta_t*size(q,1)-delta_t;
figure()
[dq,ddq,dddq] = plotDriveDrv(t,q);
sgtitle('drive derivatives')

%% animation
pose0 = [0,0,50,0,0,1];
[p(1,:),o(1,:)] = fkineCNC(q(1,:),plat,pose0);
for i = 2:size(q,1)
    [p(i,:),o(i,:)] = fkineCNC(q(i,:),plat,[p(i-1,:),o(i-1,:)]);
end
%%
fig = figure;
counter = 1;
delay_time = 0.05; % 20 fps;
play_speed = 4;
im = cell(1,1);
for i = 1:play_speed*delay_time/delta_t:size(q,1)
    plot2PRSPSR(p(i,:),o(i,:),params)
    axis equal
    view(14,23)
    drawnow
    F=getframe(fig);
    im{counter}=frame2im(F);
    counter = counter + 1;
%     pause(0.1)
    clf;
end
close all;

%% save gif
filename = strcat(surfix,'traj_',num2str(obj),plat.name,'FIR','.gif');
for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',1);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',delay_time);
    end
end