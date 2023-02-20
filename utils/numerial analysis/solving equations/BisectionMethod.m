function output = BisectionMethod(f,int,TOL)
a = int(1); b = int(2);
if f(a)*f(b)>0
    warning('Bisection should start with different sign')
    output = fzero(f,int(1));
else
    while (b-a)/2 > TOL
        c = (a+b)/2;
        fc=f(c);
        if (fc == 0)
            output = c;
            break;
        end
        
        if sign(fc) == sign(f(b))
            b = c;
        else
            a = c;
        end
        output = (a+b)/2;
    end
end