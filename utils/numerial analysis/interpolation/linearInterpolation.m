function [p,o] = linearInterpolation(P,O,n)
if size(P,1)~=size(O,1)
    warning('can not smooth if P and O sizes are different')
end
point_size = size(P,1);
for i = 1:point_size
    O(i,:) = O(i,:)/norm(O(i,:));
end
p = [];
o = [];
for i = 1:point_size - 1
    p_i = interLinear(P(i,:),P(i+1,:),n*(2*point_size-3)/(point_size-1));
    o_i = interSLinear(O(i,:),O(i+1,:),n*(2*point_size-3)/(point_size-1));
    p = [p;p_i];
    o = [o;o_i];
end
end