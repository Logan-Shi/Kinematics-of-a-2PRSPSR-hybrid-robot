function dis = point2LineDisOnSphere(p,q,r)
% p to segment q,r
num = dot(p,cross(q,r));
den = norm(cross(q,r));
dis = abs(asin(num/den));
end

