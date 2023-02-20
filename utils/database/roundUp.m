function q = roundUp(A,B)
    rem = mod(A,B);
    if abs(rem-B)<1e-10
        rem = 0;
    end
    q = A-rem; % TODO: rounding down for now. feedrate can go up when time is not even multiple of Ts. 
end

