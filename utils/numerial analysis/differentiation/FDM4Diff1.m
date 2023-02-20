function df = FDM4Diff1(f,t,h)
if nargin < 3
    h = 0.01;
end
df = zeros(length(t),size(f(t(1)),2));
df(1,:) = (-11*f(t(1))+18*f(t(1)+h)-9*f(t(1)+2*h)+2*f(t(1)+3*h))/6/h;
df(2,:) = (-3*f(t(2))+6*f(t(2)+h)-f(t(2)+2*h)-2*f(t(2)-h))/6/h;
for i = 3:length(t)-2
    df(i,:) = (f(t(i)-2*h)-8*f(t(i)-h)+8*f(t(i)+h)-f(t(i)+2*h))/12/h;
end
df(end-1,:) = (3*f(t(end-1))-6*f(t(end-1)-h)+f(t(end-1)-2*h)+2*f(t(end-1)+h))/6/h;
df(end,:) = (11*f(t(end))-18*f(t(end)-h)+9*f(t(end)-2*h)-2*f(t(end)-3*h))/6/h;
end
% reference: https://web.media.mit.edu/~crtaylor/calculator.html