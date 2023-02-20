function i_query = queryInSeq(u,us)
if u<0 || u>us(end)+1e-3
    warning('invalid query')
    i_query = inf;
else
    for i_query = 1:length(us)-1
        if u >= us(i_query) && u <= us(i_query+1)
            break
        end
    end
end
end