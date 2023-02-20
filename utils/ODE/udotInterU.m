function udotu = udotInterU(x,udot,ut)
    if x<0 || x>1
        udotu = 0;
    else
        udotu = spline(linspace(0,1,length(udot)),udot,x);
        udotumin = spline(linspace(0,1,length(udot)),udot,ut);
        udotu = max(udotu,udotumin);
    end
end