function traj = convertFromBeckhoff(traj_new,params)
% home_position = [76.724218527476      29.8603709538778     -65.5402763684591     -66.5550271670024     -57.5384285052617];
home_position = params.home_position;
traj_new = traj_new - home_position;
q0 = ikineCNC([0,0,0],[0,0,1],params);
% y
traj(:,5) = q0(5) + traj_new(:,2); % axis 2
% x
traj(:,4) = q0(4) + traj_new(:,1); % axis 1
% q3
traj(:,3) = q0(3) - traj_new(:,4) - params.start_height; % q3 axis 4
% q2
traj(:,2) = q0(2) - traj_new(:,5) - params.start_height; % q2 axis 5
% q1
traj(:,1) = q0(1) - traj_new(:,3) - params.start_height; % q1 axis 3
end