function [out,R] = romberg(f,a,b,TOL)
% R is tableau
    R(1,1) = (b-a)/2*(f(a)+f(b));
    j = 2;
    isContinue = true;
    while isContinue
        R = romberg_base(f,a,b,R,j);
        diff = abs(R(j,j) - R(j-1,j-1));
        isContinue = (diff>TOL);
        if j>10 && isContinue
            isContinue = false;
            warning(['pre-exit with accuracy of' num2str(diff)]);
        end
        j = j + 1;
    end
    out = R(j-1,j-1);
end

function [R] = romberg_base(f,a,b,R,i)
    for j = 1:i-1
        h = (b-a)/2^(i-1);
        A = 0;
        for k = 1:2^(i-2)
            A = A + f(a+(2*k-1)*h);
        end
        R(i,j) = R(i-1,j)/2+h*A;
    end
    R(i,i) = (4^(i-1)*R(i,i-1)-R(i-1,i-1))/(4^(i-1)-1);
end