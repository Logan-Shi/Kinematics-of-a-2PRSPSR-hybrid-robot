function df = FDM3Diff1(f,t,h)
if nargin < 3
    h = 0.01;
end
df = zeros(length(t),size(f(t(1)),2));
for i = 2:length(t)-1
    df(i,:) = (-f(t(i)-h)+f(t(i)+h))/2/h;
end
df(1,:) = (-3*f(t(1))+4*f(t(1)+h)-f(t(1)+2*h))/2/h;
df(end,:) = (3*f(t(end))-4*f(t(end)-h)+f(t(end)-3*h))/2/h;
end
% reference: https://web.media.mit.edu/~crtaylor/calculator.html