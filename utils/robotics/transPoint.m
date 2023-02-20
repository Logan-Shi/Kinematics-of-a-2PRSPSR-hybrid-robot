function p = transPoint(p0,T)
p = zeros(size(p0));
for i = 1:size(p0,1)
    pi = ones(4,1);
    pi(1) = p0(i,1);
    pi(2) = p0(i,2);
    pi(3) = p0(i,3);
    pi = T*pi;
    p(i,:) = pi(1:3)';
end
end