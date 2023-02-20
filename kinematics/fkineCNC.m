function [p,o] = fkineCNC(q,plat,pose0)
num = size(q,1);
if num == 1
    [p,o] = fkineSinglePoint(q,plat,pose0);
else
    if nargin < 3
        pose0 = zeros(num,6);
    end
    p = zeros(num,3);
    o = zeros(num,3);

    for i = 1:num
        [pi,oi] = fkineSinglePoint(q(i,:),plat,pose0);
        p(i,:) = pi;
%         oi = oi/norm(oi);
        o(i,:) = oi;
    end
end
end

function [p,o] = fkineSinglePoint(q,plat,pose0)
if nargin < 3
    pose0 = zeros(1,6);
end

if strcmpi(plat.name,'PKM')
%     options = optimset('Display','off','Algorithm', 'levenberg-marquardt','ScaleProblem','jacobian');
    options = optimset('Display','off','Algorithm', 'levenberg-marquardt');
    pose = fsolve(@(pose) ikinePKM(pose,q,plat),pose0,options);
    p = pose(:,1:3);
    o = pose(:,4:6);
    o = o/norm(o);
else
    if strcmpi(plat.name,'spindle')
        T = fkineACspindle(q);
        o = T(1:3,3)';
        p = T(1:3,4)';
        o = o/norm(o);
    else
        if strcmpi(plat.name,'test')
            p = [q(1)*q(2),q(2),q(3)];
            o = [0,0,1];
        end
    end
end
end

function output = ikinePKM(pose,q,params)
p = pose(:,1:3);
o = pose(:,4:6);
o = o/norm(o);
output = ikine2PRSPSR(p,o,params) - q;
end
