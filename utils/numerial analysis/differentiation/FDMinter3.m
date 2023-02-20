function df = FDMinter3(t,f)
df = zeros(length(t),size(f,2));
h = t(2)-t(1);
for i = 2:length(t)-1
    df(i,:) = (-f(i-1,:)+f(i+1,:))/2/h;
end
df(1,:) = (-11*f(1,:)+18*f(2,:)-9*f(3,:)+2*f(4,:))/6/h;
df(end,:) = (11*f(end,:)-18*f(end-1,:)+9*f(end-2,:)-2*f(end-3,:))/6/h;
end
% reference: https://web.media.mit.edu/~crtaylor/calculator.html