function ddf = FDM4Diff2(f,t,h)
if nargin < 3
    h = 0.01;
end
ddf = zeros(length(t),size(f(t(1)),2));
ddf(1,:) = (2*f(t(1))-5*f(t(1)+h)+4*f(t(1)+2*h)-f(t(1)+3*h))/h/h;
ddf(2,:) = (2*f(t(2))-5*f(t(2)+h)+4*f(t(2)+2*h)-f(t(2)+3*h))/h/h;
for i = 3:length(t)-2
    ddf(i,:) = (-f(t(i)-2*h)+16*f(t(i)-h)-30*f(t(i))+16*f(t(i)+h)-f(t(i)+2*h))/12/h/h;
end
ddf(end-1,:) = (2*f(t(end-1))-5*f(t(end-1)-h)+4*f(t(end-1)-2*h)-f(t(end-1)-3*h))/h/h;
ddf(end,:) = (2*f(t(end))-5*f(t(end)-h)+4*f(t(end)-2*h)-f(t(end)-3*h))/h/h;
end
% reference: https://web.media.mit.edu/~crtaylor/calculator.html