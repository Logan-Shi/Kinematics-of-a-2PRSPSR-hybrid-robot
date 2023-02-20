function ut = calcUt(t,udot)
%ODE求解dudt=f(u)
ut = zeros(1,length(t));
ut(2) = t(2)/100;%初始静止，给一个扰动
f = @(x) udotInterU(x,udot,ut(2));

h = t(2)-t(1);
for i = 2:length(ut)-1
%     yi = ut(i);
%     k1 = f(yi);
%     k2 = f(yi+h/2*k1);
%     k3 = f(yi+h/2*k2);
%     k4 = f(yi+h*k3);
%     ut(i+1) = yi+h/6*(k1+2*k2+2*k3+k4);
ut(i+1) = ut(i)+f(ut(i))*h;
end
end