function error = point2SegmentsDis(p,P)
error = inf;
for i = 2:length(P)-1
    error1 = point2LineDis(p,P(i,:),P(i+1,:));
    error2 = point2LineDis(p,P(i-1,:),P(i,:));
    errori = min(error1,error2);
    if errori<error
        error = errori;
    end
end
end

