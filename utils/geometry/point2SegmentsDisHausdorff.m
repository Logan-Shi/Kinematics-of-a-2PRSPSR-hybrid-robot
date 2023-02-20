function [error,P_s] = point2SegmentsDisHausdorff(p,P)
error = inf+zeros(size(P,1)-2,1);
P_s = zeros(size(P,1)-2,size(P,2));
for i = 2:size(P,1)-1
    for j = 1:size(p,1)
        
        errori = norm(P(i,:)-p(j,:));
        if errori<error(i-1)
            error(i-1) = errori;
            P_s(i-1,:) = p(j,:);
%         else
%             break;
        end
    end
end
end

