function [error,O_s] = point2SegmentsDisHausdorffOnSphere(o,O)
error = inf+zeros(length(O)-2,1);
O_s = zeros(length(O)-2,size(O,2));
for i = 2:length(O)-1
    for j = 1:length(o)
        
        errori = distOnSphere(O(i,:),o(j,:));
        error_f(i,j) = distOnSphere(O(i,:),o(j,:));
        if errori<=error(i-1)
            error(i-1) = errori;
            O_s(i-1,:) = o(j,:);
%         else
%             break;
        end
    end
end
end

