function dist = distOnSphere(O,O2)
if nargin < 2
    O1 = O(1,:)/norm(O(1,:));
    O2 = O(2,:)/norm(O(2,:));
else
    O1 = O/norm(O);
    O2 = O2/norm(O2);
end

cos_value = min(1,max(-1,dot(O1,O2)));
dist = acos(cos_value);
end