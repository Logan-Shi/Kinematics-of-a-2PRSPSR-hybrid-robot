function [curvature] = getCurvature(v,a)
curvature = min(norm(cross(v,a))/norm(v)^3,400);
end

